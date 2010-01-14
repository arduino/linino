# 
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dash
PKG_VERSION:=0.5.5.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://gondor.apana.org.au/~herbert/dash/files/
PKG_MD5SUM:=7ac832b440b91f5a52cf8eb68e172616

include $(INCLUDE_DIR)/package.mk

define Package/dash
  SECTION:=base
  CATEGORY:=Base system
  TITLE:=Debian Almquist shell
  URL:=http://gondor.apana.org.au/~herbert/dash/files/
endef

define Package/dash/description
 A small footprint, POSIX complied unix shell
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		BINDIR="/bin" \
		AWK="awk" \
		all
endef

define Package/dash/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/dash $(1)/bin/
endef

$(eval $(call BuildPackage,dash))
