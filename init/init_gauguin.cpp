// This function overrides a system property with a given value
void property_override(const char* prop, const char* value) {
    prop_info *pi; // a pointer to a prop_info structure

    pi = (prop_info*) __system_property_find(prop); // find the property by name

    if (pi)
        __system_property_update(pi, value, strlen(value)); // update the property value if it exists
    else
        __system_property_add(prop, strlen(prop), value, strlen(value)); // add the property value if it does not exist
}

// This structure defines the device properties for different models
struct DeviceProperties {
    const char* bluetooth_name; // the name of the device shown in Bluetooth settings
    const char* fingerprint; // the build fingerprint of the device
    const char* brand; // the brand name of the device
    const char* device; // the device name of the device
    const char* model; // the model name of the device
    const char* sku; // the hardware SKU of the device
};

// These are the device properties for different models
DeviceProperties gauguin = {
    "Mi 10T Lite", // the Bluetooth name for Mi 10T Lite
    "Xiaomi/gauguin_global/gauguin:12/RKQ1.200826.002/V14.0.2.0.SJSMIXM:user/release-keys", // the build fingerprint for Mi 10T Lite
    "Xiaomi", // the brand name for Mi 10T Lite
    "gauguin", // the device name for Mi 10T Lite
    "M2007J17G", // the model name for Mi 10T Lite
    "nfc" // the hardware SKU for Mi 10T Lite
};

DeviceProperties gauguinpro = {
    "Redmi Note 9 Pro", // the Bluetooth name for Redmi Note 9 Pro
    "Redmi/gauguin/gauguin:12/RKQ1.200826.002/V14.0.2.0.SJSCNXM:user/release-keys", // the build fingerprint for Redmi Note 9 Pro
    "Redmi", // the brand name for Redmi Note 9 Pro
    "gauguinpro", // the device name for Redmi Note 9 Pro
    "M2007J17C", // the model name for Redmi Note 9 Pro
    "nfc" // the hardware SKU for Redmi Note 9 Pro
};

DeviceProperties gauguininpro = {
    "Mi 10i", // the Bluetooth name for Mi 10i
    "Xiaomi/gauguininpro/gauguininpro:12/RKQ1.200826.002/V14.0.3.0.SJSINXM:user/release-keys", // the build fingerprint for Mi 10i
    "Xiaomi", // the brand name for Mi 10i
    "gauguininpro", // the device name for Mi 10i
    "M2007J17I", // the model name for Mi 10i
    "nfc" // the hardware SKU for Mi 10i
};

// This function loads the device properties based on the region
void load_device_properties(DeviceProperties device) {
    property_override("bluetooth.device.default_name", device.bluetooth_name); // override the Bluetooth name
    property_override("ro.build.fingerprint", device.fingerprint); // override the build fingerprint
    property_override("ro.product.brand", device.brand); // override the brand name
    property_override("ro.product.device", device.device); // override the device name
    property_override("ro.product.model", device.model); // override the model name
    property_override("ro.boot.product.hardware.sku", device.sku); // override the hardware SKU
}

// This function sets the vendor properties based on the region
void vendor_load_properties() {
    std::string region = android::base::GetProperty("ro.boot.hwc", ""); // get the region from the boot property

    if (region.find("CN") != std::string::npos) // if the region is China
        load_device_properties(gauguinpro); // load the properties for Redmi Note 9 Pro
    else if (region.find("INDIA") != std::string::npos) // if the region is India
        load_device_properties(gauguininpro); // load the properties for Mi 10i
    else if (region.find("GLOBAL") != std::string::npos) // if the region is Global
        load_device_properties(gauguin); // load the properties for Mi 10T Lite
}
