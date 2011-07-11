#
# Makefile
#
# Copyright (C) 2010 Alfred E. Heggestad
#

include $(TOPDIR)/rules.mk

PKG_NAME:=baresip
PKG_VERSION:=0.2.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.creytiv.com/pub/
PKG_MD5SUM:=c4e160463b2bfb2e326e916089da1c4f

include $(INCLUDE_DIR)/package.mk

EXTRA_DEPS :=


BARESIP_MODULES :=


define Package/baresip/config
	source "$(SOURCE)/Config.in"
endef


ifneq ($(CONFIG_BARESIP_MODULE_ALSA),)
BARESIP_MODULES += USE_ALSA=1
endif
ifneq ($(CONFIG_BARESIP_MODULE_AVCODEC),)
BARESIP_MODULES += USE_FFMPEG=1 USE_FFMPEG_AVFORMAT=
endif
ifneq ($(CONFIG_BARESIP_MODULE_G711),)
BARESIP_MODULES += USE_G711=1
endif
ifneq ($(CONFIG_BARESIP_MODULE_G722),)
BARESIP_MODULES += USE_G722=1
endif
ifneq ($(CONFIG_BARESIP_MODULE_OSS),)
BARESIP_MODULES += USE_OSS=1
endif
ifneq ($(CONFIG_BARESIP_MODULE_SDL),)
BARESIP_MODULES += USE_SDL=1
endif
ifneq ($(CONFIG_BARESIP_MODULE_SPEEX),)
BARESIP_MODULES += USE_SPEEX=1
endif
ifneq ($(CONFIG_BARESIP_MODULE_V4L),)
BARESIP_MODULES += USE_V4L=1
endif
ifneq ($(CONFIG_BARESIP_MODULE_V4L2),)
BARESIP_MODULES += USE_V4L2=1
endif


define Package/baresip
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Telephony
  DEPENDS:=+libre +libpthread $(EXTRA_DEPS)
  TITLE:=baresip Barebone SIP useragent
  URL:=http://www.creytiv.com/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		LIBRE_MK=../re-$(PKG_VERSION)/mk/re.mk \
		LIBRE_INC=../re-$(PKG_VERSION)/include \
		LIBRE_SO=$(STAGING_DIR)/usr/lib/libre.so \
		MOD_AUTODETECT= \
		USE_STDIO=1 USE_CONS=1 USE_EVDEV=1 \
		$(BARESIP_MODULES) \
		CC="$(TARGET_CC)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		EXTRA_CFLAGS="$(TARGET_CFLAGS) -DOPENWRT" \
		$(PKG_MAKE_OPTS) \
		SYSROOT="$(TOOLCHAIN_DIR)" \
		SYSROOT_ALT="$(STAGING_DIR)/usr" \
		RELEASE=1 \
		all install
endef

define Package/baresip/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/baresip $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/baresip/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/baresip/modules/*.so $(1)/usr/lib/baresip/modules/.
	$(INSTALL_DIR) $(1)/usr/share/baresip
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/share/baresip/* $(1)/usr/share/baresip/.
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/baresip.init $(1)/etc/init.d/baresip
endef

$(eval $(call BuildPackage,baresip))
