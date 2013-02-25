# Inherit AOSP device configuration for toro.
$(call inherit-product, device/samsung/toro/full_toro.mk)

# Inherit common product files.
$(call inherit-product, vendor/DEMENTED-Droid/products/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := DEMENTED_Droid_toro
PRODUCT_BRAND := google
PRODUCT_DEVICE := toro
PRODUCT_MODEL := Galaxy Nexus
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES := PRODUCT_NAME=mysid BUILD_ID=JDQ39 BUILD_FINGERPRINT=google/mysid/toro:4.2.2/JDQ39/125147:user/release-keys PRIVATE_BUILD_DESC="mysid-user 4.2.2 JDQ39 125147 release-keys" BUILD_NUMBER=125147

# Inherit common build.prop overrides
-include vendor/DEMENTED-Droid/products/common_versions.mk

# Copy toro specific prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/DEMENTED-Droid/proprietary/tuna/app/Thinkfree.apk:system/app/Thinkfree.apk \
    vendor/DEMENTED-Droid/proprietary/tuna/media/bootanimation.zip:system/media/bootanimation.zip \
    vendor/DEMENTED-Droid/proprietary/tuna/media/audio/notifications/Nexus.mp3:system/media/audio/notifications/Nexus.mp3 \
    vendor/DEMENTED-Droid/proprietary/tuna/media/audio/notifications/Simple_High.mp3:system/media/audio/notifications/Simple_High.mp3 \
    vendor/DEMENTED-Droid/proprietary/tuna/media/audio/ringtones/Halo.m4a:system/media/audio/ringtones/Halo.m4a \
    vendor/DEMENTED-Droid/proprietary/common/app/Wallet.apk:system/app/Wallet.apk

# Copy vzw login 
PRODUCT_COPY_FILES +=  \
    vendor/DEMENTED-Droid/proprietary/toro/app/VerizonLogin.apk:system/app/VerizonLogin.apk \
    vendor/DEMENTED-Droid/proprietary/toro/lib/libmotricity.so:system/lib/libmotricity.so \
    vendor/DEMENTED-Droid/proprietary/toro/app/VerizonLogin.apk:system/app/VerizonSSO.apk \

# Inherit media effect blobs
-include vendor/DEMENTED-Droid/products/common_media_effects.mk

# Inherit Face lock security blobs
-include vendor/DEMENTED-Droid/products/common_facelock.mk

# Inherit drm blobs
-include vendor/DEMENTED-Droid/products/common_drm_phone.mk

# Inherit speech recognition blobs
-include vendor/DEMENTED-Droid/products/common_speech_recognition.mk


