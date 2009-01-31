#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=shell-fm
PKG_VERSION:=0.5
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://nex.scrapping.cc/code/shell-fm/downloads/
PKG_MD5SUM:=a257283b0f7e9173ee1073b88e57c5f6

include $(INCLUDE_DIR)/package.mk

define Package/shell-fm
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libao +libmad
  TITLE:=Console Based Last.FM Radio Player
  URL:=http://nex.scrapping.cc
endef

define Package/shell-fm/description
	Shell.FM is a console based player for the streams provided 
	by Last.FM for the Linux platform. It's lightweight and easy to use.
endef

define Package/shell-fm/conffiles
/etc/shell-fm.rc
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -I./include/ -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -lmad -lao" \
		all install
endef

define Package/shell-fm/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/shell-fm $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/shell-fm.rc $(1)/etc/shell-fm.rc
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/shell-fm.init $(1)/etc/init.d/shell-fm
endef

$(eval $(call BuildPackage,shell-fm))
