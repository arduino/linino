#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=sipsak
PKG_VERSION:=0.9.6
PKG_RELEASE:=1
PKG_MD5SUM:=c4eb8e282902e75f4f040f09ea9d99d5

PKG_SOURCE_URL:=http://download.berlios.de/sipsak/ \
	http://ftp.iptel.org/pub/sipsak/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/sipsak
  SECTION:=net
  CATEGORY:=Network
  DEPEDNDS:=+libopenssl
  TITLE:=SIP (Session Initiation Protocol) stress and diagnostics utility
  DESCRIPTION:=A SIP (Session Initiation Protocol) stress and diagnostics utility
  URL:=http://www.sipsak.org/
endef
			
define Build/Configure
$(call Build/Configure/Default,--enable-shared \
			--disable-static \
			--disable-gnutls,ac_cv_func_malloc_0_nonnull=yes)
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/sipsak/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/sipsak $(1)/usr/bin/
endef

$(eval $(call BuildPackage,sipsak))
