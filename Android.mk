# Set the local path to the current directory
LOCAL_PATH := $(LOCAL_PATH)

# Include all subdirectory makefiles
include $(call all-subdir-makefiles)

# Define a module for the shared library
include $(CLEAR_VARS)
LOCAL_MODULE := mylib
LOCAL_SRC_FILES := main.c
include $(BUILD_SHARED_LIBRARY)

# Define the device-specific framework manifest file
ifeq ($(TARGET_PRODUCT),gauguin)
  DEVICE_FRAMEWORK_MANIFEST_FILE := $(TARGET_DEVICE_DIR)/configs/vintf/framework_manifest.xml
endif
