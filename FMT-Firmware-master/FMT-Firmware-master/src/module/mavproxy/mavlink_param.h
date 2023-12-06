/******************************************************************************
 * Copyright 2020 The Firmament Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *****************************************************************************/

#ifndef MAVLINK_PARAM_H__
#define MAVLINK_PARAM_H__

#include <firmament.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    const char* name;
    float value;
    param_t* param;
} mav_param_t;

#define MAVLINK_PARAM_DECLARE(_name) mav_param_t _name

#define MAVLINK_PARAM_DEFINE(_name, _value) \
    {                                       \
        .name = #_name,                     \
        .value = _value,                    \
        .param = NULL                       \
    }

#define MAVLINK_PARAM_DEFINE_FULL(_name, _value, _param) \
    {                                                    \
        .name = #_name,                                  \
        .value = _value,                                 \
        .param = _param                                  \
    }

typedef struct {
    MAVLINK_PARAM_DECLARE(SYS_AUTOSTART);
    MAVLINK_PARAM_DECLARE(SYS_AUTOCONFIG);
    MAVLINK_PARAM_DECLARE(SYS_PARAM_VER);
    MAVLINK_PARAM_DECLARE(MAV_SYS_ID);
    MAVLINK_PARAM_DECLARE(MAV_COMP_ID);
    MAVLINK_PARAM_DECLARE(MAV_PROTO_VER);
    MAVLINK_PARAM_DECLARE(MAV_RADIO_ID);
    MAVLINK_PARAM_DECLARE(MAV_TYPE);
    MAVLINK_PARAM_DECLARE(MAV_USEHILGPS);
    MAVLINK_PARAM_DECLARE(MAV_FWDEXTSP);
    MAVLINK_PARAM_DECLARE(MAV_BROADCAST);
    MAVLINK_PARAM_DECLARE(CAL_BOARD_ID);
    MAVLINK_PARAM_DECLARE(CAL_GYRO0_ID);
    MAVLINK_PARAM_DECLARE(CAL_GYRO0_XOFF);
    MAVLINK_PARAM_DECLARE(CAL_GYRO0_YOFF);
    MAVLINK_PARAM_DECLARE(CAL_GYRO0_ZOFF);
    MAVLINK_PARAM_DECLARE(CAL_GYRO0_XSCALE);
    MAVLINK_PARAM_DECLARE(CAL_GYRO0_YSCALE);
    MAVLINK_PARAM_DECLARE(CAL_GYRO0_ZSCALE);
    MAVLINK_PARAM_DECLARE(CAL_MAG0_ID);
    MAVLINK_PARAM_DECLARE(CAL_MAG1_ID);
    MAVLINK_PARAM_DECLARE(CAL_MAG2_ID);
    MAVLINK_PARAM_DECLARE(CAL_MAG0_ROT);
    MAVLINK_PARAM_DECLARE(CAL_MAG1_ROT);
    MAVLINK_PARAM_DECLARE(CAL_MAG2_ROT);
    MAVLINK_PARAM_DECLARE(CAL_MAG0_XOFF);
    MAVLINK_PARAM_DECLARE(CAL_MAG0_YOFF);
    MAVLINK_PARAM_DECLARE(CAL_MAG0_ZOFF);
    MAVLINK_PARAM_DECLARE(CAL_MAG0_XSCALE);
    MAVLINK_PARAM_DECLARE(CAL_MAG0_YSCALE);
    MAVLINK_PARAM_DECLARE(CAL_MAG0_ZSCALE);
    MAVLINK_PARAM_DECLARE(CAL_ACC0_ID);
    MAVLINK_PARAM_DECLARE(CAL_ACC0_XOFF);
    MAVLINK_PARAM_DECLARE(CAL_ACC0_YOFF);
    MAVLINK_PARAM_DECLARE(CAL_ACC0_ZOFF);
    MAVLINK_PARAM_DECLARE(CAL_ACC0_XSCALE);
    MAVLINK_PARAM_DECLARE(CAL_ACC0_YSCALE);
    MAVLINK_PARAM_DECLARE(CAL_ACC0_ZSCALE);
    MAVLINK_PARAM_DECLARE(CAL_ACC_PRIME);
    MAVLINK_PARAM_DECLARE(CAL_GYRO_PRIME);
    MAVLINK_PARAM_DECLARE(CAL_MAG_PRIME);
    MAVLINK_PARAM_DECLARE(CAL_MAG_SIDES);
    MAVLINK_PARAM_DECLARE(CAL_BARO_PRIME);
    MAVLINK_PARAM_DECLARE(SENS_DPRES_OFF);
    MAVLINK_PARAM_DECLARE(SENS_DPRES_ANSC);
    MAVLINK_PARAM_DECLARE(SENS_BARO_QNH);
    MAVLINK_PARAM_DECLARE(SENS_BOARD_ROT);
    MAVLINK_PARAM_DECLARE(SENS_FLOW_ROT);
    MAVLINK_PARAM_DECLARE(SENS_BOARD_X_OFF);
    MAVLINK_PARAM_DECLARE(SENS_BOARD_Y_OFF);
    MAVLINK_PARAM_DECLARE(SENS_BOARD_Z_OFF);
    MAVLINK_PARAM_DECLARE(SENS_EXT_MAG_ROT);
    MAVLINK_PARAM_DECLARE(SENS_EXT_MAG);
    MAVLINK_PARAM_DECLARE(TRIM_ROLL);
    MAVLINK_PARAM_DECLARE(TRIM_PITCH);
    MAVLINK_PARAM_DECLARE(TRIM_YAW);
    MAVLINK_PARAM_DECLARE(RC1_MIN);
    MAVLINK_PARAM_DECLARE(RC1_TRIM);
    MAVLINK_PARAM_DECLARE(RC1_MAX);
    MAVLINK_PARAM_DECLARE(RC1_REV);
    MAVLINK_PARAM_DECLARE(RC1_DZ);
    MAVLINK_PARAM_DECLARE(RC2_MIN);
    MAVLINK_PARAM_DECLARE(RC2_TRIM);
    MAVLINK_PARAM_DECLARE(RC2_MAX);
    MAVLINK_PARAM_DECLARE(RC2_REV);
    MAVLINK_PARAM_DECLARE(RC2_DZ);
    MAVLINK_PARAM_DECLARE(RC3_MIN);
    MAVLINK_PARAM_DECLARE(RC3_TRIM);
    MAVLINK_PARAM_DECLARE(RC3_MAX);
    MAVLINK_PARAM_DECLARE(RC3_REV);
    MAVLINK_PARAM_DECLARE(RC3_DZ);
    MAVLINK_PARAM_DECLARE(RC4_MIN);
    MAVLINK_PARAM_DECLARE(RC4_TRIM);
    MAVLINK_PARAM_DECLARE(RC4_MAX);
    MAVLINK_PARAM_DECLARE(RC4_REV);
    MAVLINK_PARAM_DECLARE(RC4_DZ);
    MAVLINK_PARAM_DECLARE(RC5_MIN);
    MAVLINK_PARAM_DECLARE(RC5_TRIM);
    MAVLINK_PARAM_DECLARE(RC5_MAX);
    MAVLINK_PARAM_DECLARE(RC5_REV);
    MAVLINK_PARAM_DECLARE(RC5_DZ);
    MAVLINK_PARAM_DECLARE(RC6_MIN);
    MAVLINK_PARAM_DECLARE(RC6_TRIM);
    MAVLINK_PARAM_DECLARE(RC6_MAX);
    MAVLINK_PARAM_DECLARE(RC6_REV);
    MAVLINK_PARAM_DECLARE(RC6_DZ);
    MAVLINK_PARAM_DECLARE(RC7_MIN);
    MAVLINK_PARAM_DECLARE(RC7_TRIM);
    MAVLINK_PARAM_DECLARE(RC7_MAX);
    MAVLINK_PARAM_DECLARE(RC7_REV);
    MAVLINK_PARAM_DECLARE(RC7_DZ);
    MAVLINK_PARAM_DECLARE(RC8_MIN);
    MAVLINK_PARAM_DECLARE(RC8_TRIM);
    MAVLINK_PARAM_DECLARE(RC8_MAX);
    MAVLINK_PARAM_DECLARE(RC8_REV);
    MAVLINK_PARAM_DECLARE(RC8_DZ);
    MAVLINK_PARAM_DECLARE(RC9_MIN);
    MAVLINK_PARAM_DECLARE(RC9_TRIM);
    MAVLINK_PARAM_DECLARE(RC9_MAX);
    MAVLINK_PARAM_DECLARE(RC9_REV);
    MAVLINK_PARAM_DECLARE(RC9_DZ);
    MAVLINK_PARAM_DECLARE(RC10_MIN);
    MAVLINK_PARAM_DECLARE(RC10_TRIM);
    MAVLINK_PARAM_DECLARE(RC10_MAX);
    MAVLINK_PARAM_DECLARE(RC10_REV);
    MAVLINK_PARAM_DECLARE(RC10_DZ);
    MAVLINK_PARAM_DECLARE(RC11_MIN);
    MAVLINK_PARAM_DECLARE(RC11_TRIM);
    MAVLINK_PARAM_DECLARE(RC11_MAX);
    MAVLINK_PARAM_DECLARE(RC11_REV);
    MAVLINK_PARAM_DECLARE(RC11_DZ);
    MAVLINK_PARAM_DECLARE(RC12_MIN);
    MAVLINK_PARAM_DECLARE(RC12_TRIM);
    MAVLINK_PARAM_DECLARE(RC12_MAX);
    MAVLINK_PARAM_DECLARE(RC12_REV);
    MAVLINK_PARAM_DECLARE(RC12_DZ);
    MAVLINK_PARAM_DECLARE(RC13_MIN);
    MAVLINK_PARAM_DECLARE(RC13_TRIM);
    MAVLINK_PARAM_DECLARE(RC13_MAX);
    MAVLINK_PARAM_DECLARE(RC13_REV);
    MAVLINK_PARAM_DECLARE(RC13_DZ);
    MAVLINK_PARAM_DECLARE(RC14_MIN);
    MAVLINK_PARAM_DECLARE(RC14_TRIM);
    MAVLINK_PARAM_DECLARE(RC14_MAX);
    MAVLINK_PARAM_DECLARE(RC14_REV);
    MAVLINK_PARAM_DECLARE(RC14_DZ);
    MAVLINK_PARAM_DECLARE(RC15_MIN);
    MAVLINK_PARAM_DECLARE(RC15_TRIM);
    MAVLINK_PARAM_DECLARE(RC15_MAX);
    MAVLINK_PARAM_DECLARE(RC15_REV);
    MAVLINK_PARAM_DECLARE(RC15_DZ);
    MAVLINK_PARAM_DECLARE(RC16_MIN);
    MAVLINK_PARAM_DECLARE(RC16_TRIM);
    MAVLINK_PARAM_DECLARE(RC16_MAX);
    MAVLINK_PARAM_DECLARE(RC16_REV);
    MAVLINK_PARAM_DECLARE(RC16_DZ);
    MAVLINK_PARAM_DECLARE(RC17_MIN);
    MAVLINK_PARAM_DECLARE(RC17_TRIM);
    MAVLINK_PARAM_DECLARE(RC17_MAX);
    MAVLINK_PARAM_DECLARE(RC17_REV);
    MAVLINK_PARAM_DECLARE(RC17_DZ);
    MAVLINK_PARAM_DECLARE(RC18_MIN);
    MAVLINK_PARAM_DECLARE(RC18_TRIM);
    MAVLINK_PARAM_DECLARE(RC18_MAX);
    MAVLINK_PARAM_DECLARE(RC18_REV);
    MAVLINK_PARAM_DECLARE(RC18_DZ);
    MAVLINK_PARAM_DECLARE(RC_MAP_ROLL);
    MAVLINK_PARAM_DECLARE(RC_MAP_PITCH);
    MAVLINK_PARAM_DECLARE(RC_MAP_YAW);
    MAVLINK_PARAM_DECLARE(RC_MAP_THROTTLE);
    MAVLINK_PARAM_DECLARE(RC_MAP_FAILSAFE);
    MAVLINK_PARAM_DECLARE(RC_MAP_MODE_SW);
    MAVLINK_PARAM_DECLARE(RC_MAP_RETURN_SW);
    MAVLINK_PARAM_DECLARE(RC_MAP_FLAPS);
    MAVLINK_PARAM_DECLARE(RC_MAP_RATT_SW);
    MAVLINK_PARAM_DECLARE(RC_MAP_POSCTL_SW);
    MAVLINK_PARAM_DECLARE(RC_MAP_LOITER_SW);
    MAVLINK_PARAM_DECLARE(RC_MAP_ACRO_SW);
    MAVLINK_PARAM_DECLARE(RC_MAP_OFFB_SW);
    MAVLINK_PARAM_DECLARE(RC_MAP_KILL_SW);
    MAVLINK_PARAM_DECLARE(RC_MAP_AUX1);
    MAVLINK_PARAM_DECLARE(RC_MAP_AUX2);
    MAVLINK_PARAM_DECLARE(RC_MAP_AUX3);
    MAVLINK_PARAM_DECLARE(RC_MAP_AUX4);
    MAVLINK_PARAM_DECLARE(RC_MAP_AUX5);
    MAVLINK_PARAM_DECLARE(RC_MAP_PARAM1);
    MAVLINK_PARAM_DECLARE(RC_MAP_PARAM2);
    MAVLINK_PARAM_DECLARE(RC_MAP_PARAM3);
    MAVLINK_PARAM_DECLARE(RC_MAP_FLTMODE);
    MAVLINK_PARAM_DECLARE(RC_FAILS_THR);
    MAVLINK_PARAM_DECLARE(RC_ASSIST_TH);
    MAVLINK_PARAM_DECLARE(RC_AUTO_TH);
    MAVLINK_PARAM_DECLARE(RC_RATT_TH);
    MAVLINK_PARAM_DECLARE(RC_POSCTL_TH);
    MAVLINK_PARAM_DECLARE(RC_RETURN_TH);
    MAVLINK_PARAM_DECLARE(RC_LOITER_TH);
    MAVLINK_PARAM_DECLARE(RC_ACRO_TH);
    MAVLINK_PARAM_DECLARE(RC_OFFB_TH);
    MAVLINK_PARAM_DECLARE(RC_KILLSWITCH_TH);
    MAVLINK_PARAM_DECLARE(RC_CHAN_CNT);
    MAVLINK_PARAM_DECLARE(RC_TH_USER);
    MAVLINK_PARAM_DECLARE(COM_DL_LOSS_T);
    MAVLINK_PARAM_DECLARE(COM_DL_REG_T);
    MAVLINK_PARAM_DECLARE(COM_EF_THROT);
    MAVLINK_PARAM_DECLARE(COM_EF_C2T);
    MAVLINK_PARAM_DECLARE(COM_EF_TIME);
    MAVLINK_PARAM_DECLARE(COM_RC_LOSS_T);
    MAVLINK_PARAM_DECLARE(COM_HOME_H_T);
    MAVLINK_PARAM_DECLARE(COM_HOME_V_T);
    MAVLINK_PARAM_DECLARE(COM_AUTOS_PAR);
    MAVLINK_PARAM_DECLARE(COM_RC_IN_MODE);
    MAVLINK_PARAM_DECLARE(COM_RC_ARM_HYST);
    MAVLINK_PARAM_DECLARE(COM_DISARM_LAND);
    MAVLINK_PARAM_DECLARE(COM_LOW_BAT_ACT);
    MAVLINK_PARAM_DECLARE(BAT_H_CURR);
    MAVLINK_PARAM_DECLARE(BAT_V_CURR);
    MAVLINK_PARAM_DECLARE(BAT_C_SAFE);
    MAVLINK_PARAM_DECLARE(BAT_C_SAFE_UB);
    MAVLINK_PARAM_DECLARE(BAT_V_SCALE_IO);
    MAVLINK_PARAM_DECLARE(BAT_CNT_V_VOLT);
    MAVLINK_PARAM_DECLARE(BAT_CNT_V_CURR);
    MAVLINK_PARAM_DECLARE(BAT_V_OFFS_CURR);
    MAVLINK_PARAM_DECLARE(BAT_V_DIV);
    MAVLINK_PARAM_DECLARE(BAT_A_PER_V);
    MAVLINK_PARAM_DECLARE(BAT_V_EMPTY);
    MAVLINK_PARAM_DECLARE(BAT_V_CHARGED);
    MAVLINK_PARAM_DECLARE(BAT_LOW_THR);
    MAVLINK_PARAM_DECLARE(BAT_CRIT_THR);
    MAVLINK_PARAM_DECLARE(BAT_EMERGEN_THR);
    MAVLINK_PARAM_DECLARE(BAT_V_LOAD_DROP);
    MAVLINK_PARAM_DECLARE(BAT_N_CELLS);
    MAVLINK_PARAM_DECLARE(BAT_CAPACITY);
    MAVLINK_PARAM_DECLARE(NAV_DLL_ACT);
    MAVLINK_PARAM_DECLARE(NAV_RCL_ACT);
    MAVLINK_PARAM_DECLARE(RTL_RETURN_ALT);
    MAVLINK_PARAM_DECLARE(RTL_DESCEND_ALT);
    MAVLINK_PARAM_DECLARE(RTL_LAND_DELAY);
    MAVLINK_PARAM_DECLARE(RTL_MIN_DIST);
    MAVLINK_PARAM_DECLARE(COM_FLTMODE1);
    MAVLINK_PARAM_DECLARE(COM_FLTMODE2);
    MAVLINK_PARAM_DECLARE(COM_FLTMODE3);
    MAVLINK_PARAM_DECLARE(COM_FLTMODE4);
    MAVLINK_PARAM_DECLARE(COM_FLTMODE5);
    MAVLINK_PARAM_DECLARE(COM_FLTMODE6);
    MAVLINK_PARAM_DECLARE(GF_ACTION);
    MAVLINK_PARAM_DECLARE(GF_ALTMODE);
    MAVLINK_PARAM_DECLARE(GF_SOURCE);
    MAVLINK_PARAM_DECLARE(GF_COUNT);
    MAVLINK_PARAM_DECLARE(GF_MAX_HOR_DIST);
    MAVLINK_PARAM_DECLARE(GF_MAX_VER_DIST);
    MAVLINK_PARAM_DECLARE(GF_FENCE_SW);
    MAVLINK_PARAM_DECLARE(MC_ROLL_TC);
    MAVLINK_PARAM_DECLARE(MC_PITCH_TC);
    MAVLINK_PARAM_DECLARE(MC_ROLL_P);
    MAVLINK_PARAM_DECLARE(MC_ROLLRATE_P);
    MAVLINK_PARAM_DECLARE(MC_ROLLRATE_I);
    MAVLINK_PARAM_DECLARE(MC_ROLLRATE_D);
    MAVLINK_PARAM_DECLARE(MC_PITCH_P);
    MAVLINK_PARAM_DECLARE(MC_PITCHRATE_P);
    MAVLINK_PARAM_DECLARE(MC_PITCHRATE_I);
    MAVLINK_PARAM_DECLARE(MC_PITCHRATE_D);
    MAVLINK_PARAM_DECLARE(MC_YAW_P);
    MAVLINK_PARAM_DECLARE(MC_YAWRATE_P);
    MAVLINK_PARAM_DECLARE(MC_YAWRATE_I);
    MAVLINK_PARAM_DECLARE(MC_YAWRATE_D);
    MAVLINK_PARAM_DECLARE(MPC_THR_MIN);
    MAVLINK_PARAM_DECLARE(MPC_THR_HOVER);
    MAVLINK_PARAM_DECLARE(MPC_THR_MAX);
    MAVLINK_PARAM_DECLARE(MPC_MANTHR_MIN);
    MAVLINK_PARAM_DECLARE(MPC_MANTHR_MAX);
    MAVLINK_PARAM_DECLARE(MPC_Z_P);
    MAVLINK_PARAM_DECLARE(MPC_Z_VEL_P);
    MAVLINK_PARAM_DECLARE(MPC_Z_VEL_I);
    MAVLINK_PARAM_DECLARE(MPC_Z_VEL_D);
    MAVLINK_PARAM_DECLARE(MPC_XY_P);
    MAVLINK_PARAM_DECLARE(MPC_XY_VEL_P);
    MAVLINK_PARAM_DECLARE(MPC_XY_VEL_I);
    MAVLINK_PARAM_DECLARE(MPC_XY_VEL_D);
} mav_param_list_t;

enum Rotation {
    ROTATION_NONE = 0,
    ROTATION_YAW_45 = 1,
    ROTATION_YAW_90 = 2,
    ROTATION_YAW_135 = 3,
    ROTATION_YAW_180 = 4,
    ROTATION_YAW_225 = 5,
    ROTATION_YAW_270 = 6,
    ROTATION_YAW_315 = 7,
    ROTATION_ROLL_180 = 8,
    ROTATION_ROLL_180_YAW_45 = 9,
    ROTATION_ROLL_180_YAW_90 = 10,
    ROTATION_ROLL_180_YAW_135 = 11,
    ROTATION_PITCH_180 = 12,
    ROTATION_ROLL_180_YAW_225 = 13,
    ROTATION_ROLL_180_YAW_270 = 14,
    ROTATION_ROLL_180_YAW_315 = 15,
    ROTATION_ROLL_90 = 16,
    ROTATION_ROLL_90_YAW_45 = 17,
    ROTATION_ROLL_90_YAW_90 = 18,
    ROTATION_ROLL_90_YAW_135 = 19,
    ROTATION_ROLL_270 = 20,
    ROTATION_ROLL_270_YAW_45 = 21,
    ROTATION_ROLL_270_YAW_90 = 22,
    ROTATION_ROLL_270_YAW_135 = 23,
    ROTATION_PITCH_90 = 24,
    ROTATION_PITCH_270 = 25,
    ROTATION_ROLL_270_YAW_270 = 26,
    ROTATION_ROLL_180_PITCH_270 = 27,
    ROTATION_PITCH_90_YAW_180 = 28,
    ROTATION_PITCH_90_ROLL_90 = 29,
    ROTATION_YAW_293_PITCH_68_ROLL_90 = 30,
    ROTATION_PITCH_90_ROLL_270 = 31,
    ROTATION_MAX
};

void mavlink_param_sendall(void);
fmt_err_t mavlink_param_set(const char* name, float val, uint8_t mav_param_type);
fmt_err_t mavlink_param_send(const param_t* param);
uint16_t get_mavparam_num(void);

// mavlink param (not used by FMT) api
fmt_err_t send_mavparam_by_name(char* name);
fmt_err_t send_mavparam_by_index(int16_t index);

#ifdef __cplusplus
}
#endif

#endif
