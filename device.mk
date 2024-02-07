# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/gauguin/gauguin-vendor.mk)

# Soong
PRODUCT_BOARD_PLATFORM := sm7225
PRODUCT_USES_QCOM_HARDWARE := true

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Device-specific recovery extensions
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH)/configs:libinit_gauguin
TARGET_RECOVERY_DEVICE_MODULES := libinit_gauguin

# Device Manifest 
DEVICE_FRAMEWORK_MANIFEST_FILE := $(DEVICE_PATH)/configs/vintf/framework_manifest.xml

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# A/B
AB_OTA_UPDATER := false 

# Partitions
BOARD_BUILD_PRODUCT_IMAGE := true
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_TARGET_VNDK_VERSION := 30
PRODUCT_USE_DYNAMIC_PARTITIONS := true 

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_USES_RECOVERY_AS_BOOT := false
TARGET_NO_RECOVERY := false
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/dtb.img:dtb.img

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaacwrapper

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_platform_info_intcodec.xml

#Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl \
    $(LOCAL_PATH)/keylayout/lito-lagoonqrd-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/lito-lagoonqrd-snd-card_Button_Jack.kl
    
# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.wifi.rtt.xml
    
# Camera
PRODUCT_PACKAGES += \
    Snap
    
# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay 

# Overlays -- Override vendor ones
PRODUCT_PACKAGES += \
    FrameworksResCommon \
    FrameworksResTarget \
    DevicesOverlay \
    DevicesAndroidOverlay
    
# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext \
PRODUCT_BOOT_JARS += \
    telephony-ext

# WiFi
PRODUCT_PACKAGES += \
    TetheringConfigOverlay \
    WifiOverlay
    
# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.qti-gauguin

# WiFi Display
PRODUCT_PACKAGES += \
    libdisplayconfig.qti \
    libnl \
    libqdMetaData \
    libavservices_minijail \
    libavservices_minijail_32 \
    vendor.display.config@2.0

PRODUCT_BOOT_JARS += \
    WfdCommon

# Init
PRODUCT_PACKAGES += \
    init.qcom.rc

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# Bluetooth
PRODUCT_PACKAGES += \
    BluetoothQti
    
# Source files for vendor library and kernel modules
PRODUCT_PACKAGES += \
    libinit_gauguin

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.gauguin

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/sbin/libinit_gauguin.ko:root/sbin/libinit_gauguin.ko


# Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libqdMetaData \
    libqdMetaData.system

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    libhidltransport \
    libhwbinder

# Init
PRODUCT_PACKAGES += \
    init.mi_thermald.rc

# IFAA manager
PRODUCT_PACKAGES += \
    org.ifaa.android.manager

PRODUCT_BOOT_JARS += \
    org.ifaa.android.manager
    



