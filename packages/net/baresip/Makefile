#
# Makefile
#
# Copyright (C) 2010 Alfred E. Heggestad
#

include $(TOPDIR)/rules.mk

PKG_NAME:=baresip
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.creytiv.com/pub/
#PKG_MD5SUM:=ee345fe605ffcfce843dae4aed81122b

include $(INCLUDE_DIR)/package.mk

EXTRA_DEPS :=

define Package/baresip
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libre +libpthread $(EXTRA_DEPS)
  TITLE:=baresip Barebone SIP useragent
  URL:=http://www.creytiv.com/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		LIBRE_MK=../re-$(PKG_VERSION)/mk/re.mk \
		LIBRE_INC=../re-$(PKG_VERSION)/include \
		MOD_AUTODETECT= \
		USE_G711=1 USE_L16=1 \
		USE_STDIO=1 USE_CONS=1 USE_EVDEV=1 \
		USE_OSS=1 \
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
