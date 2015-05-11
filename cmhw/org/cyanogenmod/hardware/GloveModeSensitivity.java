/*
 * Copyright (C) 2015 The CyanogenMod Project
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

package org.cyanogenmod.hardware;

import org.cyanogenmod.hardware.util.FileUtils;

import java.io.File;

public class GloveModeSensitivity {

    private static String SENSITIVITY_PATH = "/sys/devices/i2c-3/3-0024/main_ttsp_core.cyttsp4_i2c_adapter/finger_threshold";

    public static boolean isSupported() {
        File file = new File(SENSITIVITY_PATH);
        return file.exists();
    }

    public static int getMaxIntensity()  {
        return 280;
    }
    public static int getMinIntensity()  {
        return 20;
    }
    public static int getWarningThreshold()  {
        return 150;
    }
    public static int getCurIntensity()  {
        return Integer.parseInt(FileUtils.readOneLine(SENSITIVITY_PATH));
    }
    public static int getDefaultIntensity()  {
        return 60;
    }
    public static boolean setIntensity(int intensity)  {
        return FileUtils.writeLine(SENSITIVITY_PATH, String.valueOf(intensity));
    }
}
