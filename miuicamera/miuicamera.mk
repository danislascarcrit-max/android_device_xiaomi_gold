#
# Product fragment: HyperOS 3.0 MiuiCamera 6.1 (OS3.0.7.0.VNQCNXM) for device/xiaomi/gold
#
MIUICAMERA_PATH := device/xiaomi/gold/miuicamera

PRODUCT_PACKAGES += \
    MiuiCamera

# Permissions, hidden API whitelist, and public libraries config
PRODUCT_COPY_FILES += \
    $(MIUICAMERA_PATH)/permissions/privapp-permissions-miuicamera.xml:system/etc/permissions/privapp-permissions-miuicamera.xml \
    $(MIUICAMERA_PATH)/permissions/privapp-permissions-miuicamera.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-miuicamera.xml \
    $(MIUICAMERA_PATH)/permissions/miuicamera-hiddenapi-package-whitelist.xml:system/etc/sysconfig/miuicamera-hiddenapi-package-whitelist.xml \
    $(MIUICAMERA_PATH)/permissions/default-permissions-miuicamera.xml:system/etc/default-permissions/default-permissions-miuicamera.xml \
    $(MIUICAMERA_PATH)/permissions/default-permissions-miuicamera.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default-permissions-miuicamera.xml \
    $(MIUICAMERA_PATH)/permissions/public.libraries-xiaomi.txt:system/etc/public.libraries-xiaomi.txt

# Device features XML for gold and iron variants
PRODUCT_COPY_FILES += \
    $(MIUICAMERA_PATH)/device_features/gold.xml:system/etc/device_features/gold.xml \
    $(MIUICAMERA_PATH)/device_features/iron.xml:system/etc/device_features/iron.xml \
    $(MIUICAMERA_PATH)/device_features/gold.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/device_features/gold.xml \
    $(MIUICAMERA_PATH)/device_features/iron.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/device_features/iron.xml

# System / System_ext 64-bit Camera JNI & ISP / ATMS / BGService libraries from OS3.0.7.0.VNQCNXM
PRODUCT_COPY_FILES += \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/libcamera_algoup_jni.xiaomi.so:system/lib64/libcamera_algoup_jni.xiaomi.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/libcamera_ispinterface_jni.xiaomi.so:system/lib64/libcamera_ispinterface_jni.xiaomi.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/libcamera_mianode_jni.xiaomi.so:system/lib64/libcamera_mianode_jni.xiaomi.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/libmtkisp_metadata_sys.so:system/lib64/libmtkisp_metadata_sys.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/vendor.mediatek.hardware.camera.isphal-V1-ndk.so:system/lib64/vendor.mediatek.hardware.camera.isphal-V1-ndk.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/vendor.mediatek.hardware.camera.isphal@1.0.so:system/lib64/vendor.mediatek.hardware.camera.isphal@1.0.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/vendor.mediatek.hardware.camera.atms-V1-ndk.so:system/lib64/vendor.mediatek.hardware.camera.atms-V1-ndk.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/vendor.mediatek.hardware.camera.atms@1.0.so:system/lib64/vendor.mediatek.hardware.camera.atms@1.0.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/libopencl-camera.so:system/lib64/libopencl-camera.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/libvirtualcamera_imageutils_jni.so:system/lib64/libvirtualcamera_imageutils_jni.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/libvirtualcamera_surfaceutils_jni.so:system/lib64/libvirtualcamera_surfaceutils_jni.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/vendor.xiaomi.hardware.aidlbgservice-V1-ndk.so:system/lib64/vendor.xiaomi.hardware.aidlbgservice-V1-ndk.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/vendor.xiaomi.hardware.bgservice@1.0.so:system/lib64/vendor.xiaomi.hardware.bgservice@1.0.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/libcamera_algoup_jni.xiaomi.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/libcamera_algoup_jni.xiaomi.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/libcamera_ispinterface_jni.xiaomi.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/libcamera_ispinterface_jni.xiaomi.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/libcamera_mianode_jni.xiaomi.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/libcamera_mianode_jni.xiaomi.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/libmtkisp_metadata_sys.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/libmtkisp_metadata_sys.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/vendor.mediatek.hardware.camera.isphal-V1-ndk.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/vendor.mediatek.hardware.camera.isphal-V1-ndk.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/vendor.mediatek.hardware.camera.isphal@1.0.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/vendor.mediatek.hardware.camera.isphal@1.0.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/vendor.mediatek.hardware.camera.atms-V1-ndk.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/vendor.mediatek.hardware.camera.atms-V1-ndk.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/vendor.mediatek.hardware.camera.atms@1.0.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/vendor.mediatek.hardware.camera.atms@1.0.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/libopencl-camera.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/libopencl-camera.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/libvirtualcamera_imageutils_jni.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/libvirtualcamera_imageutils_jni.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/libvirtualcamera_surfaceutils_jni.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/libvirtualcamera_surfaceutils_jni.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/vendor.xiaomi.hardware.aidlbgservice-V1-ndk.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/vendor.xiaomi.hardware.aidlbgservice-V1-ndk.so \
    $(MIUICAMERA_PATH)/prebuilt/libs/MiuiCamera/vendor.xiaomi.hardware.bgservice@1.0.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/vendor.xiaomi.hardware.bgservice@1.0.so
