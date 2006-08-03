# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=madplay
PKG_VERSION:=0.15.2b
PKG_RELEASE:=1
PKG_MD5SUM:=6814b47ceaa99880c754c5195aa1aac1

PKG_SOURCE_URL:=@SF/mad \
	ftp://ftp.mars.org/pub/mpeg/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/madplay
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libid3tag +libmad
  TITLE:=MPEG audio player in fixed point
  DESCRIPTION:=MAD is an MPEG audio decoder. It currently only supports the MPEG 1\\\
standard, but fully implements all three audio layers (Layer I, Layer II,\\\
and Layer III, the latter often colloquially known as MP3.).  There is also\\\
full support for ID3 tags.\\\
  URL:=http://sourceforge.net/projects/mad
endef

define Build/Configure
$(call Build/Configure/Default,--enable-shared \
--disable-static \
--with-gnu-ld \
--disable-rpath \
--disable-debugging \
--disable-profiling \
--disable-experimental \
--without-libiconv-prefix \
--without-libintl-prefix \
--without-alsa \
--without-esd,LIBS="-lz" \
ac_cv_linux_vers=2 \
td_cv_buggygetaddrinfo="no")
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/madplay/install	
	install -m0755 -d $(1)/usr/bin
	install -m0755 $(PKG_INSTALL_DIR)/usr/bin/madplay $(1)/usr/bin/
endef

$(eval $(call BuildPackage,madplay))
