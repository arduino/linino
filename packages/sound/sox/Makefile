# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 5329 2006-10-28 22:43:08Z nico $

include $(TOPDIR)/rules.mk

PKG_NAME:=sox
PKG_VERSION:=12.18.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/sox
PKG_MD5SUM:=ba25e512a6c824d6e56d76767a18af99
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/sox
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libflac +libid3tag +libmad +libvorbisidec +libnotimpl
  TITLE:=Sox is a general purpose sound converter/player/recorder
  DESCRIPTION:=\
	SoX is a command line utility that can convert various formats\\\
	of computer audio files in to other formats. It can also apply\\\
	various effects to these sound files during the conversion.\\\
	As an added bonus, SoX can play and record audio files on\\\
	several unix-style platforms.
  URL:=http://sox.sourceforge.net/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-external-gsm \
		, \
		LIBS="-lnotimpl -lm" \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		STAGING_DIR="$(STAGING_DIR)" \
		all
endef

define Package/sox/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/src/{play,sox,soxmix} $(1)/usr/bin/
endef

$(eval $(call BuildPackage,sox))
