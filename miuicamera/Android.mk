#
# HyperOS 3.0 MiuiCamera 6.1 (OS3.0.7.0.VNQCNXM) — prebuilt system priv-app
# Used by device/xiaomi/gold (Redmi Note 13 5G / gold & iron)
#
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := MiuiCamera
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := prebuilt/MiuiCamera.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_PRIVILEGED_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_TARGET_ARCH := arm64
LOCAL_CHECK_ELF_FILES := false
LOCAL_REPLACE_PREBUILT_APK_INSTALLED := $(LOCAL_PATH)/prebuilt/MiuiCamera.apk
LOCAL_OVERRIDES_PACKAGES := Aperture Camera2 Snap Jelly2
LOCAL_PREBUILT_JNI_LIBS := \
    $(patsubst $(LOCAL_PATH)/%,%,$(wildcard $(LOCAL_PATH)/prebuilt/libs/MiuiCamera/*.so))
include $(BUILD_PREBUILT)
