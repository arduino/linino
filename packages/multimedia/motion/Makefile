#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=motion
PKG_VERSION:=3.2.6
PKG_RELEASE:=1
PKG_MD5SUM:=71e6bd13fcca70372e9b7c7806d62b30

PKG_SOURCE_URL:=@SF/motion
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/motion
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+libjpeg
  TITLE:=webcam motion sensing and logging
  DESCRIPTION:=Motion is a software motion detector
  URL:=http://www.lavrsen.dk/twiki/bin/view/Motion/WebHome
endef

define Build/Configure
$(call Build/Configure/Default,--without-ffmpeg \
			--without-jpeg-mmx \
			--without-mysql \
			--without-pgsql \
)
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/motion/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/motion $(1)/usr/bin/
endef

$(eval $(call BuildPackage,motion))
