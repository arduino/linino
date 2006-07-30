# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=amwall
PKG_VERSION:=0.1.0
PKG_RELEASE:=1
PKG_MD5SUM:=a8b6438e7fd9ccadc9f68824ae62349c

PKG_SOURCE_URL:=ftp://ftp.amselinux.net/source/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/amwall
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libamsel
  TITLE:=PF to iptables
  DESCRIPTION:=PF to iptables
  URL:=http://www.amselinux.net
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		V= \
		LDIR=$(PKG_BUILD_DIR) \
		AMSEL_INCLUDE="$(STAGING_DIR)/usr/include" \
		OPT_LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
		PREFIX="/usr" \
		CONFIG="$(PKG_BUILD_DIR)/etc/amsel" \
		DESTDIR=$(PKG_INSTALL_DIR) \
		all install
endef

define Package/amwall/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/* $(1)/usr/sbin
	install -d -m0755 $(1)/etc/amsel
	$(CP) $(PKG_INSTALL_DIR)/etc/amsel* $(1)/etc
endef

$(eval $(call BuildPackage,amwall))
