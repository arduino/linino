#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=sane-backends
PKG_VERSION:=1.0.17
PKG_RELEASE:=1
PKG_MD5SUM:=b51c10da8a81a04e1bae88c9e6556df2

PKG_SOURCE_URL:=ftp://ftp.sane-project.org/pub/sane/$(PKG_NAME)-$(PKG_VERSION)/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/sane-backends
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Scanner Access Now Easy (backends)
  DESCRIPTION:=SANE (Scanner Access Now Easy) is a universal scanner interface.
  URL:=http://www.sane-project.org
endef

define Package/sane-backends/conffiles
/etc/sane.d/saned.conf
endef

define Build/Configure
$(call Build/Configure/Default,--enable-shared \
			--disable-static \
			--disable-ipv6 \
			--disable-translations \
			--without-gphoto2 \
			--disable-debug)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
endef

define Package/sane-backends/install	
	install -d -m0755 $(1)/etc/sane.d
	$(CP) $(PKG_INSTALL_DIR)/etc/sane.d/*.conf $(1)/etc/sane.d/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/saned $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,sane-backends))
