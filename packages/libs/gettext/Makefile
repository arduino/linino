#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gettext
PKG_VERSION:=0.17
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/gettext
PKG_MD5SUM:=58a2bc6d39c0ba57823034d55d65d606

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libintl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GNU Internationalization library
  URL:=http://www.gnu.org/software/gettext/
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-rpath \
	--enable-nls \
	--disable-java \
	--disable-native-java \
	--disable-openmp \
	--with-included-gettext \
	--without-libintl-prefix \
	--without-libexpat-prefix \
	--without-emacs

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/libintl/include
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/include/libintl.h $(1)/usr/lib/libintl/include/

	$(INSTALL_DIR) $(1)/usr/lib/libintl/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libintl.{a,so*} $(1)/usr/lib/libintl/lib/

	$(INSTALL_DIR) $(1)/usr/share/aclocal
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/aclocal/* $(1)/usr/share/aclocal/
endef

define Package/libintl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libintl.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libintl))
