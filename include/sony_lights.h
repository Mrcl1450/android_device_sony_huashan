/*
 * Copyright (C) 2012-2013 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

char const*const LCD_BACKLIGHT_FILE  = "/sys/devices/i2c-10/10-0040/leds/lcd-backlight1/brightness";
char const*const LCD_BACKLIGHT2_FILE = "/sys/devices/i2c-10/10-0040/leds/lcd-backlight2/brightness";
char const*const MAX_BRIGHTNESS_FILE = "/sys/devices/i2c-10/10-0040/leds/lcd-backlight1/max_brightness";
char const*const RED_LED_FILE        = "/sys/class/leds/LED1_R/brightness";
char const*const GREEN_LED_FILE      = "/sys/class/leds/LED1_G/brightness";
char const*const BLUE_LED_FILE       = "/sys/class/leds/LED1_B/brightness";

char const*const LED_FILE_PATTERN[]		= {
"/sys/class/leds/as3677::rgb1/use_pattern",
"/sys/class/leds/as3677::rgb2/use_pattern",
"/sys/class/leds/as3677::rgb3/use_pattern",
};

char const*const PATTERNOFF			= "0,0,0,0";
