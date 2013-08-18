# Inherit common stuff
$(call inherit-product, vendor/demented/configs/common.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/demented/overlay/common_tablet

