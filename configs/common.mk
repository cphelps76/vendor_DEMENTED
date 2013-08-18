# Common make file for DEMENTED builds
#
# cphelps76

# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=cphelps76 BUILD_UTC_DATE=$(shell date +"%s")

PRODUCT_PACKAGES += \
    Apollo \
    DEMENTEDFiles \
    Torch

# DEMENTED 4.3 Gapps
include vendor/demented/configs/gapps.mk

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.feedback \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enterprise_mode=1 \
    windowsmgr.max_events_per_sec=240 \
    ro.kernel.android.checkjni=0 \
    persist.sys.root_access=3

PRODUCT_COPY_FILES += \
    vendor/demented/prebuilt/common/lib/libmicrobes_jni.so:system/lib/libmicrobes_jni.so \
    vendor/demented/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf

# init.d
PRODUCT_COPY_FILES += \
    vendor/demented/prebuilt/common/etc/init.demented.rc:root/init.demented.rc \
    vendor/demented/prebuilt/common/etc/init.d/00start:system/etc/init.d/00start \
    vendor/demented/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/demented/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/demented/prebuilt/common/bin/sysinit:system/bin/sysinit

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    libssh \
    ssh \
    sshd \
    sshd-config \
    ssh-keygen \
    sftp \
    scp

# DEMENTED default ringtone and notification sound
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Centaurus.ogg \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Scandium.ogg

PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Set DEMENTED build info
PLATFORM_VERSION_CODENAME=UNOFFICIAL
DEMENTED_VERSION := "DEMENTED"-$(shell date +"%m-%d-%y")

PRODUCT_PROPERTY_OVERRIDES += \
  ro.demented.version=$(DEMENTED_VERSION) \
  ro.modversion=Droid_Concepts-$(DEMENTED_VERSION)phelps76
