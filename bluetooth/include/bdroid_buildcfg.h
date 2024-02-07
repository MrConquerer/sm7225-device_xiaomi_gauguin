#pragma once

#include <stdint.h>
#include <string>

#ifdef __cplusplus
extern "C" {
#endif
int property_get(const char *key, char *value, const char *default_value);
#ifdef __cplusplus
}
#endif

static inline auto BtmGetDefaultName()
{
    std::string product_device;
    property_get("ro.product.device", product_device.data(), "");

    switch (product_device) {
        case "gauguinpro":
            return "Redmi Note 9 Pro";
        case "gauguininpro":
            return "Mi 10i";
        case "gauguin":
            return "Mi 10T Lite";
        default:
            // Fallback to ro.product.model
            return "";
    }
}

constexpr auto BTM_DEF_LOCAL_NAME = BtmGetDefaultName();

// Disables read remote device feature
constexpr auto MAX_ACL_CONNECTIONS = 16;
constexpr auto MAX_L2CAP_CHANNELS = 32;
constexpr auto BLE_VND_INCLUDED = true;
constexpr auto GATT_MAX_PHY_CHANNEL = 10;
// skips conn update at conn completion
constexpr auto BT_CLEAN_TURN_ON_DISABLED = 1;

constexpr auto AVDT_NUM_SEPS = 35;
