SUPERUSER_EMBEDDED := true

# brand
PRODUCT_BRAND ?= DEMENTED

# overrides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=JDQ39E BUILD_VERSION_TAGS=release-keys USER=cphelps76 BUILD_UTC_DATE=$(shell date +"%s")

PRODUCT_PROPERTY_OVERRIDES += \
ro.modversion=DEMENTED-$(shell date +"%m-%d-%y")

# packages
PRODUCT_PACKAGES += \
    Apollo \
    Calendar \
    Camera \
    DEMENTEDBeats \
    DEMENTED-Droid \
    DEMENTEDFiles \
    DEMENTEDHome \
    Gallery2 \
    Galaxy4 \
    HoloSpiralWallpaper \
    LatinIME \
    LiveWallpapers \
    LiveWallpapersPicker \
    LockClock \
    NoiseField \
    PermissionsManager \
    PhaseBeam \
    PhotoTable \
    Torch \
    Wallpapers 

# tools
PRODUCT_PACKAGES += \
    CellBroadcastReceiver

PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    nano
	
# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# DEMENTED/prebuilt SPEED FREEK init.d and build.prop tweaks
include vendor/DEMENTED/config/speed_freek.mk

# themes
include vendor/DEMENTED/config/theme_chooser.mk

#korean
$(call inherit-product-if-exists, external/naver-fonts/fonts.mk)

# overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/DEMENTED/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/DEMENTED/overlay/common

# bin
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/common/bin/sysinit:system/bin/sysinit

# etc
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/common/etc/init.demented.rc:root/init.demented.rc

# Common DEMENTED/prebuilt apps and libs
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/demented/app/ApexLauncher.apk:system/app/ApexLauncher.apk \
    vendor/DEMENTED/prebuilt/demented/app/GenieWidget.apk:system/app/GenieWidget.apk \
    vendor/DEMENTED/prebuilt/demented/app/Gmail.apk:system/app/Gmail.apk \
    vendor/DEMENTED/prebuilt/demented/app/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \
    vendor/DEMENTED/prebuilt/demented/app/GoogleCalendarSyncAdapter.apk:system/app/GoogleCalendarSyncAdapter.apk \
    vendor/DEMENTED/prebuilt/demented/app/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \
    vendor/DEMENTED/prebuilt/demented/app/GoogleEars.apk:system/app/GoogleEars.apk \
    vendor/DEMENTED/prebuilt/demented/app/GoogleFeedback.apk:system/app/GoogleFeedback.apk \
    vendor/DEMENTED/prebuilt/demented/app/GoogleLoginService.apk:system/app/GoogleLoginService.apk \
    vendor/DEMENTED/prebuilt/demented/app/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \
    vendor/DEMENTED/prebuilt/demented/app/GoogleServicesFramework.apk:system/app/GoogleServicesFramework.apk \
    vendor/DEMENTED/prebuilt/demented/app/GoogleTTS.apk:system/app/GoogleTTS.apk \
    vendor/DEMENTED/prebuilt/demented/app/GoogleVoice.apk:system/app/GoogleVoice.apk \
    vendor/DEMENTED/prebuilt/demented/app/GmsCore.apk:system/app/GmsCore.apk \
    vendor/DEMENTED/prebuilt/demented/app/Hangout.apk:system/app/Hangout.apk \
    vendor/DEMENTED/prebuilt/demented/app/LatinIMEDictionaryPack.apk:system/app/LatinIMEDictionaryPack.apk \
    vendor/DEMENTED/prebuilt/demented/app/MediaUploader.apk:system/app/MediaUploader.apk \
    vendor/DEMENTED/prebuilt/demented/app/NetworkLocation.apk:system/app/NetworkLocation.apk \
    vendor/DEMENTED/prebuilt/demented/app/OneTimeInitializer.apk:system/app/OneTimeInitializer.apk \
    vendor/DEMENTED/prebuilt/demented/app/PartnerBookmarksProvider.apk:system/app/PartnerBookmarksProvider.apk \
    vendor/DEMENTED/prebuilt/demented/app/Phonesky.apk:system/app/Phonesky.apk \
    vendor/DEMENTED/prebuilt/demented/app/QuickSearchBox.apk:system/app/QuickSearchBox.apk \
    vendor/DEMENTED/prebuilt/demented/app/SetupWizard.apk:system/app/SetupWizard.apk \
    vendor/DEMENTED/prebuilt/demented/app/Talkback.apk:system/app/Talkback.apk \
    vendor/DEMENTED/prebuilt/demented/app/Thinkfree.apk:system/app/Thinkfree.apk \
    vendor/DEMENTED/prebuilt/demented/app/Velvet.apk:system/app/Velvet.apk \
    vendor/DEMENTED/prebuilt/demented/app/YouTube.apk:system/app/YouTube.apk \
    vendor/DEMENTED/prebuilt/demented/app/Wallet.apk:system/app/Wallet.apk \
    vendor/DEMENTED/prebuilt/demented/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
    vendor/DEMENTED/prebuilt/demented/etc/permissions/features.xml:system/etc/permissions/features.xml \
    vendor/DEMENTED/prebuilt/demented/etc/preferred-apps/google.xml:system/etc/preferred-apps/google.xml \
    vendor/DEMENTED/prebuilt/demented/etc/updatecmds/google_generic_update.txt:system/etc/updatecmds/google_generic_update.txt \
    vendor/DEMENTED/prebuilt/demented/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
    vendor/DEMENTED/prebuilt/demented/lib/libAppDataSearch.so:system/lib/libAppDataSearch.so \
    vendor/DEMENTED/prebuilt/demented/lib/libgames_rtmp_jni.so:system/lib/libgames_rtmp_jni.so \
    vendor/DEMENTED/prebuilt/demented/lib/libvcdecoder_jni.so:system/lib/libvcdecoder_jni.so \
    vendor/DEMENTED/prebuilt/demented/lib/libgoggles_clientvision.so:system/lib/libgoggles_clientvision.so \
    vendor/DEMENTED/prebuilt/demented/lib/libgoogle_recognizer_jni.so:system/lib/libgoogle_recognizer_jni.so \
    vendor/DEMENTED/prebuilt/demented/lib/libgtalk_jni.so:system/lib/libgtalk_jni.so \
    vendor/DEMENTED/prebuilt/demented/lib/libgtalk_stabilize.so:system/lib/libgtalk_stabilize.so \
    vendor/DEMENTED/prebuilt/demented/lib/libjni_eglfence.so:system/lib/libjni_eglfence.so \
    vendor/DEMENTED/prebuilt/demented/lib/libjni_mosaic.so:system/lib/libjni_mosaic.so \
    vendor/DEMENTED/prebuilt/demented/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    vendor/DEMENTED/prebuilt/demented/lib/liblightcycle.so:system/lib/liblightcycle.so \
    vendor/DEMENTED/prebuilt/demented/lib/libpatts_engine_jni_api.so:system/lib/libpatts_engine_jni_api.so \
    vendor/DEMENTED/prebuilt/demented/lib/libspeexwrapper.so:system/lib/libspeexwrapper.so \
    vendor/DEMENTED/prebuilt/demented/lib/libttscompat.so:system/lib/libttscompat.so \
    vendor/DEMENTED/prebuilt/demented/lib/libttspico.so:system/lib/libttspico.so \
    vendor/DEMENTED/prebuilt/demented/lib/libvoicesearch.so:system/lib/libvoicesearch.so \
    vendor/DEMENTED/prebuilt/demented/lib/libvorbisencoder.so:system/lib/libvorbisencoder.so \
    vendor/DEMENTED/prebuilt/demented/lib/libvideochat_stabilize.so:system/lib/libvideochat_stabilize.so \
    vendor/DEMENTED/prebuilt/demented/lib/libvideochat_jni.so:system/lib/libvideochat_jni.so

PRODUCT_COPY_FILES +=  \
    vendor/DEMENTED/prebuilt/demented/media/notifications/Nexus.mp3:system/media/audio/notifications/Nexus.mp3 \
    vendor/DEMENTED/prebuilt/demented/media/notifications/Simple_High.mp3:system/media/audio/notifications/Simple_High.mp3 \
    vendor/DEMENTED/prebuilt/demented/media/ringtones/AIB2.m4a:system/media/audio/ringtones/AIB2.m4a \
    vendor/DEMENTED/prebuilt/demented/media/ringtones/Halo.m4a:system/media/audio/ringtones/Halo.m4a 

# Inherit media effect blobs
-include vendor/DEMENTED/prebuilt/config/common_media_effects.mk

# Inherit Face lock security blobs
-include vendor/DEMENTED/prebuilt/config/common_facelock.mk

# Inherit drm blobs
-include vendor/DEMENTED/prebuilt/config/common_drm_phone.mk

# Inherit speech recognition blobs
-include vendor/DEMENTED/prebuilt/config/common_speech_recognition.mk

# prebuilt
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/common/xbin/sysro:system/xbin/sysro \
    vendor/DEMENTED/prebuilt/common/xbin/sysrw:system/xbin/sysrw \
    vendor/DEMENTED/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/DEMENTED/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

#backup tool
DEMENTED_BUILD = true
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/DEMENTED/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/DEMENTED/prebuilt/common/bin/50-demented.sh:system/addon.d/50-demented.sh \
    vendor/DEMENTED/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# sip/voip
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# nfc
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/config/permissions/com.demented.android.xml:system/etc/permissions/com.demented.android.xml \
    vendor/DEMENTED/config/permissions/com.demented.nfc.enhanced.xml:system/etc/permissions/com.demented.nfc.enhanced.xml

# version
RELEASE = false
DEMENTED_VERSION_MAJOR = 1
DEMENTED_VERSION_MINOR = 7

#Set DEMENTED_BUILDTYPE and goo.im properties
ifdef DEMENTED_NIGHTLY
    DEMENTED_BUILDTYPE := NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.rom=DEMENTEDjb2exp \
        ro.goo.developerid=DEMENTED \
        ro.goo.version=$(shell date +%Y%m%d)
endif
ifdef DEMENTED_EXPERIMENTAL
    DEMENTED_BUILDTYPE := EXPERIMENTAL
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.rom=DEMENTEDjb2exp \
        ro.goo.developerid=DEMENTED \
        ro.goo.version=$(shell date +%Y%m%d)
endif
ifdef DEMENTED_RELEASE
    DEMENTED_BUILDTYPE := RELEASE
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.rom=DEMENTEDjb2 \
        ro.goo.developerid=DEMENTED \
        ro.goo.version=$(shell date +%Y%m%d)
endif
#Set Unofficial if no buildtype set (Buildtype should ONLY be set by DEMENTED Devs!)
ifdef DEMENTED_BUILDTYPE
else
    DEMENTED_BUILDTYPE := UNOFFICIAL
    DEMENTED_VERSION_MAJOR :=
    DEMENTED_VERSION_MINOR :=
endif

#Set DEMENTED version
ifdef DEMENTED_RELEASE
    DEMENTED_VERSION := "DEMENTED-v"$(DEMENTED_VERSION_MAJOR).$(DEMENTED_VERSION_MINOR)
else
    DEMENTED_VERSION := "DEMENTED"-$(shell date +%Y%m%d-%H%M)
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.demented.version=$(DEMENTED_VERSION)
