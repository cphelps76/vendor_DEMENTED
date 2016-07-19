PRODUCT_BRAND ?= demented

ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
# determine the smaller dimension
TARGET_BOOTANIMATION_SIZE := $(shell \
  if [ $(TARGET_SCREEN_WIDTH) -lt $(TARGET_SCREEN_HEIGHT) ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# get a sorted list of the sizes
bootanimation_sizes := $(subst .zip,, $(shell ls vendor/demented/prebuilt/common/bootanimation))
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

ifeq ($(TARGET_BOOTANIMATION_HALF_RES),true)
PRODUCT_BOOTANIMATION := vendor/demented/prebuilt/common/bootanimation/halfres/$(TARGET_BOOTANIMATION_NAME).zip
else
PRODUCT_BOOTANIMATION := vendor/demented/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip
endif
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

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/demented/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/demented/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/demented/prebuilt/common/bin/50-demented.sh:system/addon.d/50-demented.sh \
    vendor/demented/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/cm/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/demented/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/demented/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/demented/prebuilt/common/bin/sysinit:system/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/demented/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# DEMENTED-specific init file
PRODUCT_COPY_FILES += \
    vendor/demented/prebuilt/common/etc/init.local.rc:root/init.demented.rc

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/demented/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is DEMENTED!
PRODUCT_COPY_FILES += \
    vendor/demented/config/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# Theme engine
include vendor/demented/config/themes_common.mk


# CMSDK
include vendor/demented/config/cmsdk_common.mk

# Required DEMENTED packages
PRODUCT_PACKAGES += \
    Development \
    BluetoothExt \
    Profiles

# Optional DEMENTED packages
PRODUCT_PACKAGES += \
    libemoji \
    Terminal

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni

# Custom DEMENTED packages
PRODUCT_PACKAGES += \
    DEMENTEDHome \
    AudioFX \
    CMWallpapers \
    CMFileManager \
    Eleven \
    LockClock \
    DementedSetupWizard \
    CMSettingsProvider \
    ExactCalculator \
    LiveLockScreenService \
    WeatherProvider \
    DataUsageProvider \
    WallpaperPicker

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Extra tools in DEMENTED
PRODUCT_PACKAGES += \
    libsepol \
    mke2fs \
    tune2fs \
    nano \
    htop \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace \
    pigz

WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

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

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank \
    su
endif

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=0

DEVICE_PACKAGE_OVERLAYS += vendor/demented/overlay/common

PRODUCT_VERSION_MAJOR = 1
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 0-RC0

# Set DEMENTED_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef DEMENTED_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "CM_" is optional
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

ifeq ($(DEMENTED_BUILDTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        DEMENTED_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

# DEMENTED Version
DEMENTED_VERSION := $(PLATFORM_VERSION)-$(shell date +"%m-%d-%y")-$(DEMENTED_BUILDTYPE)$(DEMENTED_EXTRAVERSION)-$(DEMENTED_BUILD)

PLATFORM_VERSION_CODENAME=UNOFFICIAL

ADDITIONAL_DEFAULT_PROPERTIES += \
  ro.adb.secure=0 \
  ro.secure=0 \
  ro.debuggable=1

PRODUCT_PROPERTY_OVERRIDES += \
  ro.demented.build = demented-$(PLATFORM_VERSION)
  ro.demented.version=$(DEMENTED_VERSION) \
  ro.demented.releasetype=$(DEMENTED_BUILDTYPE) \
  ro.modversion=$(DEMENTED_VERSION) \
  ro.cmlegal.url=https://cyngn.com/legal/privacy-policy

-include vendor/cm-priv/keys/keys.mk

DEMENTED_DISPLAY_VERSION := $(DEMENTED_VERSION)

ifneq ($(PRODUCT_DEFAULT_DEV_CERTIFICATE),)
ifneq ($(PRODUCT_DEFAULT_DEV_CERTIFICATE),build/target/product/security/testkey)
  ifneq ($(DEMENTED_BUILDTYPE), UNOFFICIAL)
    ifndef TARGET_VENDOR_RELEASE_BUILD_ID
      ifneq ($(DEMENTED_EXTRAVERSION),)
        # Remove leading dash from DEMENTED_EXTRAVERSION
        DEMENTED_EXTRAVERSION := $(shell echo $(DEMENTED_EXTRAVERSION) | sed 's/-//')
        TARGET_VENDOR_RELEASE_BUILD_ID := $(DEMENTED_EXTRAVERSION)
      else
        TARGET_VENDOR_RELEASE_BUILD_ID := $(shell date -u +%Y%m%d)
      endif
    else
      TARGET_VENDOR_RELEASE_BUILD_ID := $(TARGET_VENDOR_RELEASE_BUILD_ID)
    endif
    DEMENTED_DISPLAY_VERSION=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(TARGET_VENDOR_RELEASE_BUILD_ID)
  endif
endif
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.cm.display.version=$(DEMENTED_DISPLAY_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.dd.version=$(DEMENTED_DISPLAY_VERSION)

-include $(WORKSPACE)/build_env/image-auto-bits.mk

-include vendor/cyngn/product.mk

$(call prepend-product-if-exists, vendor/extra/product.mk)
