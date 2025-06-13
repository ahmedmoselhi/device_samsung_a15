#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile.
$(call inherit-product, device/samsung/a15/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

BOARD_VENDOR := samsung
PRODUCT_NAME := lineage_a15
PRODUCT_DEVICE := a15
PRODUCT_MANUFACTURER := samsung
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A155F

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss
PRODUCT_SYSTEM_NAME := a15
PRODUCT_SYSTEM_DEVICE := a15

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceName=a15 \
    BuildFingerprint=samsung/a15/a15:15/AP3A.240905.015.A2/A155FXXU6CYE5:user/release-keys
