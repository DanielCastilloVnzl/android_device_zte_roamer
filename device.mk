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

# This file includes all definitions that apply to ALL roamer devices, and
# are also specific to roamer devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := device/zte/roamer/overlay
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Avail Parts
PRODUCT_PACKAGES := \
	AvailParts

# Graphics
PRODUCT_PACKAGES := \
        gralloc.msm7x27 \
        hwcomposer.msm7x27 \
        copybit.msm7x27

# OMX
PRODUCT_PACKAGES += \
        libmm-omxcore \
        libOmxCore \
        libstagefrighthw

# Camera
PRODUCT_PACKAGES += \
        camera.msm7x27

# GPS
PRODUCT_PACKAGES += \
        librpc \
        gps.roamer

# Avail specific
PRODUCT_PACKAGES += \
        lights.roamer \
        sensors.roamer

# Power HAL
PRODUCT_PACKAGES += \
        power.msm7x27

# Audio
PRODUCT_PACKAGES += \
        audio.primary.roamer \
        audio_policy.roamer \
        audio.a2dp.default \
        libaudioutils

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapersPicker \
        librs_jni

# Other
PRODUCT_PACKAGES += \
        make_ext4fs \
        setup_fs \
        dexpreopt

# for bugmailer
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += send_bug

PRODUCT_COPY_FILES += \
         system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
         system/extras/bugmailer/send_bug:system/bin/send_bug
endif

# Dalvik
DISABLE_DEXPREOPT := false

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
        ro.cwm.enable_key_repeat=true

PRODUCT_COPY_FILES := \
        device/zte/roamer/prebuilt/root/init.roamer.rc:root/init.roamer.rc \
        device/zte/roamer/prebuilt/root/init.roamer.usb.rc:root/init.roamer.usb.rc \
        device/zte/roamer/prebuilt/root/ueventd.roamer.rc:root/ueventd.roamer.rc \
        device/zte/roamer/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab \
        device/zte/roamer/prebuilt/system/usr/keylayout/roamer_keypad.kl:/system/usr/keylayout/roamer_keypad.kl \
        device/zte/roamer/prebuilt/system/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
        device/zte/roamer/prebuilt/system/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
        device/zte/roamer/prebuilt/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
        device/zte/roamer/prebuilt/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
        device/zte/roamer/prebuilt/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
        device/zte/roamer/prebuilt/system/etc/gps.conf:system/etc/gps.conf

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
        device/zte/roamer/prebuilt/system/etc/init.bt.sh:system/etc/init.bt.sh

# WiFi
PRODUCT_COPY_FILES += \
        device/zte/roamer/prebuilt/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
        device/zte/roamer/prebuilt/system/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
        device/zte/roamer/prebuilt/system/wifi/ar6000.ko:system/wifi/ar6000.ko \
        device/zte/roamer/prebuilt/system/wifi/regcode:system/wifi/regcode \
        device/zte/roamer/prebuilt/system/wifi/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin \
        device/zte/roamer/prebuilt/system/wifi/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
        device/zte/roamer/prebuilt/system/wifi/athtcmd_ram.bin:system/wifi/athtcmd_ram.bin \
        device/zte/roamer/prebuilt/system/wifi/device.bin:system/wifi/device.bin \
        device/zte/roamer/prebuilt/system/wifi/eeprom.bin:system/wifi/eeprom.bin \
        device/zte/roamer/prebuilt/system/wifi/eeprom.data:system/wifi/eeprom.data

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
        frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
        frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
        frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
        frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
        frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
        frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/zte/roamer/roamer-vendor.mk)
