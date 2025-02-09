#
# Copyright (C) 2015-2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from the proprietary version
include vendor/lenovo/A6020/BoardConfigVendor.mk

LOCAL_PATH := device/lenovo/A6020

# Platform
TARGET_BOARD_PLATFORM := msm8916
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_ADRENO := true
TARGET_USES_QCOM_BSP := true
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_USES_MEDIA_EXTENSIONS := true
TARGET_USES_QCOM_MM_AUDIO := true
MSM_VIDC_TARGET_LIST := msm8916
QCOM_HARDWARE_VARIANT := msm8916

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_PHONY_TARGETS := true

# APEX
TARGET_FLATTEN_APEX := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Asserts
TARGET_OTA_ASSERT_DEVICE := A6020,A6020a40,A6020a41,A6020a46,A6020l36,A6020l37,K32c36,k5,k5_plus,vibe_k5

# Audio
AUDIO_FEATURE_DEEP_BUFFER_RINGTONE := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
BOARD_USES_ALSA_AUDIO := true
USE_XML_AUDIO_POLICY_CONF := 1
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Bootanimation
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := A6020

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
	/system/bin/mediaserver=22 \
	/system/vendor/bin/mm-qcamera-daemon=22

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness

# Dexpreopt
ifeq ($(HOST_OS),linux)
ifneq ($(TARGET_BUILD_VARIANT),eng)
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
endif
endif

# Display
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API := true
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x02000000U

# Encryption
TARGET_HW_DISK_ENCRYPTION := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(LOCAL_PATH)/config.fs
TARGET_KERNEL_HAVE_EXFAT := true
TARGET_EXFAT_DRIVER := exfat

# FM
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# GPS
USE_DEVICE_SPECIFIC_GPS := true
TARGET_NO_RPC := true

# HIDL
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/manifest.xml

# HWUI
HWUI_COMPILE_FOR_PERF := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_A6020
TARGET_RECOVERY_DEVICE_MODULES := libinit_A6020

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 pm.sleep_mode=1 loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.btmacaddr=00:00:00:00:00:00
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := kernel/lenovo/msm8916
TARGET_KERNEL_CONFIG := A6020_defconfig

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432        # 32768 * 1024 # mmcblk0p22
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432    # 32768 * 1024 # mmcblk0p26
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560    # 2621440 * 1024 # mmcblk0p23
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12211698688 # 11925487 * 1024 # mmcblk0p30
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432     # 32768 * 1024 # mmcblk0p24
BOARD_CACHEIMAGE_PARTITION_SIZE := 265289728
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ROOT_EXTRA_FOLDERS := firmware persist
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# Peripheral manager
TARGET_PER_MGR_ENABLED := true

# Power
TARGET_POWERHAL_VARIANT := qcom
TARGET_PROVIDES_POWERHAL := true
TARGET_USES_INTERACTION_BOOST := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.full

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)

# RIL
MALLOC_SVELTE := true
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true
TARGET_RIL_VARIANT := caf
TARGET_USES_ALTERNATIVE_MANUAL_NETWORK_SELECT := true
TARGET_USES_OLD_MNC_FORMAT := true

# SELinux
#include device/qcom/sepolicy-legacy/sepolicy.mk
#BOARD_SEPOLICY_DIRS += device/lenovo/A6020/sepolicy
BOARD_SEPOLICY_DIRS += device/lenovo/A6020/sepolicy_tmp

# System properties
TARGET_SYSTEM_PROP += device/lenovo/A6020/system.prop

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/vendor/lib/libmmcamera2_stats_modules.so|libshim_gui.so \
    /system/vendor/lib/libmmcamera2_stats_modules.so|libshim_atomic.so \
    /system/lib/hw/camera.vendor.msm8916.so|libshim_atomic.so \
    /system/lib/libmmjpeg_interface.so|libshim_atomic.so \
    /system/vendor/lib/libmmcamera2_imglib_modules.so|libshim_atomic.so

# Vendor security patch level
VENDOR_SECURITY_PATCH := 2016-10-01

# WLAN
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true
