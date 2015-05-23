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

char const*const RED1_LED_FILE       = "/sys/class/leds/LED1_R/brightness";
char const*const RED2_LED_FILE       = "/sys/class/leds/LED2_R/brightness";
char const*const RED3_LED_FILE       = "/sys/class/leds/LED3_R/brightness";
char const*const RED1C_LED_FILE      = "/sys/class/leds/LED1_R/led_current";
char const*const RED2C_LED_FILE      = "/sys/class/leds/LED2_R/led_current";
char const*const RED3C_LED_FILE      = "/sys/class/leds/LED3_R/led_current";

char const*const GREEN1_LED_FILE     = "/sys/class/leds/LED1_G/brightness";
char const*const GREEN2_LED_FILE     = "/sys/class/leds/LED2_G/brightness";
char const*const GREEN3_LED_FILE     = "/sys/class/leds/LED3_G/brightness";
char const*const GREEN1C_LED_FILE    = "/sys/class/leds/LED1_G/led_current";
char const*const GREEN2C_LED_FILE    = "/sys/class/leds/LED2_G/led_current";
char const*const GREEN3C_LED_FILE    = "/sys/class/leds/LED3_G/led_current";

char const*const BLUE1_LED_FILE      = "/sys/class/leds/LED1_B/brightness";
char const*const BLUE2_LED_FILE      = "/sys/class/leds/LED2_B/brightness";
char const*const BLUE3_LED_FILE      = "/sys/class/leds/LED3_B/brightness";
char const*const BLUE1C_LED_FILE     = "/sys/class/leds/LED1_B/led_current";
char const*const BLUE2C_LED_FILE     = "/sys/class/leds/LED2_B/led_current";
char const*const BLUE3C_LED_FILE     = "/sys/class/leds/LED3_B/led_current";

const int LCD_BRIGHTNESS_MIN         = 1;
