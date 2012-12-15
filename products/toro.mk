# Inherit AOSP device configuration for toro.
$(call inherit-product, device/samsung/toro/full_toro.mk)

# Inherit common product files.
$(call inherit-product, vendor/DEMENTED/products/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := DEMENTED_toro
PRODUCT_BRAND := google
PRODUCT_DEVICE := toro
PRODUCT_MODEL := Galaxy Nexus
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES := PRODUCT_NAME=mysid BUILD_FINGERPRINT="google/mysid/toro:4.1.1/JRO03O/424425:user/release-keys" PRIVATE_BUILD_DESC="mysid-user 4.1.1 JRO03O 424425 release-keys" BUILD_NUMBER=424425

# Inherit common build.prop overrides
-include vendor/DEMENTED/products/common_versions.mk

# Copy toro specific prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/DEMENTED/proprietary/tuna/app/Thinkfree.apk:system/app/Thinkfree.apk \
    vendor/DEMENTED/proprietary/tuna/media/bootanimation.zip:system/media/bootanimation.zip \
    vendor/DEMENTED/proprietary/tuna/app/Gallery2.apk:system/app/Gallery2.apk \
    vendor/DEMENTED/proprietary/tuna/media/audio/notifications/Nexus.mp3:system/media/audio/notifications/Nexus.mp3 \
    vendor/DEMENTED/proprietary/tuna/media/audio/notifications/Simple_High.mp3:system/media/audio/notifications/Simple_High.mp3 \
    vendor/DEMENTED/proprietary/tuna/media/audio/ringtones/Provincial_Synthetic.ogg:system/media/audio/ringtones/Provincial_Synthetic.ogg \
    vendor/DEMENTED/proprietary/common/app/Wallet.apk:system/app/Wallet.apk

# Copy vzw login 
PRODUCT_COPY_FILES +=  \
    vendor/DEMENTED/proprietary/toro/app/VerizonLogin.apk:system/app/VerizonLogin.apk \
    vendor/DEMENTED/proprietary/toro/lib/libmotricity.so:system/lib/libmotricity.so \
    vendor/DEMENTED/proprietary/toro/app/VerizonLogin.apk:system/app/VerizonSSO.apk \

# Inherit media effect blobs
-include vendor/DEMENTED/products/common_media_effects.mk

# Inherit Face lock security blobs
-include vendor/DEMENTED/products/common_facelock.mk

# Inherit drm blobs
-include vendor/DEMENTED/products/common_drm_phone.mk

# Inherit speech recognition blobs
-include vendor/DEMENTED/products/common_speech_recognition.mk


