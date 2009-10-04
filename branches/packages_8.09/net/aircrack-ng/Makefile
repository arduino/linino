#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=aircrack-ng
PKG_REV:=1396
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1.2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://trac.aircrack-ng.org/svn/trunk/
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=svn

include $(INCLUDE_DIR)/package.mk

define Package/aircrack-ng
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +libopenssl +libpcap
  TITLE:=next generation of aircrack with new features
  URL:=http://www.aircrack-ng.org/
  SUBMENU:=wireless
endef

define Package/aircrack-ng/description
Aircrack-ng is the next generation of aircrack with new features
endef

define Build/Configure
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -Wall -Iinclude/ -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include -D_REVISION=$(PKG_REV)" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		prefix="/usr" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		OSNAME=Linux \
		all install
endef

define Package/aircrack-ng/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/* $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,aircrack-ng))
