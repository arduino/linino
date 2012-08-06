#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libburn
PKG_VERSION:=0.6.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).pl01.tar.gz
PKG_SOURCE_URL:=http://files.libburnia-project.org/releases/
PKG_MD5SUM:=9ad48fe011dd5cbe9a15367ae8173647
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_LDFLAGS+=-lpthread

define Package/libburn
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libburn
  DEPENDS:=+libpthread
  URL:=http://www.libburnia-project.org
endef

define Package/libburn/description
libburn is the library by which preformatted data get onto optical media.
It uses either /dev/sgN (e.g. on kernel 2.4 with ide-scsi) or /dev/srM or
/dev/hdX (e.g. on kernel 2.6). libburn is the foundation of our cdrecord
emulation. Its code is independent of cdrecord. Its DVD capabilities are
learned from studying the code of dvd+rw-tools and MMC-5 specs. No code but
only the pure SCSI knowledge has been taken from dvd+rw-tools, though.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/libburn
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/libburn/* \
		$(1)/usr/include/libburn/

	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libburn/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib
endef

$(eval $(call BuildPackage,libburn))
