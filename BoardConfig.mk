#
# Copyright (C) 2011 The Android Open-Source Project
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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := true

# Use the non-open-source parts, if they're present
include device/zte/msm7x27-common/BoardConfigCommon.mk
include vendor/zte/roamer/BoardConfigVendor.mk

# Target and board properties
BOARD_PROVIDES_LIBRIL := true
TARGET_BOOTLOADER_BOARD_NAME := roamer
TARGET_SPECIFIC_HEADER_PATH := device/zte/roamer/include

# Recovery
BOARD_CUSTOM_GRAPHICS := ../../../device/zte/roamer/recovery/graphics.c
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/zte/roamer/recovery/recovery_ui.c
TARGET_PREBUILT_RECOVERY_KERNEL := device/zte/roamer/recovery/recovery_kernel
TARGET_RECOVERY_INITRC := device/zte/roamer/recovery/recovery.rc
TARGET_RECOVERY_FSTAB := device/zte/roamer/recovery/recovery.fstab

# Kernel
TARGET_KERNEL_SOURCE := kernel/zte/zte-kernel-msm7x27
TARGET_KERNEL_CONFIG := cyanogen_roamer_defconfig
BOARD_KERNEL_BASE := 0x02600000
BOARD_KERNEL_CMDLINE := androidboot.hardware=roamer console=null

# Wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/fw_4319.bin"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/fw_4319_apsta.bin"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/fw_4319.bin nvram_path=/system/etc/nv_4319.txt iface_name=wlan"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_DRIVER_LOADER_REUSE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/zte/roamer/bluetooth

# Fonts
SMALLER_FONT_FOOTPRINT := true

# dev:    size   erasesize  name
# mtd0: 00500000 00020000 "recovery"
# mtd1: 00500000 00020000 "boot"
# mtd2: 00180000 00020000 "splash"
# mtd3: 00080000 00020000 "misc"
# mtd4: 00200000 00020000 "cache"
# mtd5: 08a00000 00020000 "system"
# mtd6: 13ba0000 00020000 "userdata"
# mtd7: 00020000 00020000 "oem"
# mtd8: 00180000 00020000 "persist"
BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x11e4b400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x13ba0000
BOARD_FLASH_BLOCK_SIZE := 131072
