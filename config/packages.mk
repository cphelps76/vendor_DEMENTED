# Additional packages
PRODUCT_PACKAGES += \
    AudioFX \
    Launcher3 \
    Apollo

# Apps for car integration
PRODUCT_COPY_FILES += \
    vendor/demented/prebuilt/apps/PowerEventMgr.apk:system/app/PowerEventMgr.apk \
    vendor/demented/prebuilt/apps/VCam2.apk:system/app/VCam2.apk

# Misc for hostmode
PRODUCT_COPY_FILES += \
    vendor/demented/prebuilt/framework/services.jar:system/framework/services.jar \
    vendor/demented/prebuilt/system/powerdown.jpg:system/powerdown.jpg \
    vendor/demented/prebuilt/system/powerup.jpg:system/powerup.jpg \
    vendor/demented/prebuilt/vendor/saa7115.ko:system/vendor/saa7115.ko \
    vendor/demented/prebuilt/vendor/stk1160.ko:system/vendor/stk1160.ko \
    vendor/demented/prebuilt/vendor/usbtv.ko:system/vendor/usbtv.ko
