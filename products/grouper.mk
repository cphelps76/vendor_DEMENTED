# Inherit AOSP device configuration for grouper.
$(call inherit-product, device/asus/grouper/full_grouper.mk)

# Inherit common product files.
$(call inherit-product, vendor/DEMENTED-Droid/products/common.mk)

# Grouper Overlays.
PRODUCT_PACKAGE_OVERLAYS += vendor/DEMENTED-Droid/overlay/grouper

# Setup device specific product configuration.
PRODUCT_NAME := DEMENTED_Droid_grouper
PRODUCT_BRAND := Asus
PRODUCT_DEVICE := grouper
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := Asus

PRODUCT_BUILD_PROP_OVERRIDES := PRODUCT_NAME=nakasi BUILD_FINGERPRINT=google/nakasi/grouper:4.2.2/JDQ39/405518:user/release-keys PRIVATE_BUILD_DESC="nakasi-user 4.2.2 JDQ39 405518 release-keys" BUILD_NUMBER=405518

# Inherit common build.prop overrides
-include vendor/DEMENTED-Droid/products/common_versions.mk

# DEMENTED-Droid SPEED FREEK init.d and build.prop tweaks
include vendor/DEMENTED-Droid/products/speed_freek_grouper.mk

# Additional DEMENTED-Droid Apps
PRODUCT_PACKAGES += \
    Torch

# Copy toro specific prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/DEMENTED-Droid/proprietary/grouper/media/bootanimation.zip:system/media/bootanimation.zip \
    vendor/DEMENTED-Droid/proprietary/tuna/media/audio/notifications/Nexus.mp3:system/media/audio/notifications/Nexus.mp3 \
    vendor/DEMENTED-Droid/proprietary/tuna/media/audio/notifications/Simple_High.mp3:system/media/audio/notifications/Simple_High.mp3 \
    vendor/DEMENTED-Droid/proprietary/tuna/media/audio/ringtones/Halo.m4a:system/media/audio/ringtones/Halo.m4a \
    vendor/DEMENTED-Droid/proprietary/common/app/Wallet.apk:system/app/Wallet.apk

# Inherit media effect blobs
-include vendor/DEMENTED-Droid/products/common_media_effects.mk

# Inherit Face lock security blobs
-include vendor/DEMENTED-Droid/products/common_facelock.mk

# Inherit drm blobs
-include vendor/DEMENTED-Droid/products/common_drm_phone.mk

# Inherit speech recognition blobs
-include vendor/DEMENTED-Droid/products/common_speech_recognition.mk
