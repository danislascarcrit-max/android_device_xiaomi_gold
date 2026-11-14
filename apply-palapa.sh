#!/bin/bash
set -e
DEVICE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOP_DIR="$(cd "$DEVICE_DIR/../../.." && pwd)"

echo "==> Menerapkan UI PalapaOS Majapahit Edition (crDroid 17)..."
cp -rf "$DEVICE_DIR/palapa_ui/frameworks" "$TOP_DIR/"
cp -rf "$DEVICE_DIR/palapa_ui/packages" "$TOP_DIR/"

sed -i '/NavigationBarModeGesturalHiddenImeOverlay/d' "$TOP_DIR/frameworks/base/packages/overlays/Android.bp" 2>/dev/null || true

if ! grep -q "ENHANCED_POWER_MENU" "$TOP_DIR/frameworks/base/core/java/android/provider/Settings.java"; then
  sed -i '/public static final class System extends NameValueTable {/a \        /** @hide */\n        public static final String ENHANCED_POWER_MENU = "enhanced_power_menu";\n        /** @hide */\n        public static final String ADVANCED_REBOOT = "advanced_reboot";' "$TOP_DIR/frameworks/base/core/java/android/provider/Settings.java"
  sed -i '/public static final class Secure extends NameValueTable {/a \        /** @hide */\n        public static final String ENHANCED_POWER_MENU = "enhanced_power_menu";\n        /** @hide */\n        public static final String ADVANCED_REBOOT = "advanced_reboot";' "$TOP_DIR/frameworks/base/core/java/android/provider/Settings.java"
fi

echo "==> Berhasil! UI PalapaOS sudah terpasang lengkap."
