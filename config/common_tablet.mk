# Common settings and files
-include vendor/demented/config/common.mk

# Add tablet overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/demented/overlay/common_tablet

PRODUCT_CHARACTERISTICS := tablet

