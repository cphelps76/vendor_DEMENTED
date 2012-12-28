# Inherit AOSP device configuration for grouper.
$(call inherit-product, device/asus/grouper/full_grouper.mk)

# Inherit common product files.
$(call inherit-product, vendor/DEMENTED-Droid/products/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := DEMENTED_Droid_grouper
PRODUCT_BRAND := asus
PRODUCT_DEVICE := grouper
PRODUCT_MODEL := N7
PRODUCT_MANUFACTURER := asus

# Inherit common build.prop overrides
-include vendor/DEMENTED-Droid/products/common_versions.mk

# Copy toro specific prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/DEMENTED-Droid/proprietary/grouper/media/bootanimation.zip:system/media/bootanimation.zip \
    vendor/DEMENTED-Droid/proprietary/tuna/app/Gallery2.apk:system/app/Gallery2.apk \
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
