[AID_VENDOR_QTI_DIAG]
value:2901

[AID_VENDOR_QDSS]
value:2902

[AID_VENDOR_RFS]
value:2903

[AID_VENDOR_RFS_SHARED]
value:2904

[AID_VENDOR_ADPL_ODL]
value:2905

[AID_VENDOR_QRTR]
value:2906

[AID_VENDOR_THERMAL]
value:2907

[AID_VENDOR_FASTRPC]
value:2908

[AID_VENDOR_QTR]
value:2909

[vendor/bin/wcnss_filter]
mode: 0755
user: AID_BLUETOOTH
group: AID_BLUETOOTH
caps: BLOCK_SUSPEND

[vendor/bin/hw/android.hardware.bluetooth@1.0-service-qti]
mode: 0755
user: AID_BLUETOOTH
group: AID_BLUETOOTH
caps: BLOCK_SUSPEND NET_ADMIN

[vendor/bin/hw/android.hardware.bluetooth@1.0-service-qti-lazy]
mode: 0755
user: AID_BLUETOOTH
group: AID_BLUETOOTH
caps: BLOCK_SUSPEND NET_ADMIN

[system/bin/cnss-daemon]
mode: 0755
user: AID_BLUETOOTH
group: AID_BLUETOOTH
caps: NET_BIND_SERVICE

[vendor/bin/pm-service]
mode: 0755
user: AID_SYSTEM
group: AID_SYSTEM
caps: NET_BIND_SERVICE

[vendor/bin/pd-mapper]
mode: 0755
user: AID_SYSTEM
group: AID_SYSTEM
caps: NET_BIND_SERVICE

[vendor/bin/imsdatadaemon]
mode: 0755
user: AID_RADIO
group: AID_RADIO
caps: NET_BIND_SERVICE

[vendor/bin/ims_rtp_daemon]
mode: 0755
user: AID_RADIO
group: AID_RADIO
caps: NET_BIND_SERVICE

[vendor/bin/imsrcsd]
mode: 0755
user: AID_RADIO
group: AID_RADIO
caps: NET_BIND_SERVICE BLOCK_SUSPEND WAKE_ALARM

[vendor/bin/imsdaemon]
mode: 0755
user: AID_RADIO
group: AID_RADIO
caps: NET_BIND_SERVICE BLOCK_SUSPEND WAKE_ALARM

[vendor/bin/cnd]
mode: 0755
user: AID_SYSTEM
group: AID_SYSTEM
caps: NET_BIND_SERVICE BLOCK_SUSPEND NET_ADMIN

[vendor/bin/slim_daemon]
mode: 0755
user:  AID_GPS
group: AID_GPS
caps: NET_BIND_SERVICE

[vendor/bin/loc_launcher]
mode: 0755
user:  AID_GPS
group: AID_GPS
caps: SETUID SETGID

[vendor/bin/xtwifi-client]
mode: 0755
user:  AID_GPS
group: AID_GPS
caps: NET_BIND_SERVICE BLOCK_SUSPEND WAKE_ALARM

[vendor/bin/sensors.qti]
mode: 0755
user: AID_SYSTEM
group: AID_SYSTEM
caps: NET_BIND_SERVICE

[firmware/]
mode: 0771
user: AID_SYSTEM
group: AID_SYSTEM
caps: 0

[firmware/image/*]
mode: 0771
user: AID_SYSTEM
group: AID_SYSTEM
caps: 0

[vendor/firmware_mnt/image/*]
mode: 0771
user: AID_SYSTEM
group: AID_SYSTEM
caps: 0

[bt_firmware/]
mode: 0771
user: AID_SYSTEM
group: AID_SYSTEM
caps: 0

[persist/]
mode: 0771
user: AID_SYSTEM
group: AID_SYSTEM
caps: 0

[dsp/]
mode: 0771
user: AID_MEDIA
group: AID_MEDIA
caps: 0


[product/vendor_overlay/*/bin/*]
mode: 0755
user: AID_ROOT
group: AID_SHELL
caps: 0

# Use product flavors to specify only the resources needed for testing
productFlavors {
    dev {
        resConfigs "en", "hdpi"
    }
    prod {
        // Use default resources
    }
}

# Use BuildConfig to store static values for your app
buildConfigField "String", "API_KEY", "\"abc123\""
buildConfigField "String", "BASE_URL", "\"https://example.com\""
buildConfigField "boolean", "FEATURE_FLAG", "true"

# Use static dependency versions
dependencies {
    implementation 'com.android.support:appcompat-v7:28.0.0'
    implementation 'com.google.android.material:material:1.4.0'
    implementation 'org.jetbrains.kotlin:kotlin-stdlib:1.5.31'
    // ...
}