# Define device name
DEVICE := gauguin

# Define ROM name
ROM := carbon

# Inherit Carbon GSM telephony parts
# This file configures the GSM properties and features for Carbon ROM
$(call inherit-product, vendor/$(ROM)/config/gsm.mk)

# Inherit from gauguin device
# This file contains the device-specific settings and drivers for gauguin
$(call inherit-product, device/xiaomi/$(DEVICE)/device.mk)

# Inherit common.
# This file contains the common settings and features for Carbon ROM
$(call inherit-product, vendor/$(ROM)/config/common.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := $(ROM)_$(DEVICE)
PRODUCT_DEVICE := $(DEVICE)
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi 10i
PRODUCT_MANUFACTURER := Xiaomi

# Check device variant and inherit accordingly
# This file contains the variant-specific settings and features for gauguin
ifneq ($(filter gauguinpro gauguininpro, $(TARGET_DEVICE)),)
$(call inherit-product, device/xiaomi/$(DEVICE)/$(TARGET_DEVICE).mk)
endif

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
