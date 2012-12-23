# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=JOP40D BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")


# Additional properties
PRODUCT_VERSION_MAJOR = 10
PRODUCT_VERSION_MINOR = 0
 
PRODUCT_PROPERTY_OVERRIDES += \
ro.modversion=DEMENTED-Droid-$(shell date +"%m-%d-%y") 

# Uncomment the below lines and insert name to be displayed as Developer Id
# Host Build Machine is displayed by default
# PRODUCT_BUILD_PROP_OVERRIDES += \
# ro.build.host=
