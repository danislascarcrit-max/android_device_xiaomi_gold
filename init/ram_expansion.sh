#!/vendor/bin/sh
# Copyright (C) 2026 Palapa OS / Shinkai Project
# Dynamic zRAM / RAM Expansion backend for Xiaomi Redmi Note 13 5G (gold)

ZRAM_DEV="/dev/block/zram0"
ZRAM_SYS="/sys/block/zram0"

# Wait briefly if zram0 sysfs or block node is still settling during early boot.
wait_count=0
while [ ! -e "${ZRAM_SYS}/disksize" ] || [ ! -b "${ZRAM_DEV}" ]; do
    wait_count=$((wait_count + 1))
    if [ "${wait_count}" -ge 10 ]; then
        exit 0
    fi
    /vendor/bin/toybox_vendor sleep 1
done

is_zram_swap_active() {
    [ -r /proc/swaps ] || return 1
    while IFS= read -r line; do
        case "${line}" in
            *zram0*) return 0 ;;
        esac
    done < /proc/swaps
    return 1
}

read_disksize() {
    if [ -r "${ZRAM_SYS}/disksize" ]; then
        IFS= read -r val < "${ZRAM_SYS}/disksize" 2>/dev/null || val=""
        echo "${val}"
    fi
}

map_target_bytes() {
    case "$1" in
        0|off|OFF|Off|false|FALSE|disable|disabled|DISABLED)
            echo "0"
            ;;
        2|2gb|2GB|2G|2048|2048M|2048m)
            echo "2147483648"
            ;;
        8|8gb|8GB|8G|8192|8192M|8192m)
            echo "8589934592"
            ;;
        16|16gb|16GB|16G|16384|16384M|16384m)
            echo "17179869184"
            ;;
        4|4gb|4GB|4G|4096|4096M|4096m|"")
            echo "4294967296"
            ;;
        *)
            echo "4294967296"
            ;;
    esac
}

apply_loop=0
while [ "${apply_loop}" -lt 5 ]; do
    apply_loop=$((apply_loop + 1))

    raw_val="$(/vendor/bin/toolbox getprop persist.vendor.ram_expansion 2>/dev/null || true)"
    target_bytes="$(map_target_bytes "${raw_val}")"
    cur_bytes="$(read_disksize)"

    # Idempotency check: skip teardown if already configured as requested.
    if [ "${target_bytes}" = "0" ]; then
        if [ "${cur_bytes}" = "0" ] && ! is_zram_swap_active; then
            [ -w /proc/sys/vm/swappiness ] && echo 0 > /proc/sys/vm/swappiness 2>/dev/null || true
            break
        fi
    else
        if [ "${cur_bytes}" = "${target_bytes}" ] && is_zram_swap_active; then
            [ -w /proc/sys/vm/swappiness ] && echo 100 > /proc/sys/vm/swappiness 2>/dev/null || true
            break
        fi
    fi

    # Deactivate swap only when zram0 is currently active.
    if is_zram_swap_active; then
        /vendor/bin/toybox_vendor swapoff "${ZRAM_DEV}" 2>/dev/null || true
        swapoff_wait=0
        while is_zram_swap_active && [ "${swapoff_wait}" -lt 10 ]; do
            swapoff_wait=$((swapoff_wait + 1))
            /vendor/bin/toybox_vendor sleep 1
        done
    fi

    # Reset zram0 cleanly with retry loop to avoid transient -EBUSY.
    reset_try=0
    while [ "${reset_try}" -lt 5 ]; do
        if echo 1 > "${ZRAM_SYS}/reset" 2>/dev/null; then
            break
        fi
        reset_try=$((reset_try + 1))
        /vendor/bin/toybox_vendor sleep 1
    done

    if [ "${target_bytes}" = "0" ]; then
        if [ -w /proc/sys/vm/swappiness ]; then
            echo 0 > /proc/sys/vm/swappiness 2>/dev/null || true
        fi
    else
        if [ -w "${ZRAM_SYS}/max_comp_streams" ]; then
            echo 8 > "${ZRAM_SYS}/max_comp_streams" 2>/dev/null || true
        fi
        if [ -w "${ZRAM_SYS}/comp_algorithm" ]; then
            echo lz4 > "${ZRAM_SYS}/comp_algorithm" 2>/dev/null || true
        fi
        if echo "${target_bytes}" > "${ZRAM_SYS}/disksize" 2>/dev/null; then
            /vendor/bin/toybox_vendor mkswap "${ZRAM_DEV}" >/dev/null 2>&1 || true
            /vendor/bin/toybox_vendor swapon -p 32758 "${ZRAM_DEV}" 2>/dev/null || \
                /vendor/bin/toybox_vendor swapon "${ZRAM_DEV}" 2>/dev/null || true
            if [ -w /proc/sys/vm/swappiness ]; then
                echo 100 > /proc/sys/vm/swappiness 2>/dev/null || true
            fi
        fi
    fi

    # Re-check in case persist.vendor.ram_expansion changed while running.
    latest_val="$(/vendor/bin/toolbox getprop persist.vendor.ram_expansion 2>/dev/null || true)"
    latest_bytes="$(map_target_bytes "${latest_val}")"
    if [ "${latest_bytes}" = "${target_bytes}" ]; then
        break
    fi
done

exit 0
