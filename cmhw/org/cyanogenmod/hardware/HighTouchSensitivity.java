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

import android.util.Log;
import java.io.File;
import org.cyanogenmod.hardware.util.FileUtils;

/**
 * Glove mode / high touch sensitivity
 */
public class HighTouchSensitivity {

    private static final String TAG = "HighTouchSensitivity";
    private static final String GLOVEFT_PATH = "/sys/devices/i2c-3/3-0024/main_ttsp_core.cyttsp4_i2c_adapter/finger_threshold";
    private static final String GLOVESD_PATH = "/sys/devices/i2c-3/3-0024/main_ttsp_core.cyttsp4_i2c_adapter/signal_disparity";
    private static final String HIGHTOUCHSENSITIVITY_FINGER_TRESHOLD_OFF = "280";
    private static final String HIGHTOUCHSENSITIVITY_FINGER_TRESHOLD_ON = "280";
    private static final int HIGHTOUCHSENSITIVITY_FINGER_TRESHOLD_ON_READ = 280;
    private static final String HIGHTOUCHSENSITIVITY_SIGNAL_DISPARITY_OFF = "1";
    private static final String HIGHTOUCHSENSITIVITY_SIGNAL_DISPARITY_ON = "0";
    private static final int HIGHTOUCHSENSITIVITY_SIGNAL_DISPARITY_ON_READ = 0;

    /**
     * This is where we define whether the device supports high touch sensitivity.
	 * Huashan does support the high touch sensitivity function
     *
     * @return boolean Supported devices must return always true
     */
    public static boolean isSupported() {
        File f_ft = new File(GLOVEFT_PATH);
        File f_sd = new File(GLOVESD_PATH);

        if (f_ft.exists() && f_sd.exists()) {
            return true;
        } else {
            Log.e(TAG, "Glove mode / high touch sensitivity is NOT supported (" + Boolean.toString(f_ft.exists()) + " & " + Boolean.toString(f_sd.exists()) + ")");
            return false;
        }
    }

    /**
     * This method return the current activation status of high touch sensitivity
     *
     * @return boolean Must be false if high touch sensitivity is not supported or not activated,
     * or the operation failed while reading the status; true in any other case.
     */
    public static boolean isEnabled() {
        int val_ft , val_sd;

        val_ft = Integer.parseInt(FileUtils.readOneLine(GLOVEFT_PATH));
        val_sd = Integer.parseInt(FileUtils.readOneLine(GLOVESD_PATH));

        return (val_ft == HIGHTOUCHSENSITIVITY_FINGER_TRESHOLD_ON_READ && val_sd == HIGHTOUCHSENSITIVITY_SIGNAL_DISPARITY_ON_READ);
    }

    /**
     * This method allows the user to setup high touch sensitivity status.
     *
     * @param status The new high touch sensitivity status
     * @return boolean Must be false if high touch sensitivity is not supported or the operation
     * failed; true in any other case.
     */
    public static boolean setEnabled(boolean status) {
        if (! FileUtils.writeLine(GLOVESD_PATH, status ? HIGHTOUCHSENSITIVITY_SIGNAL_DISPARITY_ON : HIGHTOUCHSENSITIVITY_SIGNAL_DISPARITY_OFF)) {
            Log.e(TAG, "Glove mode setEnabled : error writing " + GLOVESD_PATH);
            return false;
        }
        if (! FileUtils.writeLine(GLOVEFT_PATH, status ? HIGHTOUCHSENSITIVITY_FINGER_TRESHOLD_ON : HIGHTOUCHSENSITIVITY_FINGER_TRESHOLD_OFF)) {
            Log.e(TAG, "Glove mode setEnabled : error writing " + GLOVEFT_PATH);
            return false;
        }
        return true;
    }
}
