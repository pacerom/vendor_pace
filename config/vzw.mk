#Permissions and Lib for Verizon Wireless Apps
PRODUCT_PACKAGES += \
    VerizonSSO

PRODUCT_COPY_FILES += \
    vendor/pace/prebuilt/vzw/etc/permissions/com.vzw.hardware.ehrpd.xml:system/etc/permissions/com.vzw.hardware.ehrpd.xml \
    vendor/pace/prebuilt/vzw/etc/permissions/com.vzw.hardware.lte.xml:system/etc/permissions/com.vzw.hardware.lte.xml \
    vendor/pace/prebuilt/vzw/etc/permissions/com.vzw.vzwapnlib.xml:system/etc/permissions/com.vzw.vzwapnlib.xml \
    vendor/pace/prebuilt/vzw/lib/libmotricity.so:system/lib/libmotricity.so

