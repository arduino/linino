#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=siproxd
PKG_VERSION:=0.7.1
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/siproxd
PKG_MD5SUM:=45e5a44803181e2bf3361d562060c904

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/siproxd
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Telephony
  DEPENDS:=+libltdl +libosip2 +libpthread
  TITLE:=SIP (Session Initiation Protocol) proxy
  URL:=http://siproxd.sourceforge.net/
endef

define Package/siproxd/conffiles
/etc/config/siproxd
endef

CONFIGURE_ARGS+= \
	--with-libosip-prefix="$(STAGING_DIR)/usr" \

MAKE_FLAGS+= \
	SUBDIRS="src scripts contrib" \
	LIBLTDL="$(STAGING_DIR)/usr/lib/libltdl.la" \

define Package/siproxd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/siproxd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/lib/siproxd
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/siproxd/plugin_*.so* $(1)/usr/lib/siproxd/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/siproxd.config $(1)/etc/config/siproxd
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/siproxd.init $(1)/etc/init.d/siproxd
endef

$(eval $(call BuildPackage,siproxd))
