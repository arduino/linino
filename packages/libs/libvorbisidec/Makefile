# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libvorbisidec
PKG_VERSION:=1.2.0-dave
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://users.tpg.com.au/davico/openwrt/
PKG_MD5SUM:=cb8e51aab92ef164f8e0e8853f7164fa
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libvorbisidec
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A fixed-point Ogg/Vorbis decoder library
  DESCRIPTION:=\
	libvorbisidec is "tremor", a fixed-point implementation of libvorbis.\\\
	It also has libogg built-in. It is suitable as a replacement for \\\
	libvorbis and libogg in tremor-aware applications.\\\
	Tremor is a decoder only. 
  URL:=http://wiki.xiph.org/index.php/Tremor
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/tremor $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libvorbisidec.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/tremor \
		$(STAGING_DIR)/usr/lib/libvorbisidec.{a,so*}
endef

define Package/libvorbisidec/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libvorbisidec.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libvorbisidec))
