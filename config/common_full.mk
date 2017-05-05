# Inherit common DEMENTEFD stuff
$(call inherit-product, vendor/demented/config/common.mk)

PRODUCT_SIZE := full

# Optional DEMENTED packages
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    PhotoTable \
    PhotoPhase

# Themes
PRODUCT_PACKAGES += \
    HexoLibre
