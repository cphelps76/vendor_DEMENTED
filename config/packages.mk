# Additional packages
PRODUCT_PACKAGES += \
    AudioFX \
    Apollo

# Hostmode control apps for Timur's kernel
PRODUCT_COPY_FILES += \
    vendor/demented/prebuilt/app/app-release.apk:system/app/CarHome/CarHome.apk \
    vendor/demented/prebuilt/app/PowerEventMgr.apk:system/app/PowerEventMgr/PowerEventMgr.apk \
    vendor/demented/prebuilt/app/VCam2.apk:system/app/VCam2/VCam2.apk \
    vendor/demented/prebuilt/lib/libImageProc.so:system/lib/libImageProc.so

# Misc for hostmode for Timur's kernel
PRODUCT_COPY_FILES += \
    vendor/demented/prebuilt/framework/services.jar:system/framework/services.jar \
    vendor/demented/prebuilt/system/powerdown.jpg:system/powerdown.jpg \
    vendor/demented/prebuilt/system/powerup.jpg:system/powerup.jpg \
    vendor/demented/prebuilt/vendor/saa7115.ko:system/vendor/saa7115.ko \
    vendor/demented/prebuilt/vendor/stk1160.ko:system/vendor/stk1160.ko \
    vendor/demented/prebuilt/vendor/usbtv.ko:system/vendor/usbtv.ko
