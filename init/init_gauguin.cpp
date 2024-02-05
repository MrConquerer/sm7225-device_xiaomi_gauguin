#include <android-base/logging.h>
#include <android-base/properties.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "property_service.h"
#include "vendor_init.h"

void property_override(char const prop[], char const value[])
{
    android::base::SetProperty(prop, value);
}

void load_gauguin() {
    property_override("ro.product.model", "M2007J17G");
    property_override("ro.build.product", "gauguin");
    property_override("ro.product.device", "gauguin");
    property_override("ro.product.marketname", "Mi 10T Lite");
}

void load_gauguininpro() {
    property_override("ro.product.model", "M2007J17I");
    property_override("ro.build.product", "gauguininpro");
    property_override("ro.product.device", "gauguininpro");
    property_override("ro.product.marketname", "Mi 10i");
}

void load_gauguinpro() {
    property_override("ro.product.model", "M2007J17C");
    property_override("ro.build.product", "gauguinpro");
    property_override("ro.product.device", "gauguinpro");
    property_override("ro.product.marketname", "Redmi Note 9 Pro");
    property_override("ro.product.brand", "Redmi");
}

void vendor_load_properties() {
    std::string region = android::base::GetProperty("ro.boot.hwc", "");

    // Use switch-case instead of if-else
    switch (region[0]) {
        case 'C':
            load_gauguinpro();
            break;
        case 'I':
            load_gauguininpro();
            break;
        case 'G':
            load_gauguin();
            break;
        default:
            LOG(ERROR) << __func__ << ": unexcepted region!";
    }
}
