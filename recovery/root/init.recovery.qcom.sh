#!/system/bin/sh
# Make recovery enforcing
setenforce 1
# Bind mount /dev/block/mapper to /dev/block/bootdevice/by-name
# For compatibility with mods like Magisk and OpenGapps
# (vendor and system should be more than enough)
mount -o bind /dev/block/mapper/system /dev/block/bootdevice/by-name/system
mount -o bind /dev/block/mapper/vendor /dev/block/bootdevice/by-name/vendor
