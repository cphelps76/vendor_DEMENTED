# Inherit AOSP device configuration for jflteatt
$(call inherit-product, device/samsung/jflteatt/full_jflteatt.mk)

# Inherit common cdma apns
$(call inherit-product, vendor/demented/configs/gsm.mk)

# Inherit common product files.
$(call inherit-product, vendor/demented/configs/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := demented_jflteatt
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := jflteatt
PRODUCT_MODEL := SGH-I337
PRODUCT_MANUFACTURER := Samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jflteuc TARGET_DEVICE=jflteatt BUILD_FINGERPRINT="samsung/jflteuc/jflteatt:4.2.2/JDQ39/I337UCUAMDL:user/release-keys" PRIVATE_BUILD_DESC="jflteuc-user 4.2.2 JDQ39 I337UCUAMDL release-keys"

# boot animation
PRODUCT_COPY_FILES += \
       vendor/aokp/prebuilt/bootanimation/xxhdpi/bootanimation.zip:system/media/bootanimation.zip
