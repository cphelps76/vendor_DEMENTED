# Inherit common CM stuff
$(call inherit-product, vendor/demented/config/common.mk)

# Include DEMENTED audio files
include vendor/demented/config/demented_audio.mk

# Include DEMENTED LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/demented/overlay/dictionaries

# Optional CM packages
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    VisualizationWallpapers \
    PhotoTable \
    SoundRecorder \
    PhotoPhase

# Extra tools in CM
PRODUCT_PACKAGES += \
    vim \
    zip \
    unrar
