# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from common msm7x30
-include device/htc/msm7x30-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/htc/protou/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := protou

BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x03200000
BOARD_KERNEL_PAGESIZE := 2048

TARGET_ARCH := arm
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
TARGET_USE_SCORPION_PLD_SET := true
TARGET_SCORPION_BIONIC_PLDOFFS := 6
TARGET_SCORPION_BIONIC_PLDSIZE := 128

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := protou
BOARD_VENDOR_QCOM_AMSS_VERSION := 1200
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

TARGET_PROVIDES_LIBLIGHTS := true
#BOARD_USES_LEGACY_RIL := true

BOARD_HAVE_HTC_FFC := true
BOARD_USE_REVERSE_FFC := true

COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DSCREEN_RELEASE -DREFRESH_RATE=60 -DRIL_VERSION_2_SUPPORT -DQCOM_NO_SECURE_PLAYBACK

BOARD_PREBUILT_LIBAUDIO := false
BOARD_USES_QCOM_AUDIO_VOIPMUTE := false
BOARD_USES_QCOM_AUDIO_RESETALL := false
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true


# Wifi related defines
WIFI_BAND                        := 802_11_ABG
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/fw_bcm4330.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/firmware/fw_bcm4330_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/firmware/fw_bcm4330_p2p.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"

# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p17: 00040000 00000200 "misc"
#mmcblk0p21: 0087f400 00000200 "recovery"
#mmcblk0p22: 00400000 00000200 "boot"
#mmcblk0p25: 22dffe00 00000200 "system"
#mmcblk0p27: 12bffe00 00000200 "cache"
#mmcblk0p26: 496ffe00 00000200 "userdata"
#mmcblk0p28: 014bfe00 00000200 "devlog"
#mmcblk0p29: 00040000 00000200 "pdata"

TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

TARGET_PREBUILT_KERNEL := device/htc/protou/kernel

# This is needed so CWM will function properly

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk0p32
BOARD_USES_MMCUTILS := false
BOARD_HAS_NO_MISC_PARTITION := false

BOARD_HAS_LARGE_FILESYSTEM := true

# Actual UMS different from TWRP for some reason

BOARD_UMS_LUNFILE := /sys/class/android_usb/f_mass_storage/lun0/file

#TWRP
# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_HARDWARE


DEVICE_RESOLUTION := 480x800
TW_INCLUDE_DUMLOCK := true
#Lun File testing
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_otg/msm_hsusb/gadget/lun1/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_otg/msm_hsusb/gadget/lun2/file

# Script

TARGET_RECOVERY_INITRC := device/htc/protou/recovery/init.recovery.rc
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun0/file
