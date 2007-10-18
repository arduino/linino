#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=empcd
PKG_VERSION:=2005.12.12
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://unfix.org/projects/empcd
PKG_MD5SUM:=300e59ba3067f1f82d4ecec124f96916

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/empcd
  SECTION:=sound
  CATEGORY:=Sound
  TITLE:=EMPCd can control the MPD
  URL:=http://unfix.org/projects/empcd
endef

define Package/empcd/description
	This is EMPCd which can use /dev/input/event0 or other event devices
	to control MPD (Music Player Daemon), directly using libmpdclient
	and other programs, currently using system(2).
endef

define Package/empcd/conffiles
/etc/empcd.conf
endef

define Build/Compile
	$(call Build/Compile/Default,\
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all \
	)
endef

define Package/empcd/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/empcd $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/doc/empcd.conf $(1)/etc/
endef

$(eval $(call BuildPackage,empcd))
