# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=cbtt
PKG_VERSION:=20060211
PKG_RELEASE:=1
PKG_MD5SUM:=19abea2817c49ccc9438e9671c402984

PKG_SOURCE_URL:=@SF/bnbtusermods 
PKG_SOURCE:=$(PKG_NAME)80-$(PKG_VERSION)-src.tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)80-$(PKG_VERSION)-src
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

PKG_BUILDDEP=zlib mysql

define Package/cbtt
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=zlib
  MENU:=1
  TITLE:=Bittorrent tracker
  DESCRIPTION:=a C BitTorrent Tracker
  URL:=http://bnbtusermods.sourceforge.net
endef

define Package/cbtt-mysql
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=cbtt +libmysqlclient
  TITLE:=Bittorrent tracker with mysql support
  DESCRIPTION:=Bittorrent tracker with mysql support
  URL:=http://bnbtusermods.sourceforge.net
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		LFLAGS="-L$(STAGING_DIR)/usr/lib -L $(STAGING_DIR)/usr/lib/mysql -L. -lz -lmysqlclient" \
		CFLAGS="-I$(STAGING_DIR)/usr/include"
	mkdir -p $(PKG_INSTALL_DIR)/usr/bin
endef

define Package/cbtt/install
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/bnbt $(1)/usr/bin/
endef

define Package/cbtt-mysql/install
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/bnbtmysql $(1)/usr/bin/
endef

$(eval $(call BuildPackage,cbtt))
$(eval $(call BuildPackage,cbtt-mysql))
