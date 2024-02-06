# Inherit from the aosp_arm64 product
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_arm64.mk)

# Override the device name and product name variables
DEVICE := gauguin
PRODUCT := carbon_gauguin

# Override the product makefile path
PRODUCT_MAKEFILES := $(LOCAL_DIR)/$(PRODUCT).mk

# Override the common lunch choices
COMMON_LUNCH_CHOICES := \
    $(PRODUCT)-user \
    $(PRODUCT)-userdebug \
    $(PRODUCT)-eng

# Override any other configurations that are different from the aosp_arm64 product


# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)
...
