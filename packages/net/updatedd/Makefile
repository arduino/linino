#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=updatedd
PKG_VERSION:=2.5
PKG_RELEASE:=1
PKG_MD5SUM:=2957496de0c8e08e9c6492fabf1a88be

PKG_SOURCE_URL:=http://savannah.nongnu.org/download/updatedd/
PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/updatedd
  SECTION:=net
  CATEGORY:=Network
  MENU:=1
  TITLE:=A tool to update dynamic dns services
  DESCRIPTION:=Updatedd is a small tool that will update one of many dynamic\\\
  dns services on boot.\\\
  Please look at the /etc/init.d/ddns script for more info.\\\
  URL:=http://www.philipp-benner.de/updatedd/
endef

define Package/updatedd-mod-changeip
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=updatedd
  TITLE:=changeip.com
endef

define Package/updatedd-mod-dyndns
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=updatedd
  TITLE:=dyndns.org
endef

define Package/updatedd-mod-eurodyndns
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=updatedd
  TITLE:=eurodyndns.org
endef

define Package/updatedd-mod-hn
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=updatedd
  TITLE:=hn.org
endef

define Package/updatedd-mod-noip
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=updatedd
  TITLE:=no-ip.com
endef

define Package/updatedd-mod-ods
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=updatedd
  TITLE:=ods.org
endef

define Package/updatedd-mod-ovh
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=updatedd
  TITLE:=ovh.com
endef

define Package/updatedd-mod-regfish
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=updatedd
  TITLE:=regfish.com
endef

define Package/updatedd-mod-tzo
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=updatedd
  TITLE:=tzo.com
endef

define Build/Compile
$(call Build/Compile/Default,DESTDIR="$(PKG_INSTALL_DIR)" \
		all install)
endef

define BuildPlugin
  define Package/$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/updatedd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/updatedd/$(2).so $$(1)/usr/lib/updatedd/
  endef

  $$(eval $$(call BuildPackage,$(1)))
endef

define Package/updatedd/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/ddns.init $(1)/etc/init.d/ddns
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/updatedd $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/updatedd
endef

$(eval $(call BuildPackage,updatedd))
$(eval $(call BuildPlugin,updatedd-mod-changeip,changeip))
$(eval $(call BuildPlugin,updatedd-mod-dyndns,dyndns))
$(eval $(call BuildPlugin,updatedd-mod-eurodyndns,eurodyndns))
$(eval $(call BuildPlugin,updatedd-mod-hn,hn))
$(eval $(call BuildPlugin,updatedd-mod-noip,noip))
$(eval $(call BuildPlugin,updatedd-mod-ods,ods))
$(eval $(call BuildPlugin,updatedd-mod-ovh,ovh))
$(eval $(call BuildPlugin,updatedd-mod-regfish,regfish))
$(eval $(call BuildPlugin,updatedd-mod-tzo,tzo))
