# Inherit common DEMENTED stuff
$(call inherit-product, vendor/DEMENTED/config/common.mk)

# Bring in all audio files
# include frameworks/base/data/sounds/NewAudio.mk

# Extra Ringtones
# include frameworks/base/data/sounds/AudioPackageNewWave.mk

# Bring in all video files
$(call inherit-product, frameworks/base/data/videos/VideoPackage2.mk)

# Include DEMENTED audio files
include vendor/DEMENTED/config/demented_audio.mk

# Optional DEMENTED packages
PRODUCT_PACKAGES += \
    HoloSpiralWallpaper \
    MagicSmokeWallpapers \
    NoiseField \
    Galaxy4 \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    PhaseBeam
