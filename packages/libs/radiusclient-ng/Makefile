# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=radiusclient-ng
PKG_VERSION:=0.5.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.berlios.de/radiusclient-ng/
PKG_MD5SUM:=c54eb70e964bdd22dd44b39a9b4df8ca
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/radiusclient-ng/Default
  DESCRIPTION:=\
	Purpose of this project is to build a portable, easy-to-use and standard \\\
	compliant library suitable for developing free and commercial software \\\
	that need support for RADIUS protocol (RFCs 2128 and 2139).
  URL:=http://developer.berlios.de/projects/radiusclient-ng/
endef
  
define Package/libradiusclient-ng
  $(call Package/radiusclient-ng/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=RADIUS client library
  DESCRIPTION+=\\\
	\\\
	This package contains shared libraries, needed by other programs.
endef

define Package/libradiusclient-ng/conffiles
/etc/radiusclient-ng/issue
/etc/radiusclient-ng/port-id-map
/etc/radiusclient-ng/radiusclient.conf
/etc/radiusclient-ng/servers
endef

define Package/radiusclient-ng
  $(call Package/radiusclient-ng/Default)
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libradiusclient-ng
  TITLE:=RADIUS client
  DESCRIPTION+=\\\
	\\\
	This package contains a RADIUS client.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/radiusclient-ng.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libradiusclient-ng.{a,so}* $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/radiusclient-ng.h \
		$(STAGING_DIR)/usr/lib/libradiusclient-ng.{a,so}*
endef

define Package/libradiusclient-ng/install
	install -d -m0755 $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/etc/radiusclient-ng $(1)/etc/
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libradiusclient-ng.so.* $(1)/usr/lib/
endef

define Package/radiusclient-ng/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/rad{acct,iusclient,login,status} $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,libradiusclient-ng))
$(eval $(call BuildPackage,radiusclient-ng))
