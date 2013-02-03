$(call inherit-product, device/htc/protou/full_protou.mk)

PRODUCT_RELEASE_NAME := Des_X

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_protou BUILD_FINGERPRINT=htc_europe/htc_protou/protou:4.1.1/JRO03L/330937:user/release-keys PRIVATE_BUILD_DESC="4.1.1 JRO03L 330937 release-keys"

PRODUCT_NAME := cm_protou
PRODUCT_DEVICE := protou

PRODUCT_COPY_FILES += \
    device/htc/protou/prebuilt/app/UsbMassStorageToggle.apk:system/app/UsbMassStorageToggle.apk
