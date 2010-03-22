#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pcre
PKG_VERSION:=8.02
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/pcre
PKG_MD5SUM:=27948c1b5f5c1eabc23cba1ebe4c316f

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libpcre
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A Perl Compatible Regular Expression library
  URL:=http://www.pcre.org/
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-utf8 \
	--disable-cpp

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)"

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/pcre-config $(1)/usr/bin/

	$(INSTALL_DIR) $(2)/bin
	$(LN) $(STAGING_DIR)/usr/bin/pcre-config $(2)/bin

	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/pcre{,posix}.h $(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpcre{,posix}.{a,so*} $(1)/usr/lib/
endef

define Package/libpcre/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpcre{,posix}.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libpcre))
