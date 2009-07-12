#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mpc
PKG_VERSION:=0.16
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/musicpd
PKG_MD5SUM:=d13936d0e0177f48f1308417250cec82

include $(INCLUDE_DIR)/package.mk

define Package/mpc
  SECTION:=sound
  CATEGORY:=Sound
  TITLE:=Music Player Daemon Console Client
  URL:=http://www.musicpd.org/
endef

define Package/mpc/description
	MPD is a music player supporting flac, mp3 and ogg files.
	It is typically controlled over a network using one of it's many
	clients including mpc(console), gmpc(gnome), phpmp(php) etc.
	this is MPC
endef

define Build/Configure
$(call Build/Configure/Default, \
	--disable-iconv \
)
endef

define Build/Compile
$(call Build/Compile/Default,\
		CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
		prefix="/usr" \
		all \
)
endef

define Package/mpc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/mpc $(1)/usr/bin/
	$(INSTALL_BIN) ./files/pls-handler.sh $(1)/usr/bin/
endef

$(eval $(call BuildPackage,mpc))
