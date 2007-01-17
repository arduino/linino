#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=shell-fm
PKG_VERSION:=0.2
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://nex.scrapping.cc/shell-fm/downloads
PKG_MD5SUM:=6ebbcf1af241a92a1237547fc39ca728
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/shell-fm
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libmad +libopenssl +libreadline +libncurses
  TITLE:=Console Based Last.FM Radio Player
  DESCRIPTION:=\
	Shell.FM is a console based player for the streams provided \\\
	by Last.FM for the Linux platform. It's lightweight and easy to use.
  URL:=http://nex.scrapping.cc
endef

define Package/shell-fm/conffiles
/etc/shell-fm.rc
endef

define Build/Configure
	$(PKG_BUILD_DIR)/reconfig
	$(call Build/Configure/Default, --disable-ao)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/shell-fm/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/shell-fm $(1)/usr/bin/
	$(INSTALL_DATA) ./files/shell-fm.rc $(1)/etc/shell-fm.rc
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/shell-fm.init $(1)/etc/init.d/shell-fm
endef

$(eval $(call BuildPackage,shell-fm))
