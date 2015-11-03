#!/system/bin/sh

if [ -e /data/misc/wifi/WCNSS_qcom_wlan_cal.bin ]; then
    calparm=`ls /sys/module/wcnsscore/parameters/has_calibrated_data`
    if [ -e $calparm ] && [ ! -e /data/misc/wifi/WCN_FACTORY ]; then
        echo 1 > $calparm
    fi
fi

# There is a device file.  Write to the file
# so that the driver knows userspace is
# available for firmware download requests
echo 1 > /dev/wcnss_wlan
echo $serialno > /sys/devices/platform/wcnss_wlan.0/serial_number

exit 0
