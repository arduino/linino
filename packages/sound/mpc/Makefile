#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=mpc
PKG_VERSION:=0.12.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.musicpd.org/uploads/files/
PKG_MD5SUM:=9ec03c5f3d136a9a58ef665dfb100e52
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/mpc
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libiconv
  TITLE:=Music Player Daemon Console Client
  DESCRIPTION:=\
	MPD is a music player supporting flac, mp3 and ogg files.\\\
	It is typically controlled over a network using one of it's many \\\
	clients including mpc(console), gmpc(gnome), phpmp(php) etc.\\\
	this is MPC
  URL:=http://www.musicpd.org/
endef

define Build/Configure
$(call Build/Configure/Default, \
	--disable-iconv \
)
endef

define Build/Compile
$(call Build/Compile/Default,\
		prefix="/usr" \
		all \
)
endef

define Package/mpc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/src/mpc $(1)/usr/bin/
endef

$(eval $(call BuildPackage,mpc))
