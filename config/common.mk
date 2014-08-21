PRODUCT_BRAND ?= demented

SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.demented.superuser

# To deal with CM9 specifications
# TODO: remove once all devices have been switched
ifneq ($(TARGET_BOOTANIMATION_NAME),)
TARGET_SCREEN_DIMENSIONS := $(subst -, $(space), $(subst x, $(space), $(TARGET_BOOTANIMATION_NAME)))
ifeq ($(TARGET_SCREEN_WIDTH),)
TARGET_SCREEN_WIDTH := $(word 2, $(TARGET_SCREEN_DIMENSIONS))
endif
ifeq ($(TARGET_SCREEN_HEIGHT),)
TARGET_SCREEN_HEIGHT := $(word 3, $(TARGET_SCREEN_DIMENSIONS))
endif
endif

ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))

# clear TARGET_BOOTANIMATION_NAME in case it was set for CM9 purposes
TARGET_BOOTANIMATION_NAME :=

# determine the smaller dimension
TARGET_BOOTANIMATION_SIZE := $(shell \
  if [ $(TARGET_SCREEN_WIDTH) -lt $(TARGET_SCREEN_HEIGHT) ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# get a sorted list of the sizes
bootanimation_sizes := $(subst .zip,, $(shell ls vendor/DEMENTED/prebuilt/common/bootanimation))
bootanimation_sizes := $(shell echo -e $(subst $(space),'\n',$(bootanimation_sizes)) | sort -rn)

# find the appropriate size and set
define check_and_set_bootanimation
$(eval TARGET_BOOTANIMATION_NAME := $(shell \
  if [ -z "$(TARGET_BOOTANIMATION_NAME)" ]; then
    if [ $(1) -le $(TARGET_BOOTANIMATION_SIZE) ]; then \
      echo $(1); \
      exit 0; \
    fi;
  fi;
  echo $(TARGET_BOOTANIMATION_NAME); ))
endef
$(foreach size,$(bootanimation_sizes), $(call check_and_set_bootanimation,$(size)))

PRODUCT_BOOTANIMATION := vendor/DEMENTED/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip
endif

ifdef DEMENTED_NIGHTLY
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=cyanogenmodnightly
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=cyanogenmod
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/CHANGELOG.mkdn:system/etc/CHANGELOG-DD.txt

# Backup Tool
ifneq ($(WITH_GMS),true)
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/DEMENTED/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/DEMENTED/prebuilt/common/bin/50-demented.sh:system/addon.d/50-demented.sh \
    vendor/DEMENTED/prebuilt/common/bin/blacklist:system/addon.d/blacklist
endif

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
    vendor/DEMENTED/prebuilt/common/etc/init.local.rc:root/init.demented.rc

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/DEMENTED/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

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

# This is CM!
PRODUCT_COPY_FILES += \
    vendor/DEMENTED/config/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# T-Mobile theme engine
include vendor/DEMENTED/config/themes_common.mk

# Required CM packages
PRODUCT_PACKAGES += \
    Development \
    LatinIME \
    BluetoothExt

# Optional CM packages
PRODUCT_PACKAGES += \
    VoicePlus \
    VoiceDialer \
    SoundRecorder \
    Basic

# Custom CM packages
PRODUCT_PACKAGES += \
    Trebuchet \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf \
    CMWallpapers \
    Apollo \
    CMFileManager \
    LockClock \
    CMUpdater \
    CMFota \
    CMAccount \
    WhisperPush

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

PRODUCT_PACKAGES += \
    CellBroadcastReceiver

# Extra tools in CM
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
    ntfs-3g \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace

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

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)

PRODUCT_PACKAGES += \
    procmem \
    procrank \
    Superuser \
    su

# Terminal Emulator
PRODUCT_COPY_FILES +=  \
    vendor/DEMENTED/prebuilt/common/apps/Term.apk:system/app/Term.apk \
    vendor/DEMENTED/prebuilt/common/lib/armeabi/libjackpal-androidterm4.so:system/lib/libjackpal-androidterm4.so

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1
else

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=0

endif

# easy way to extend to add more packages
-include vendor/extra/product.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/DEMENTED/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/DEMENTED/overlay/common

PRODUCT_VERSION_MAJOR = 10
PRODUCT_VERSION_MINOR = 2
PRODUCT_VERSION_MAINTENANCE = 0-RC0

# Set DEMENTED_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef DEMENTED_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "DEMENTED_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^CM_||g')
        DEMENTED_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter RELEASE NIGHTLY SNAPSHOT EXPERIMENTAL,$(DEMENTED_BUILDTYPE)),)
    DEMENTED_BUILDTYPE :=
endif

ifdef DEMENTED_BUILDTYPE
    ifneq ($(DEMENTED_BUILDTYPE), SNAPSHOT)
        ifdef DEMENTED_EXTRAVERSION
            # Force build type to EXPERIMENTAL
            DEMENTED_BUILDTYPE := EXPERIMENTAL
            # Remove leading dash from DEMENTED_EXTRAVERSION
            DEMENTED_EXTRAVERSION := $(shell echo $(DEMENTED_EXTRAVERSION) | sed 's/-//')
            # Add leading dash to DEMENTED_EXTRAVERSION
            DEMENTED_EXTRAVERSION := -$(DEMENTED_EXTRAVERSION)
        endif
    else
        ifndef DEMENTED_EXTRAVERSION
            # Force build type to EXPERIMENTAL, SNAPSHOT mandates a tag
            DEMENTED_BUILDTYPE := EXPERIMENTAL
        else
            # Remove leading dash from DEMENTED_EXTRAVERSION
            DEMENTED_EXTRAVERSION := $(shell echo $(DEMENTED_EXTRAVERSION) | sed 's/-//')
            # Add leading dash to DEMENTED_EXTRAVERSION
            DEMENTED_EXTRAVERSION := -$(DEMENTED_EXTRAVERSION)
        endif
    endif
else
    # If DEMENTED_BUILDTYPE is not defined, set to UNOFFICIAL
    DEMENTED_BUILDTYPE := UNOFFICIAL
    DEMENTED_EXTRAVERSION :=
endif

ifeq ($(DEMENTED_BUILDTYPE), RELEASE)
    ifndef TARGET_VENDOR_RELEASE_BUILD_ID
        DEMENTED_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(DEMENTED_BUILD)
    else
        ifeq ($(TARGET_BUILD_VARIANT),user)
            DEMENTED_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(TARGET_VENDOR_RELEASE_BUILD_ID)-$(DEMENTED_BUILD)
        else
            DEMENTED_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(DEMENTED_BUILD)
        endif
    endif
else
    ifeq ($(PRODUCT_VERSION_MINOR),0)
        DEMENTED_VERSION := $(PRODUCT_VERSION_MAJOR)-$(shell date -u +%Y%m%d)-$(DEMENTED_BUILDTYPE)$(DEMENTED_EXTRAVERSION)-$(DEMENTED_BUILD)
    else
        DEMENTED_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date -u +%Y%m%d)-$(DEMENTED_BUILDTYPE)$(DEMENTED_EXTRAVERSION)-$(DEMENTED_BUILD)
    endif
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.demented.version=$(DEMENTED_VERSION) \
  ro.modversion=$(DEMENTED_VERSION) \
  ro.cmlegal.url=http://www.cyanogenmod.org/docs/privacy

-include vendor/DEMENTED/sepolicy/sepolicy.mk

-include vendor/demented-priv/keys/keys.mk

-include $(WORKSPACE)/hudson/image-auto-bits.mk
