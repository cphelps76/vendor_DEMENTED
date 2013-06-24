# DEMENTED-Droid SPEED FREEK
#
# init.d support
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/01dementedkernel:system/etc/init.d/01dementedkernel \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/02sysctl:system/etc/init.d/02sysctl \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/04dementededt_tweaks:system/etc/init.d/04dementededt_tweaks \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/05dementedfs:system/etc/init.d/05dementedfs \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/80dementedloopysmoothnesstweak:system/etc/init.d/80dementedloopysmoothnesstweak \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/91dementedzipalign:system/etc/init.d/91dementedzipalign \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/97dementedtcp:system/etc/init.d/97dementedtcp \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/99dementedsystem:system/etc/init.d/99dementedsystem \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/movecache:system/etc/init.d/movecache \
    vendor/DEMENTED/prebuilt/demented/etc/init.d/98tweaks:system/etc/init.d/98tweaks

# sysctl.conf
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/demented/etc/sysctl.conf:system/etc/sysctl.conf
