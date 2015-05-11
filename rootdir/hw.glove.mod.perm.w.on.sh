#!/system/bin/sh
#
# Original author: Bagyusz
#
# 2014.11.02
#
###############################################
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

GLOVEMODENODE="\/sys\/devices\/i2c-3\/3-0024\/main_ttsp_core.cyttsp4_i2c_adapter\/signal_disparity"
ACTUAL=`cat /sys/devices/i2c-3/3-0024/main_ttsp_core.cyttsp4_i2c_adapter/signal_disparity`;

mount_needed=false;

if [ "$ACTUAL" = "136" ];then
  mount -o rw,remount,barrier=1 /system
  sed -i 's/^.*echo.*$/echo '$ACTUAL' > '$GLOVEMODENODE'/' /system/etc/init.d/glove_mode_set
  mount_needed=true;
fi

if [ "$ACTUAL" = "0" ];then
  mount -o rw,remount,barrier=1 /system
  sed -i 's/^.*echo.*$/echo '$ACTUAL' > '$GLOVEMODENODE'/' /system/etc/init.d/glove_mode_set
  mount_needed=true;
fi

if $mount_needed ;then
  mount -o ro,remount,barrier=1 /system
fi

sleep 10
chmod 440 /sys/devices/i2c-3/3-0024/main_ttsp_core.cyttsp4_i2c_adapter/signal_disparity
chmod 440 /sys/devices/i2c-3/3-0024/main_ttsp_core.cyttsp4_i2c_adapter/finger_threshold
