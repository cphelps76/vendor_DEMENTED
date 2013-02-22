# Inherit device configuration for VZW Droid RAZR.
$(call inherit-product, device/motorola/spyder/full_spyder.mk)

# Inherit common product files.
$(call inherit-product, vendor/DEMENTED-Droid/products/common.mk)

# Inherit common Verizon Wireless Files
$(call inherit-product, vendor/DEMENTED-Droid/products/vzw.mk)

DEVICE_PACKAGE_OVERLAYS += vendor/DEMENTED-Droid/overlay/spyder

# DEMENTED-Droid-specific init file for SafeStrap
PRODUCT_COPY_FILES += \
    vendor/DEMENTED-Droid/proprietary/common/etc/init.local.rc:system/etc/rootfs/init.aokp.rc

# Setup device specific product configuration.
PRODUCT_NAME := DEMENTED_Droid_spyder
PRODUCT_BRAND := verizon
PRODUCT_DEVICE := spyder
PRODUCT_DEVICE_PREFIX := cdma
PRODUCT_MODEL := XT912
PRODUCT_MANUFACTURER := Motorola
PRODUCT_RELEASE_NAME := DROID RAZR
PRODUCT_SFX := vzw

PRODUCT_COPY_FILES +=  \
    vendor/DEMENTED-Droid/proprietary/spyder/bootanimation.zip:system/media/bootanimation.zip

