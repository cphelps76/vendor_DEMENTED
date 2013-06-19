# DEMENTED-Droid SPEED FREEK
#
# init.d support
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/01dementedbomb:system/etc/init.d/01dementedbomb \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/02dementedkernel:system/etc/init.d/02dementedkernel \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/05dementedfs:system/etc/init.d/05dementedfs \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/91dementedzipalign:system/etc/init.d/91dementedzipalign \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/99dementedsystem:system/etc/init.d/99dementedsystem \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/movecache:system/etc/init.d/movecache

# sysctl.conf
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/demented/etc/sysctl.conf:system/etc/sysctl.conf
