# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=JDQ39E BUILD_VERSION_TAGS=release-keys USER=cphelps76 BUILD_UTC_DATE=$(shell date +"%s")


# Additional properties
PRODUCT_VERSION_MAJOR = 10
PRODUCT_VERSION_MINOR = 0
 
PRODUCT_PROPERTY_OVERRIDES += \
ro.modversion=DEMENTED-Droid-$(DEMENTED_VERSION)-$(shell date +"%m-%d-%y")
