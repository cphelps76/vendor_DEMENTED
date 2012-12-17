# Generic product
PRODUCT_NAME := DEMENTED
PRODUCT_BRAND := DEMENTED
PRODUCT_DEVICE := generic

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/DEMENTED/overlay/common

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.feedback \
    ro.setupwizard.enterprise_mode=1

# T-mobile heme engine
include vendor/DEMENTED/products/themes_common.mk

# Additional DEMENTED Apps
PRODUCT_PACKAGES += \
    Apollo\
    DSPManager

# Common Google Applications and libs
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/proprietary/common/app/ApexLauncher.apk:system/app/ApexLauncher.apk \
    vendor/DEMENTED/proprietary/common/app/Calendar.apk:system/app/Calendar.apk \
    vendor/DEMENTED/proprietary/common/app/Chrome.apk:system/app/Chrome.apk \
    vendor/DEMENTED/proprietary/common/app/Earth.apk:system/app/Earth.apk \
    vendor/DEMENTED/proprietary/common/app/Email.apk:system/app/Email.apk \
    vendor/DEMENTED/proprietary/common/app/GenieWidget.apk:system/app/GenieWidget.apk \
    vendor/DEMENTED/proprietary/common/app/GalleryGoogle.apk:system/app/GalleryGoogle.apk \
    vendor/DEMENTED/proprietary/common/app/Gmail.apk:system/app/Gmail.apk \
    vendor/DEMENTED/proprietary/common/app/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \
    vendor/DEMENTED/proprietary/common/app/GoogleCalendarSyncAdapter.apk:system/app/GoogleCalendarSyncAdapter.apk \
    vendor/DEMENTED/proprietary/common/app/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \
    vendor/DEMENTED/proprietary/common/app/GoogleEars.apk:system/app/GoogleEars.apk \
    vendor/DEMENTED/proprietary/common/app/GoogleFeedback.apk:system/app/GoogleFeedback.apk \
    vendor/DEMENTED/proprietary/common/app/GoogleLoginService.apk:system/app/GoogleLoginService.apk \
    vendor/DEMENTED/proprietary/common/app/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \
    vendor/DEMENTED/proprietary/common/app/GoogleServicesFramework.apk:system/app/GoogleServicesFramework.apk \
    vendor/DEMENTED/proprietary/common/app/GoogleTTS.apk:system/app/GoogleTTS.apk \
    vendor/DEMENTED/proprietary/common/app/GmsCore.apk:system/app/GmsCore.apk \
    vendor/DEMENTED/proprietary/common/app/LatinIMEDictionaryPack.apk:system/app/LatinIMEDictionaryPack.apk \
    vendor/DEMENTED/proprietary/common/app/Maps.apk:system/app/Maps.apk \
    vendor/DEMENTED/proprietary/common/app/MediaUploader.apk:system/app/MediaUploader.apk \
    vendor/DEMENTED/proprietary/common/app/NetworkLocation.apk:system/app/NetworkLocation.apk \
    vendor/DEMENTED/proprietary/common/app/OneTimeInitializer.apk:system/app/OneTimeInitializer.apk \
    vendor/DEMENTED/proprietary/common/app/PartnerBookmarksProvider.apk:system/app/PartnerBookmarksProvider.apk \
    vendor/DEMENTED/proprietary/common/app/Phonesky.apk:system/app/Phonesky.apk \
    vendor/DEMENTED/proprietary/common/app/SetupWizard.apk:system/app/SetupWizard.apk \
    vendor/DEMENTED/proprietary/common/app/Street.apk:system/app/Street.apk \
    vendor/DEMENTED/proprietary/common/app/Talk.apk:system/app/Talk.apk \
    vendor/DEMENTED/proprietary/common/app/Talkback.apk:system/app/Talkback.apk \
    vendor/DEMENTED/proprietary/common/app/Velvet.apk:system/app/Velvet.apk \
    vendor/DEMENTED/proprietary/common/app/YouTube.apk:system/app/YouTube.apk \
    vendor/DEMENTED/proprietary/common/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
    vendor/DEMENTED/proprietary/common/etc/permissions/features.xml:system/etc/permissions/features.xml \
    vendor/DEMENTED/proprietary/common/etc/preferred-apps/google.xml:system/etc/preferred-apps/google.xml \
    vendor/DEMENTED/proprietary/common/etc/updatecmds/google_generic_update.txt:system/etc/updatecmds/google_generic_update.txt \
    vendor/DEMENTED/proprietary/common/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
    vendor/DEMENTED/proprietary/common/lib/libchromeview.so:system/lib/libchromeview.so \
    vendor/DEMENTED/proprietary/common/lib/libearthmobile.so:system/lib/libearthmobile.so \
    vendor/DEMENTED/proprietary/common/lib/libgoggles_clientvision.so:system/lib/libgoggles_clientvision.so \
    vendor/DEMENTED/proprietary/common/lib/libgoogle_recognizer_jni.so:system/lib/libgoogle_recognizer_jni.so \
    vendor/DEMENTED/proprietary/common/lib/libgtalk_jni.so:system/lib/libgtalk_jni.so \
    vendor/DEMENTED/proprietary/common/lib/libgtalk_stabilize.so:system/lib/libgtalk_stabilize.so \
    vendor/DEMENTED/proprietary/common/lib/libjni_eglfence.so:system/lib/libjni_eglfence.so \
    vendor/DEMENTED/proprietary/common/lib/libjni_mosaic.so:system/lib/libjni_mosaic.so \
    vendor/DEMENTED/proprietary/common/lib/liblightcycle.so:system/lib/liblightcycle.so \
    vendor/DEMENTED/proprietary/common/lib/libpatts_engine_jni_api.so:system/lib/libpatts_engine_jni_api.so \
    vendor/DEMENTED/proprietary/common/lib/libspeexwrapper.so:system/lib/libspeexwrapper.so \
    vendor/DEMENTED/proprietary/common/lib/libttscompat.so:system/lib/libttscompat.so \
    vendor/DEMENTED/proprietary/common/lib/libttspico.so:system/lib/libttspico.so \
    vendor/DEMENTED/proprietary/common/lib/libvoicesearch.so:system/lib/libvoicesearch.so \
    vendor/DEMENTED/proprietary/common/lib/libvorbisencoder.so:system/lib/libvorbisencoder.so 

# Common Applications
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/proprietary/common/app/Superuser.apk:system/app/Superuser.apk

# Common Keyboard w/ Gestures
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/proprietary/common/app/LatinImeGoogle.apk:system/app/LatinImeGoogle.apk \
    vendor/DEMENTED/proprietary/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so 

# Common Binary files
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/proprietary/common/bin/flash_image:system/bin/flash_image \
    vendor/DEMENTED/proprietary/common/xbin/bash:system/xbin/bash \
    vendor/DEMENTED/proprietary/common/xbin/zipalign:system/xbin/zipalign \
    vendor/DEMENTED/proprietary/common/xbin/su:system/xbin/su 
    
# Common etc files
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/proprietary/common/bin/sysinit:system/bin/sysinit \
    vendor/DEMENTED/proprietary/common/etc/gps.conf:system/etc/gps.conf \
    vendor/DEMENTED/proprietary/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/DEMENTED/proprietary/common/etc/sysctl.conf:system/etc/sysctl.conf 

# DEMENTED SPEED FREEK init.d and build.prop tweaks
include vendor/DEMENTED/products/speed_freek.mk

# Common scripts
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/proprietary/common/xbin/cpuinfo:system/xbin/cpuinfo \
    vendor/DEMENTED/proprietary/common/xbin/rb:system/xbin/rb \
    vendor/DEMENTED/proprietary/common/xbin/rr:system/xbin/rr \
    vendor/DEMENTED/proprietary/common/bin/shutdown:system/bin/shutdown \
    vendor/DEMENTED/proprietary/common/xbin/sysro:system/xbin/sysro \
    vendor/DEMENTED/proprietary/common/xbin/sysrw:system/xbin/sysrw \
    vendor/DEMENTED/proprietary/common/xbin/zipalign_all:system/xbin/zipalign_all \
    vendor/DEMENTED/proprietary/common/xbin/zipalign_app:system/xbin/zipalign_app 

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# BusyBox binary
PRODUCT_COPY_FILES +=  \
    vendor/DEMENTED/proprietary/common/xbin/busybox:system/xbin/busybox


