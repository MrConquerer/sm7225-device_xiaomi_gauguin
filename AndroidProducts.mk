# Inherit from the aosp_x86_64 product
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_x86_64.mk)

# Override the device name and product name variables
DEVICE := gauguin
PRODUCT := carbon

# Override the product makefile path
PRODUCT_MAKEFILES := $(LOCAL_DIR)/$(PRODUCT)_$(DEVICE).mk

# Override the common lunch choices
COMMON_LUNCH_CHOICES := \
    $(PRODUCT)_$(DEVICE)-user \
    $(PRODUCT)_$(DEVICE)-userdebug \
    $(PRODUCT)_$(DEVICE)-eng

# Override any other configurations that are different from the aosp_x86_64 product
...
