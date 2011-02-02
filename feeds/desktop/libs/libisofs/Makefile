#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libisofs
PKG_VERSION:=0.6.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://files.libburnia-project.org/releases/
PKG_MD5SUM:=fed7ec84358cf13d2d879764b9f03731
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+=-liconv

define Package/libisofs
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libisofs
  URL:=http://www.libburnia-project.org
  DEPENDS:=+libburn +libpthread $(ICONV_DEPENDS)
endef

define Package/libisofs/description
libisofs is a library to create an ISO-9660 filesystem, and supports extensions
like RockRidge or Joliet. It is also a full featured ISO-9660 editor, allowing
you to modify an ISO image or multisession disc, including file addition and
removal, change of file names and attributes, etc
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/libisofs
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/libisofs/* \
		$(1)/usr/include/libisofs/

	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libisofs/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib
endef

$(eval $(call BuildPackage,libisofs))
