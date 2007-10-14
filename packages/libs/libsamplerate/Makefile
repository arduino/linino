# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $ Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=libsamplerate
PKG_VERSION:=0.1.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.mega-nerd.com/SRC/
PKG_MD5SUM:=6861c2c6b8e5273c9b80cf736b9fd0e
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libsamplerate
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libsndfile
  TITLE:=Sample Rate Converter
  URL:=http://www.mega-nerd.com/SRC/index.html
endef

define Package/libsamplerate/description
	Secret Rabbit Code (aka libsamplerate) is a Sample Rate Converter for audio
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-fftw \
	)
endef

define Build/Compile
	$(call Build/Compile/Default,\
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install \
	)
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	mkdir -p $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsamplerate.* $(1)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/ao/ \
		$(STAGING_DIR)/usr/lib/libao.{a,so*,la}
endef

define Package/libsamplerate/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsamplerate.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsamplerate))
