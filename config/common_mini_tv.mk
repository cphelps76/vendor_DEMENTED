# Inherit common DEMENTED stuff
$(call inherit-product, vendor/cm/config/common_mini.mk)

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/demented/prebuilt/common/bootanimation/800.zip:system/media/bootanimation.zip
endif
