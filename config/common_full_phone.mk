# Inherit common stuff
$(call inherit-product, vendor/pace/config/common_full.mk)

PRODUCT_PACKAGES += \
  Mms

$(call inherit-product, vendor/pace/config/telephony.mk)
