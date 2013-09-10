PRODUCT_BRAND ?= DEMENTED

SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.demented.superuser

PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=DEMENTED

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# DEMENTED default ringtone and notification sound
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Centaurus.ogg \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1 \
    dalvik.vm.dexopt-data-only=1

# Enable ADB authentication and root
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    persist.sys.root_access=3 \
    persist.sys.usb.config=mtp
endif

# DEMENTED 4.3 Gapps
include vendor/DEMENTED/config/gapps.mk

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/DEMENTED/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/DEMENTED/prebuilt/common/bin/50-dc.sh:system/addon.d/50-dc.sh \
    vendor/DEMENTED/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/DEMENTED/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# DEMENTED-specific init file
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/common/etc/init.demented.rc:root/init.demented.rc

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/DEMENTED/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

# Terminal Emulator
PRODUCT_COPY_FILES +=  \
    vendor/DEMENTED/prebuilt/common/app/Term.apk:system/app/Term.apk \
    vendor/DEMENTED/prebuilt/common/lib/libjackpal-androidterm4.so:system/lib/libjackpal-androidterm4.so

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/DEMENTED/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/DEMENTED/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is DEMENTED!
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/config/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/common/etc/mkshrc:system/etc/mkshrc

# T-Mobile theme engine
include vendor/DEMENTED/config/themes_common.mk

# Required DEMENTED packages
PRODUCT_PACKAGES += \
    Focal \
    Development \
    LatinIME \
    Superuser \
    su

# Optional DEMENTED packages
PRODUCT_PACKAGES += \
    VoicePlus \
    VideoEditor \
    VoiceDialer \
    SoundRecorder \
    Basic

# Custom DEMENTED packages
PRODUCT_PACKAGES += \
    DEMENTED-Droid \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf \
    DCWallpapers \
    Apollo \
    DEMENTEDFiles \
    DEMENTEDHome \
    LockClock

PRODUCT_PACKAGES += \
    CellBroadcastReceiver

# Extra tools in DEMENTED
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    bash \
    vim \
    nano \
    htop \
    powertop \
    lsof \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

PRODUCT_PACKAGE_OVERLAYS += vendor/DEMENTED/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/DEMENTED/overlay/common

# Set Droid Concepts build info
PLATFORM_VERSION_CODENAME=UNOFFICIAL
DEMENTED_VERSION := "DEMENTED"-$(shell date +"%m-%d-%y")

PRODUCT_PROPERTY_OVERRIDES += \
  ro.demented.version=$(DEMENTED_VERSION) \
  ro.modversion=DEMENTED-$(DEMENTED_VERSION)
