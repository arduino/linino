#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=osiris
PKG_VERSION:=4.2.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://osiris.shmoo.com/data/
PKG_MD5SUM:=11445f7d8dec737f0be89357f5c5bcae
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/osirisd
  SECTION:=admin
  CATEGORY:=Administration
  DEPENDS:=+libopenssl
  TITLE:=Host integrity monitoring system (scanning agent)
  URL:=http://www.hostintegrity.com/osiris
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-osiris-user=root \
		--with-root-dir=/var/lib/osiris \
		--with-readline=no, \
		ac_cv_openssldir="$(STAGING_DIR)/usr" \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		INTERACTIVE=0 \
		all install
endef

define Package/osirisd/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/osirisd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/osirisd.init $(1)/etc/init.d/osirisd
endef

$(eval $(call BuildPackage,osirisd))
