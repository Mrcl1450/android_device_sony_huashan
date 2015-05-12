#!/system/bin/sh

echo 0 > /sys/devices/i2c-3/3-0024/main_ttsp_core.cyttsp4_i2c_adapter/signal_disparity

chmod 440 /sys/devices/i2c-3/3-0024/main_ttsp_core.cyttsp4_i2c_adapter/signal_disparity
chmod 440 /sys/devices/i2c-3/3-0024/main_ttsp_core.cyttsp4_i2c_adapter/finger_threshold
