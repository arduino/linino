# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=spcaview
PKG_VERSION:=20071224
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://mxhaard.free.fr/spca50x/Download/
PKG_MD5SUM:=12e46424844b937dd55eab28f74bcd8d

include $(INCLUDE_DIR)/package.mk

define Package/spcacat
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=SPCA5xx webcam spcacat utility
  DEPENDS:=+libpthread
  URL:=http://mxhaard.free.fr/spca50x
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		SERVFLAGS="$(TARGET_CFLAGS) -DLINUX" \
		spcacat
endef

define Package/spcacat/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/spcacat $(1)/usr/bin/
endef

$(eval $(call BuildPackage,spcacat))
