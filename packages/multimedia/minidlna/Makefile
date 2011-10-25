#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=minidlna
PKG_VERSION:=1.0.22
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION)_src.tar.gz
PKG_SOURCE_URL:=@SF/minidlna
PKG_MD5SUM:=3de2f6b54f43bb998dfad3c8fa75cef3

PKG_BUILD_PARALLEL:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

MAKE_VARS += \
	ICONV_PREFIX="$(ICONV_PREFIX)" \
	INTL_PREFIX="$(INTL_PREFIX)"

define Package/minidlna
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=UPnP A/V & DLNA Media Server
  URL:=http://minidlna.sourceforge.net/
  DEPENDS:= +libpthread +libexif +libjpeg +libsqlite3 +libffmpeg \
  	+libid3tag +libflac +libvorbis +libuuid \
  	$(ICONV_DEPENDS) $(INTL_DEPENDS)
endef

define Package/minidlna/description
  MiniDLNA (aka ReadyDLNA) is server software with the aim of
  being fully compliant with DLNA/UPnP-AV clients.
endef

define Package/minidlna/conffiles
/etc/minidlna.conf
endef

define Package/minidlna/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/minidlna.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/minidlna $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/minidlna.init $(1)/etc/init.d/minidlna
endef

$(eval $(call BuildPackage,minidlna))
