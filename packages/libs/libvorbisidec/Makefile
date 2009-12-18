# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libvorbisidec
PKG_VERSION:=1.0.2+svn14261
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=http://ftp.de.debian.org/debian/pool/main/libv/libvorbisidec/
PKG_MD5SUM:=bc617d4af1cd74b38d7c51451dd6eff0

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/libvorbisidec
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A fixed-point Ogg/Vorbis decoder library
  URL:=http://wiki.xiph.org/index.php/Tremor
endef

define Package/libvorbisidec/description
	libvorbisidec is "tremor", a fixed-point implementation of libvorbis.
	It also has libogg built-in. It is suitable as a replacement for 
	libvorbis and libogg in tremor-aware applications.
	Tremor is a decoder only.
endef

TARGET_CFLAGS += $(FPIC)

define Build/Configure
	(cd $(PKG_BUILD_DIR); ./autogen.sh );
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
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/tremor $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libvorbisidec.{a,so*} $(1)/usr/lib/
endef

define Package/libvorbisidec/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libvorbisidec.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libvorbisidec))
