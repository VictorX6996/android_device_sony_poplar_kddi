### PLATFORM
$(call inherit-product, device/sony/yoshino-common/platform.mk)
### PROPRIETARY VENDOR FILES
$(call inherit-product, vendor/sony/poplar_kddi/poplar_kddi-vendor.mk)

ifeq ($(WITH_FDROID),true)
$(call inherit-product, vendor/fdroid/fdroid-vendor.mk)
endif

DEVICE_PATH := device/sony/poplar_kddi

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# 復活 ConfigStore 服務
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.1-service

DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    device/sony/poplar_kddi/overlay/packages/apps/Settings\
    device/sony/yoshino-common/overlay/frameworks/base/packages/SystemUI\
    device/sony/poplar_kddi/overlay/packages/apps/SettingsGoogle

include $(DEVICE_PATH)/device/*.mk
