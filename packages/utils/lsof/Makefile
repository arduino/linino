#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lsof
PKG_VERSION:=4.77
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).dfsg.1.orig.tar.gz
PKG_SOURCE_URL:=http://ftp2.de.debian.org/debian/pool/main/l/lsof
PKG_MD5SUM:=6751a1cbdefb751b7cb2e22e6e5bdacb

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION).dfsg.1.orig

include $(INCLUDE_DIR)/package.mk

define Package/lsof
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=LiSt Open Files - a diagnostic tool
  URL:=http://www.akadia.com/services/lsof_intro.html
endef

define Build/Configure
	cd $(PKG_BUILD_DIR); \
	./Configure -n linux
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
	CC="$(TARGET_CC)" \
	CFLAGS="$(TARGET_CFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS)" 
endef

define Package/lsof/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lsof $(1)/usr/bin
endef

$(eval $(call BuildPackage,lsof))
