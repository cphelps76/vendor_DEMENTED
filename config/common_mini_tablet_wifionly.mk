# Inherit common DEMENTED stuff
$(call inherit-product, vendor/DEMENTED/config/common.mk)

# Bring in all audio files
include frameworks/base/data/sounds/NewAudio.mk

# Include DEMENTED audio files
include vendor/DEMENTED/config/demented_audio.mk

# BT config
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf
