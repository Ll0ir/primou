#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# The gps config appropriate for this device

PRODUCT_COPY_FILES += \
    device/htc/protou/prebuilt/etc/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/protou/prebuilt/root/init.protou.rc:root/init.protou.rc \
    device/htc/protou/prebuilt/root/init.usb.rc:root/init.usb.rc \
    device/htc/protou/prebuilt/root/init.rc:root/init.rc \
    device/htc/protou/prebuilt/root/ueventd.rc:root/ueventd.rc \
    device/htc/protou/prebuilt/root/ueventd.protou.rc:root/ueventd.protou.rc

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/protou/protou-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.sf.lcd_density=240

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20
	
DEVICE_PACKAGE_OVERLAYS += device/htc/protou/overlay

# GPS / Lights / Sensors
PRODUCT_PACKAGES += \
    gps.protou \
    lights.protou \
    sensors.protou

# Additional packages
PRODUCT_PACKAGES += \
     Torch \
     FileExplorer \
	 PinyinIME \

# idc files
PRODUCT_COPY_FILES += \
    device/htc/protou/prebuilt/usr/idc/himax-touchscreen.idc:system/usr/idc/himax-touchscreen.idc \
    device/htc/protou/prebuilt/usr/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    device/htc/protou/prebuilt/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/htc/protou/prebuilt/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/htc/protou/prebuilt/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/htc/protou/prebuilt/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/htc/protou/prebuilt/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/htc/protou/prebuilt/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/htc/protou/prebuilt/usr/keylayout/himax-touchscreen.kl:system/usr/keylayout/himax-touchscreen.kl \
    device/htc/protou/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/protou/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/protou/prebuilt/usr/keylayout/protou-keypad.kl:system/usr/keylayout/protou-keypad.kl \
    device/htc/protou/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/protou/prebuilt/usr/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl
PRODUCT_COPY_FILES += \
    device/htc/protou/prebuilt/etc/vold.fstab:system/etc/vold.fstab

LOCAL_PATH := device/htc/protou
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/protou/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# English locale
PRODUCT_LOCALES := en

# High Density art
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi


$(call inherit-product, build/target/product/full_base.mk)

## Recovery
PRODUCT_COPY_FILES += \
    device/htc/protou/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/protou/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    device/htc/protou/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/protou/recovery/sbin/power_test:recovery/root/sbin/power_test \
    device/htc/protou/recovery/sbin/rmt_storage:recovery/root/sbin/rmt_storage

# HTC Audio
$(call inherit-product, device/htc/protou/media_a1026.mk)
$(call inherit-product, device/htc/protou/media_htcaudio.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
