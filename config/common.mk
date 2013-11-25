ROM_NAME := pace
ROM_VERSION_MAJOR := 5
ROM_VERSION_MINOR := 0
ROM_VERSION_POINT := b1
ROM_VERSION := $(ROM_VERSION_MAJOR).$(ROM_VERSION_MINOR).$(ROM_VERSION_POINT)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.rom.name=$(ROM_NAME) \
    ro.rom.version=$(ROM_VERSION)

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/pace/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/pace/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Required packages
PRODUCT_PACKAGES += \
    Development \
    LatinIME \
    BluetoothExt

PRODUCT_PACKAGES += \
    Launcher3 \
    audio_effects.conf

PRODUCT_PACKAGES += \
    CellBroadcastReceiver

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1
