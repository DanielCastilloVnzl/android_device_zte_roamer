# Correct bootanimation size for the screen
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

$(call inherit-product, device/zte/roamer/roamer.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=roamer BUILD_ID=JRO03C BUILD_FINGERPRINT=ZTE/N880E_JB4_2/atlas40:4.2/JOP40C/20121121.110335:user/release-keys PRIVATE_BUILD_DESC="N880E_JB4_2-user 4.2 JOP40C 20121121.110335 release-keys" BUILD_NUMBER=20121121.110335

PRODUCT_NAME := cm_roamer
PRODUCT_DEVICE := roamer
PRODUCT_RELEASE_NAME := Avail
