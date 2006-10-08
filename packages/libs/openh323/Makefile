# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=openh323
PKG_VERSION:=cvs-20051230
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://trash.uid0.hu/openwrt/
PKG_MD5SUM:=ba1ffd45016f533bec2bb1539b78e43a
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libopenh323
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+pwlib +uclibcxx
  TITLE:=OpenH323 library
  URL:=http://www.openh323.org/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-minsize \
		--enable-audio \
		--disable-video \
		, \
		CXXFLAGS="$(TARGET_CFLAGS) -fno-builtin -fno-rtti"  \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		optnoshared
endef

define Build/InstallDev
	ln -sf $(PKG_NAME)-$(PKG_VERSION) $(BUILD_DIR)/$(PKG_NAME)
endef

define Build/UninstallDev
	rm -rf $(BUILD_DIR)/$(PKG_NAME)
endef

$(eval $(call BuildPackage,libopenh323))
