#!/sbin/busybox sh
set +x
_PATH="$PATH"
export PATH=/sbin

#
# LED Paths definition
#

# Here we define the Current and Brightness files for the device
# The definition is organized by colour and in the order of LED1 to LED 3

# Red LED Brightness
LED1_R_BRIGHTNESS_FILE="/sys/class/leds/LED1_R/brightness"
LED2_R_BRIGHTNESS_FILE="/sys/class/leds/LED2_R/brightness"
LED3_R_BRIGHTNESS_FILE="/sys/class/leds/LED3_R/brightness"

# Red LED Current
LED1_R_CURRENT_FILE="/sys/class/leds/LED1_R/led_current"
LED2_R_CURRENT_FILE="/sys/class/leds/LED2_R/led_current"
LED3_R_CURRENT_FILE="/sys/class/leds/LED3_R/led_current"

# Green LED Brightness
LED1_G_BRIGHTNESS_FILE="/sys/class/leds/LED1_G/brightness"
LED2_G_BRIGHTNESS_FILE="/sys/class/leds/LED2_G/brightness"
LED3_G_BRIGHTNESS_FILE="/sys/class/leds/LED3_G/brightness"

# Green LED Current
LED1_G_CURRENT_FILE="/sys/class/leds/LED1_G/led_current"
LED2_G_CURRENT_FILE="/sys/class/leds/LED2_G/led_current"
LED3_G_CURRENT_FILE="/sys/class/leds/LED3_G/led_current"

# Blue LED Brightness
LED1_B_BRIGHTNESS_FILE="/sys/class/leds/LED1_B/brightness"
LED2_B_BRIGHTNESS_FILE="/sys/class/leds/LED2_B/brightness"
LED3_B_BRIGHTNESS_FILE="/sys/class/leds/LED3_B/brightness"

# Blue LED Current
LED1_B_CURRENT_FILE="/sys/class/leds/LED1_B/led_current"
LED2_B_CURRENT_FILE="/sys/class/leds/LED2_B/led_current"
LED3_B_CURRENT_FILE="/sys/class/leds/LED3_B/led_current"

# Initial Boot
busybox cd /
busybox date >>boot.txt
exec >>boot.txt 2>&1
busybox rm /init

# Include device specific vars
source /sbin/bootrec-device

# Create directories
busybox mkdir -m 755 -p /dev/block
busybox mkdir -m 755 -p /dev/input
busybox mkdir -m 555 -p /proc
busybox mkdir -m 755 -p /sys

# Create device nodes
busybox mknod -m 600 /dev/block/mmcblk0 b 179 0
busybox mknod -m 600 ${BOOTREC_EVENT_NODE}
busybox mknod -m 666 /dev/null c 1 3

# Mount file-systems
busybox mount -t proc proc /proc
busybox mount -t sysfs sysfs /sys

# Initialize the Key-Check Process
busybox echo '50' > /sys/class/timed_output/vibrator/enable
busybox cat ${BOOTREC_EVENT} > /dev/keycheck&

# Activate LEDs
echo '255' > $LED1_G_BRIGHTNESS_FILE
echo '255' > $LED2_G_BRIGHTNESS_FILE
echo '255' > $LED3_G_BRIGHTNESS_FILE
echo '255' > $LED1_R_BRIGHTNESS_FILE
echo '255' > $LED2_R_BRIGHTNESS_FILE
echo '255' > $LED3_R_BRIGHTNESS_FILE

# LEDs Starting animation
echo '16' > $LED1_G_CURRENT_FILE
echo '16' > $LED2_G_CURRENT_FILE
echo '16' > $LED3_G_CURRENT_FILE
busybox sleep 0.05
echo '32' > $LED1_G_CURRENT_FILE
echo '32' > $LED2_G_CURRENT_FILE
echo '32' > $LED3_G_CURRENT_FILE
busybox sleep 0.05
echo '64' > $LED1_G_CURRENT_FILE
echo '64' > $LED2_G_CURRENT_FILE
echo '64' > $LED3_G_CURRENT_FILE
busybox sleep 0.05
echo '92' > $LED1_G_CURRENT_FILE
echo '92' > $LED2_G_CURRENT_FILE
echo '92' > $LED3_G_CURRENT_FILE
busybox sleep 1
echo '64' > $LED1_G_CURRENT_FILE
echo '64' > $LED2_G_CURRENT_FILE
echo '64' > $LED3_G_CURRENT_FILE
busybox sleep 0.05
echo '32' > $LED1_G_CURRENT_FILE
echo '32' > $LED2_G_CURRENT_FILE
echo '32' > $LED3_G_CURRENT_FILE
busybox sleep 0.05
echo '0' > $LED1_G_BRIGHTNESS_FILE
echo '0' > $LED2_G_BRIGHTNESS_FILE
echo '0' > $LED3_G_BRIGHTNESS_FILE
echo '0' > $LED1_G_CURRENT_FILE
echo '0' > $LED2_G_CURRENT_FILE
echo '0' > $LED3_G_CURRENT_FILE
echo '16' > $LED1_R_CURRENT_FILE
echo '16' > $LED2_R_CURRENT_FILE
echo '16' > $LED3_R_CURRENT_FILE
busybox sleep 0.05
echo '32' > $LED1_R_CURRENT_FILE
echo '32' > $LED2_R_CURRENT_FILE
echo '32' > $LED3_R_CURRENT_FILE
busybox sleep 0.05
echo '64' > $LED1_R_CURRENT_FILE
echo '64' > $LED2_R_CURRENT_FILE
echo '64' > $LED3_R_CURRENT_FILE
busybox sleep 0.05
echo '92' > $LED1_R_CURRENT_FILE
echo '92' > $LED2_R_CURRENT_FILE
echo '92' > $LED3_R_CURRENT_FILE
busybox sleep 1
echo '64' > $LED1_R_CURRENT_FILE
echo '64' > $LED2_R_CURRENT_FILE
echo '64' > $LED3_R_CURRENT_FILE
busybox sleep 0.05
echo '32' > $LED1_R_CURRENT_FILE
echo '32' > $LED2_R_CURRENT_FILE
echo '32' > $LED3_R_CURRENT_FILE
busybox sleep 0.05
echo '0' > $LED1_R_BRIGHTNESS_FILE
echo '0' > $LED2_R_BRIGHTNESS_FILE
echo '0' > $LED3_R_BRIGHTNESS_FILE
echo '0' > $LED1_R_CURRENT_FILE
echo '0' > $LED2_R_CURRENT_FILE
echo '0' > $LED3_R_CURRENT_FILE

# Load the System Ramdisk
load_image=/sbin/ramdisk.cpio

#
# Boot Decisions for the user
#

# If the user enters the key combination for Recovery, the Recovery is called in
if [ -s /dev/keycheck ] || busybox grep -q warmboot=0x77665502 /proc/cmdline ; then
	busybox echo 'RECOVERY BOOT' >>boot.txt
	# LEDs Recovery Animation
	busybox echo '100' > /sys/class/timed_output/vibrator/enable
	echo '255' > $LED1_B_BRIGHTNESS_FILE
	echo '255' > $LED2_B_BRIGHTNESS_FILE
	echo '255' > $LED3_B_BRIGHTNESS_FILE
	echo '32' > $LED1_B_CURRENT_FILE
	echo '32' > $LED2_B_CURRENT_FILE
	echo '32' > $LED3_B_CURRENT_FILE
	busybox sleep 0.05
	echo '64' > $LED1_B_CURRENT_FILE
	echo '64' > $LED2_B_CURRENT_FILE
	echo '64' > $LED3_B_CURRENT_FILE
	busybox sleep 0.05
	echo '128' > $LED1_B_CURRENT_FILE
	echo '128' > $LED2_B_CURRENT_FILE
	echo '128' > $LED3_B_CURRENT_FILE
	busybox sleep 1
	echo '64' > $LED1_B_CURRENT_FILE
	echo '64' > $LED2_B_CURRENT_FILE
	echo '64' > $LED3_B_CURRENT_FILE
	busybox sleep 0.05
	echo '32' > $LED1_B_CURRENT_FILE
	echo '32' > $LED2_B_CURRENT_FILE
	echo '32' > $LED3_B_CURRENT_FILE
	busybox sleep 0.05
	echo '0' > $LED1_B_BRIGHTNESS_FILE
	echo '0' > $LED2_B_BRIGHTNESS_FILE
	echo '0' > $LED3_B_BRIGHTNESS_FILE
	echo '0' > $LED1_B_CURRENT_FILE
	echo '0' > $LED2_B_CURRENT_FILE
	echo '0' > $LED3_B_CURRENT_FILE
	# Load Recovery Ramdisk
	busybox mknod -m 600 ${BOOTREC_FOTA_NODE}
	busybox mount -o remount,rw /
	busybox ln -sf /sbin/busybox /sbin/sh
	extract_elf_ramdisk -i ${BOOTREC_FOTA} -o /sbin/ramdisk-recovery.cpio -t / -c
	busybox rm /sbin/sh
	load_image=/sbin/ramdisk-recovery.cpio
else
	# If nothing occurs, the device boots to the system
	busybox echo 'ANDROID BOOT' >>boot.txt
	# LEDs System Animation
	echo '255' > $LED1_G_BRIGHTNESS_FILE
	echo '255' > $LED2_G_BRIGHTNESS_FILE
	echo '255' > $LED3_G_BRIGHTNESS_FILE
	echo '32' > $LED1_G_CURRENT_FILE
	echo '32' > $LED2_G_CURRENT_FILE
	echo '32' > $LED3_G_CURRENT_FILE
	busybox sleep 0.05
	echo '64' > $LED1_G_CURRENT_FILE
	echo '64' > $LED2_G_CURRENT_FILE
	echo '64' > $LED3_G_CURRENT_FILE
	busybox sleep 0.05
	echo '128' > $LED1_G_CURRENT_FILE
	echo '128' > $LED2_G_CURRENT_FILE
	echo '128' > $LED3_G_CURRENT_FILE
	busybox sleep 1
	echo '64' > $LED1_G_CURRENT_FILE
	echo '64' > $LED2_G_CURRENT_FILE
	echo '64' > $LED3_G_CURRENT_FILE
	busybox sleep 0.05
	echo '32' > $LED1_G_CURRENT_FILE
	echo '32' > $LED2_G_CURRENT_FILE
	echo '32' > $LED3_G_CURRENT_FILE
	busybox sleep 0.05
	echo '0' > $LED1_G_BRIGHTNESS_FILE
	echo '0' > $LED2_G_BRIGHTNESS_FILE
	echo '0' > $LED3_G_BRIGHTNESS_FILE
	echo '0' > $LED1_G_CURRENT_FILE
	echo '0' > $LED2_G_CURRENT_FILE
	echo '0' > $LED3_G_CURRENT_FILE
fi

# Kill the key-check process
busybox pkill -f "busybox cat ${BOOTREC_EVENT}"
busybox echo '0' > /sys/class/timed_output/vibrator/enable

# Unpack the selected ramdisk image
busybox cpio -i < ${load_image}

busybox umount /proc
busybox umount /sys

busybox rm -fr /dev/*
busybox date >>boot.txt
export PATH="${_PATH}"
exec /init
