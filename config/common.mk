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

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/pace/overlay/common

# Common dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/pace/overlay/dictionaries

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Init
PRODUCT_COPY_FILES += \
    vendor/pace/prebuilt/root/init.pace.rc:root/init.pace.rc

# Superuser
SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.cyanogenmod.superuser

# Hosts
PRODUCT_COPY_FILES += \
    vendor/pace/prebuilt/etc/hosts.adfree:system/etc/hosts.adfree

# init.d
PRODUCT_COPY_FILES += \
    vendor/pace/prebuilt/etc/init.d/00start:system/etc/init.d/00start \
    vendor/pace/prebuilt/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/pace/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/pace/prebuilt/bin/sysinit:system/bin/sysinit

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_PACKAGES += \
    Superuser \
    su \
    Torch

PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    libssh \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh \
    sftp \
    scp

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480
endif

# Boot animation
ifeq ($(TARGET_BOOTANIM_WIDTH),)
TARGET_BOOTANIM_WIDTH := $(TARGET_SCREEN_WIDTH)
endif
bootanim_orientation := $(shell \
	if [ $(TARGET_SCREEN_WIDTH) -lt $(TARGET_SCREEN_HEIGHT) ]; then \
		echo portrait; \
	else \
		echo landscape; \
	fi)
bootanim_file := vendor/pace/prebuilt/media/bootanim/$(bootanim_orientation)/$(TARGET_BOOTANIM_WIDTH).zip
PRODUCT_COPY_FILES += \
    $(bootanim_file):system/media/bootanimation.zip

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1
