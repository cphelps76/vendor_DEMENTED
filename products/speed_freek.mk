# DEMENTED-Droid SPEED FREEK
PRODUCT_PROPERTY_OVERRIDES += \
    windowsmgr.max_events_per_sec=350 \
    ro.kernel.android.checkjni=0 \
    ro.media.enc.jpeg.quality=100 \
    ro.config.nocheckin=1 \
    debug.performance.tuning=1 \
    persist.service.swiqi.enable=1 \
    video.accelerate.hw=1 \
    ro.ril.enable.3g.prefix=1 \
    ro.ril.hep=1 \
    ro.ril.hsxpa=3 \
    ro.ril.enable.dtm=1 \
    ro.ril.gprsclass=12 \
    ro.ril.hsdpa.category=8 \
    ro.ril.enable.a53=1 \
    ro.ril.hsupa.category=5 \
    persist.sys.purgeable_assets=1 \
    pm.sleep_mode=1 \
    ro.home_app_adj=1 \
    ro.ext4fs=1 \
    persist.sys.use_dithering=0 \
    ro.ril.disable.power.collapse=0 \
    dalvik.vm.heapstartsize=128m \
    dalvik.vm.heapgrowthlimit=320m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.heaputilization=0.05 \
    dalvik.vm.heapidealfree=8388608 \
    dalvik.vm.heapconcurrentstart=2097152 \
    dalvik.vm.verify-bytecode=false \
    ro.dalvik.vm.checkjni=0 \
    dalvik.vm.dexopt-flags=v=n,o=v \
    debug.composition.type=gpu \
    ro.max.fling_velocity=15000 \
    ro.min.fling_velocity=8000 \
    ro.config.hw_fast_dormancy=1 \
    net.dns1=8.8.4.4 \
    net.dns2=8.8.8.8 

# init.d support
PRODUCT_COPY_FILES += \
    vendor/DEMENTED-Droid/proprietary/common/etc/init.d/02DEMENTED-Droidkernel:system/etc/init.d/02DEMENTED-Droidkernel \
    vendor/DEMENTED-Droid/proprietary/common/etc/init.d/02sysctl:system/etc/init.d/02sysctl \
    vendor/DEMENTED-Droid/proprietary/common/etc/init.d/03DEMENTED-Droidgov:system/etc/init.d/03DEMENTED-Droidgov \
    vendor/DEMENTED-Droid/proprietary/common/etc/init.d/04DEMENTED-Droidedt_tweaks:system/etc/init.d/04DEMENTED-Droidedt_tweaks \
    vendor/DEMENTED-Droid/proprietary/common/etc/init.d/05DEMENTED-Droidrfs:system/etc/init.d/05DEMENTED-Droidrfs \
    vendor/DEMENTED-Droid/proprietary/common/etc/init.d/07DEMENTED-Droidtweaks:system/etc/init.d/07DEMENTED-Droidtweaks \
    vendor/DEMENTED-Droid/proprietary/common/etc/init.d/09DEMENTED-Droidsetrenice:system/etc/init.d/09DEMENTED-Droidsetrenice \
    vendor/DEMENTED-Droid/proprietary/common/etc/init.d/80DEMENTED-Droidloopysmoothnesstweak:system/etc/init.d/80DEMENTED-Droidloopysmoothnesstweak \
    vendor/DEMENTED-Droid/proprietary/common/etc/init.d/91demenedzipalign:system/etc/init.d/91demenedzipalign \
    vendor/DEMENTED-Droid/proprietary/common/etc/init.d/98tweaks:system/etc/init.d/98tweaks \
    vendor/DEMENTED-Droid/proprietary/common/etc/init.d/99DEMENTED-Droidsystem:system/etc/init.d/99DEMENTED-Droidsystem 
