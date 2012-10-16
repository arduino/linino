# 
# Copyright (C) 2008-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=shorewall-core
PKG_VERSION:=4.5.7
PKG_DIRECTORY:=4.5.7
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://www.shorewall.net/pub/shorewall/4.5/shorewall-$(PKG_DIRECTORY)/ \
	http://www1.shorewall.net/pub/shorewall/4.5/shorewall-$(PKG_DIRECTORY)/ \
	http://slovakia.shorewall.net/pub/shorewall/4.5/shorewall-$(PKG_DIRECTORY)/ \
	http://shorewall.de/pub/shorewall/4.5/shorewall-$(PKG_DIRECTORY)/ \
	http://www.shorewall.com.au/4.5/shorewall-$(PKG_DIRECTORY)/ \
	http://shorewall.infohiiway.com/pub/shorewall/4.5/shorewall-$(PKG_DIRECTORY)/ \
	http://www.shorewall.com.ar/pub/shorewall/shorewall/4.5/shorewall-$(PKG_DIRECTORY)/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=ed3880b96a22e16cafc68d2e0f976b3a

include $(INCLUDE_DIR)/package.mk

define Package/shorewall-core
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+ip +iptables +perl +perlbase-digest
  TITLE:=Shorewall Core
  URL:=http://www.shorewall.net/
  SUBMENU:=Firewall
endef

define Package/shorewall-core/description
	The Shoreline Firewall, is high-level tool for configuring Netfilter.
	This package provides the core Shorewall libraries installed in /usr/share/shorewall/,
	which are required for the rest of the Shorewall packages to work.
endef

define Package/shorewall-core/conffiles
	/usr/share/shorewall/shorewallrc
endef

CONFIGURE_ARGS += \
	vendor=linux

define Build/Compile
	DESTDIR=$(PKG_INSTALL_DIR) $(PKG_BUILD_DIR)/install.sh
endef

define Package/shorewall-core/install
	$(INSTALL_DIR) $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/usr/share/shorewall $(1)/usr/share
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/shorewall/wait4ifup $(1)/usr/share/shorewall
endef

$(eval $(call BuildPackage,shorewall-core))
