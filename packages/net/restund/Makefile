#
# Makefile
#
# Copyright (C) 2010 Alfred E. Heggestad
#

include $(TOPDIR)/rules.mk

PKG_NAME:=restund
PKG_VERSION:=0.2.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.creytiv.com/pub/
PKG_MD5SUM:=b8fa2ab40d7952fd78c5d72ab1742232

include $(INCLUDE_DIR)/package.mk

define Package/restund
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libre
  TITLE:=libre stun server
  URL:=http://www.creytiv.com/
endef

#PKG_MAKE_OPTS += USE_MYSQL=

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		LIBRE_MK=$(STAGING_DIR)/usr/share/re/re.mk \
		LIBRE_INC=$(STAGING_DIR)/usr/include/re \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		$(PKG_MAKE_OPTS) \
		SYSROOT="$(TOOLCHAIN_DIR)" \
		SYSROOT_ALT="$(STAGING_DIR)/usr" \
		RELEASE=1 \
		all install
endef

define Package/restund/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/restund $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/lib/$(PKG_NAME)/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/$(PKG_NAME)/modules/*.so $(1)/usr/lib/$(PKG_NAME)/modules/.
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/etc/restund.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/restund.init $(1)/etc/init.d/restund
endef

$(eval $(call BuildPackage,restund))
