#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nbd
PKG_VERSION:=2.9.13
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/nbd
PKG_MD5SUM:=6c83f0f5bfd87ea60f10223843bd9679

include $(INCLUDE_DIR)/package.mk

PKG_BUILD_DEPENDS:=glib2 libintl

define Package/nbd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=@LINUX_2_6
  TITLE:=Network Block Device utilities
  URL:=http://nbd.sourceforge.net
endef

define Package/nbd/description
  This package contains the network block device client.
endef

CONFIGURE_ARGS+= \
	--disable-glibtest

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		nbd-client
endef

define Package/nbd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nbd-client $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,nbd))
