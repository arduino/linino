#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=monit
PKG_VERSION:=4.6
PKG_RELEASE:=1
PKG_MD5SUM:=4e53aa44e4ca264e61c7c401cee4e697

PKG_SOURCE_URL:=http://www.tildeslash.com/monit/dist/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/monit
  SECTION:=admin
  CATEGORY:=Administration
  DEPENDS:=+libpthread +libopenssl
  TITLE:=System services monitoring utility, with SSL support
  DESCRIPTION:=An utility for monitoring services on a Unix system\\\
This package is built with SSL support.\\\
  URL:=http://www.tildeslash.com/monit
endef

define Package/monit/conffiles
/etc/monitrc
endef

define Package/monit-nossl
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=System services monitoring utility, without SSL support
  DESCRIPTION:=An utility for monitoring services on a Unix system.\\\
This package is built without SSL support.\\\
  URL:=http://www.tildeslash.com/monit
endef

define Package/monit/conffiles
/etc/monitrc
endef

define Build/Configure
$(call Build/Configure/Default,--with-ssl \
	--with-ssl-dir="$(STAGING_DIR)/usr" \
)
	$(MAKE) -C $(PKG_BUILD_DIR)
	mv $(PKG_BUILD_DIR)/monit $(PKG_BUILD_DIR)/monit-ssl
	$(MAKE) -C $(PKG_BUILD_DIR) clean
$(call Build/Configure/Default,--without-ssl)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		clean all
	mv $(PKG_BUILD_DIR)/monit $(PKG_BUILD_DIR)/monit-nossl
endef

define Package/monit/install	
	install -d -m0755 $(1)/etc
	install -m0600 $(PKG_BUILD_DIR)/monitrc $(1)/etc/
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/monit.init $(1)/etc/init.d/monit
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/monit-ssl $(1)/usr/sbin/monit
endef

define Package/monit-nossl/install
	install -d -m0755 $(1)/etc
	install -m0600 $(PKG_BUILD_DIR)/monitrc $(1)/etc/
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/monit.init $(1)/etc/init.d/monit
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/monit-nossl $(1)/usr/sbin/monit
endef

$(eval $(call BuildPackage,monit))
$(eval $(call BuildPackage,monit-nossl))
