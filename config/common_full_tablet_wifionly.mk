# Inherit common DEMENTED stuff
$(call inherit-product, vendor/DEMENTED/config/common_full.mk)

# BT config
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf
