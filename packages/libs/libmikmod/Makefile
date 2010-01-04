# 
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libmikmod
PKG_VERSION:=3.1.12
PKG_RELEASE:=1

PKG_SOURCE:=libmikmod-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://prdownloads.sourceforge.net/mikmod
PKG_MD5SUM:=9f3c740298260d5f88981fc0d51f6f16
PKG_BUILD_DIR:=$(BUILD_DIR)/libmikmod-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libmikmod
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Mikmod sound library
  URL:=http://mikmod.raphnet.net/
  DEPENDS:=+alsa-lib
endef

define Package/libmikmod/description
  Mikmod is a library supporting many formats, including mod, s3m, it, and xm.
endef

CONFIGURE_ARGS += \
	--disable-esd \
	--disable-oss \
	--enable-alsa

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/mikmod.h \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libmikmod.{a,so*} \
		$(1)/usr/lib/
endef

define Package/libmikmod/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmikmod.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libmikmod))
