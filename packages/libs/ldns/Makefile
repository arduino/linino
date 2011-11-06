#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ldns
PKG_VERSION:=1.6.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.nlnetlabs.nl/downloads/ldns
PKG_MD5SUM:=fadf8e38fbd2d3434a2c46097d9932d5

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libldns
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A library to simplify DNS programming
  URL:=http://www.nlnetlabs.nl/projects/ldns/
  DEPENDS:=+libopenssl
endef

CONFIGURE_ARGS += \
	--disable-gost \
	--with-ssl="$(STAGING_DIR)/usr"

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/ldns $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libldns.{a,so*} $(1)/usr/lib/
endef

define Package/libldns/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libldns.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libldns))
