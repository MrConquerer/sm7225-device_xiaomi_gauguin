# Board Configuration for lito platform
# Adapted from https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_690_5G/750G_(SM6350/SM7225)

# Platform name
BOARD_VENDOR := xiaomi
DEVICE_PATH := device/xiaomi/gauguin
TARGET_DEVICE := gauguin
TARGET_BOARD_PLATFORM := sm7225
BOARD_USES_QCOM_HARDWARE := true

#Assert 
TARGET_OTA_ASSERT_DEVICE := gauguin,gauguinpro

# CPU architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo300
TARGET_CPU_VARIANT_RUNTIME := cortex-a77

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := kryo300
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# FM
BOARD_HAS_QCA_FM_SOC := "cherokee"
BOARD_HAVE_QCOM_FM := true

# Framework only update 
BOARD_VNDK_VERSION := current

# Binder
TARGET_USES_64_BIT_BINDER := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# Screen density
TARGET_SCREEN_DENSITY := 320

# Telephony
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true

# OTA Update Packages 
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Custom OEM AIDs
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/configs/config.fs

# Sepolicy
include device/qcom/sepolicy/SEPolicy.mk
include device/qcom/sepolicy_vndr/SEPolicy.mk
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/configs/sepolicy/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += $(DEVICE_PATH)/configs/sepolicy/public

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Kernel configuration
TARGET_KERNEL_CONFIG := neko_gauguin_defconfig
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/xiaomi/gauguin
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-

# Boot image configuration
BOARD_KERNEL_BASE := 0x40080000 # base address of the kernel
BOARD_KERNEL_PAGESIZE := 4096 # page size of the kernel
BOARD_KERNEL_TAGS_OFFSET := 0x00000100 # offset of the kernel tags
BOARD_RAMDISK_OFFSET := 0x02000000 # offset of the ramdisk
BOARD_FLASH_BLOCK_SIZE := 131072 # flash block size
BOARD_BOOTIMG_HEADER_VERSION := 3 # header version of the boot image (for Android 11 or higher)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_DTB_OFFSET := 0x01E00000 # offset of the device tree
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=a600000.dwc3 swiotlb=2048 loop.max_part=7 cgroup.memory=nokmem,nosocket reboot=panic_warm androidboot.selinux=enforcing
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_CMDLINE += skip_initramfs # skip the initramfs and boot from the system partition
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
NEED_KERNEL_MODULE_SYSTEM := true
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/configs/prebuilt/Image
TARGET_KERNEL_CLANG_COMPILE := true
BOARD_KERNEL_HEADER_VERSION := 3 # header version of the kernel image

# Dynamic partitions configuration
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_BUILD_AB_IMAGE := true
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_USES_METADATA_PARTITION := true
BOARD_USES_QCOM_BOOT_HOOKS := true
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := true
BOARD_AVB_VBMETA_VENDOR := true
BOARD_AVB_VBMETA_PRODUCT := true
BOARD_AVB_VBMETA_ODM := true
BOARD_AVB_VBMETA_SYSTEM_EXT := true
BOARD_AVB_VBMETA_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_ALGORITHM := SHA256_RSA4096

# OpenGLES configuration
TARGET_USES_QCOM_BSP := true
TARGET_USES_QCOM_BSP_LEGACY := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_COLOR_METADATA := true
TARGET_USES_ION := true
TARGET_USES_QTI_ION := true
TARGET_USES_INTERMEDIATE_BUFFER := true
TARGET_USES_QCOM_MM_AUDIO := true
TARGET_USES_QTI_SVA := true
TARGET_USES_QTI_SVA_V2 := true
TARGET_USES_QTI_FLUENCE := true
TARGET_USES_QTI_AUDIO_PRIMARY := true
TARGET_USES_QTI_AUDIO_FEATURE_SET := true
TARGET_USES_QTI_AUDIO_HAL := true
TARGET_USES_QTI_SSR := true
TARGET_USES_QTI_SOUND_TRIGGER := true
TARGET_USES_QTI_KEEP_ALIVE := true
TARGET_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_TIME_SERVICES := true
TARGET_USES_QCOM_32BIT_TIME := true

#Inherit from the proprietary version
-include vendor/xiaomi/gauguin/BoardConfigVendor.mk
