# Inherit AOSP device configuration for mako
$(call inherit-product, device/samsung/manta/full_manta.mk)

# Inherit common product files.
$(call inherit-product, vendor/DEMENTED-Droid/products/common.mk)

# Manta Overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/DEMENTED-Droid/overlay/manta

# Setup device specific product configuration
PRODUCT_NAME := aokp_manta
PRODUCT_BRAND := google
PRODUCT_DEVICE := manta
PRODUCT_MODEL := Nexus 10
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES := PRODUCT_NAME=mantaray BUILD_FINGERPRINT=google/mantaray/manta:4.2.1/JOP40D/533553:user/release-keys PRIVATE_BUILD_DESC="mantaray-user 4.2.1 JOP40D 533553 release-keys" BUILD_NUMBER=533553

# Inherit common build.prop overrides
-include vendor/DEMENTED-Droid/products/common_versions.mk

# DEMENTED-Droid SPEED FREEK init.d and build.prop tweaks
include vendor/DEMENTED-Droid/products/speed_freek_grouper.mk

# Additional DEMENTED-Droid Apps
PRODUCT_PACKAGES += \
    Torch

# Copy toro specific prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/DEMENTED-Droid/proprietary/manta/media/bootanimation.zip:system/media/bootanimation.zip \
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
