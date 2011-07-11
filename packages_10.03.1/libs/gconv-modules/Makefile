# 
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gconv-modules
PKG_VERSION:=$(CONFIG_GLIBC_VERSION)
PKG_RELEASE:=2

include $(INCLUDE_DIR)/package.mk

define Package/gconv-modules
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=@USE_GLIBC
  TITLE:=The GNU libc charset conversion modules
endef

define Package/gconv-modules/description
 This package contains helper modules necessary to convert data between
various charsets.
endef

define Build/Compile
endef

define Package/gconv-modules/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(TOOLCHAIN_DIR)/usr/lib/gconv $(1)/usr/lib

	rm -f $(1)/usr/lib/gconv/EUC-*.so
	rm -f $(1)/usr/lib/gconv/ISO-2022-*.so
	rm -f $(1)/usr/lib/gconv/JOHAB.so
	rm -f $(1)/usr/lib/gconv/UHC.so

#	$(INSTALL_DIR) $(1)/usr/bin
#	$(INSTALL_BIN) $(TOOLCHAIN_DIR)/usr/bin/iconv $(1)/usr/bin
endef

$(eval $(call BuildPackage,gconv-modules))
