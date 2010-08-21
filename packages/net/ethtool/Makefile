#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ethtool
PKG_VERSION:=2.6.35
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/gkernel
PKG_MD5SUM:=e0f617779a58b77af061a9e5178d0b25

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/ethtool
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Display or change ethernet card settings
  URL:=http://sourceforge.net/projects/gkernel/
endef

define Package/ethtool/description
ethtool is used for querying settings of an ethernet device and changing them.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -rf config.{cache,status} ; \
		./autogen.sh \
	);
	$(call Build/Configure/Default, \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		SPECIAL_CFLAGS="-pthread $(TARGET_LDFLAGS)"
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
endef

define Package/ethtool/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/ethtool $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,ethtool))
