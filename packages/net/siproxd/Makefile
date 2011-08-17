#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=siproxd
PKG_VERSION:=0.8.1
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/siproxd
PKG_MD5SUM:=1a6f9d13aeb2d650375c9a346ac6cbaf

PKG_BUILD_DEPENDS:=libosip2

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/siproxd
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Telephony
  DEPENDS:=+libltdl +libpthread
  TITLE:=SIP (Session Initiation Protocol) proxy
  URL:=http://siproxd.sourceforge.net/
endef

define Package/siproxd/description
	Siproxd is a proxy/masquerading daemon for the SIP protocol.
endef

define Package/siproxd/conffiles
/etc/config/siproxd
endef

CONFIGURE_ARGS+= \
	--enable-static-libosip2 \
	--with-libosip-prefix="$(STAGING_DIR)/usr" \
	--disable-doc \
	--disable-shared

MAKE_FLAGS+= \
	SUBDIRS="src scripts contrib" \
	LIBLTDL="$(STAGING_DIR)/usr/lib/libltdl.la" \

define Package/siproxd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/siproxd $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/siproxd.config $(1)/etc/config/siproxd
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/siproxd.init $(1)/etc/init.d/siproxd
endef

$(eval $(call BuildPackage,siproxd))
