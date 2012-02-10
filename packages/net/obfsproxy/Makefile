#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=obfsproxy
PKG_REV:=0ba2d3bbb829cc71e38ecae6d5d9134af9045a22
PKG_VERSION:=20120210
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://git.torproject.org/obfsproxy.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=git

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/obfsproxy
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=A pluggable transports proxy
  URL:=https://www.torproject.org/projects/obfsproxy
  DEPENDS:=+libevent2 +libopenssl
endef

define Package/obfsproxy/description
  obfsproxy is a tool that attempts to circumvent censorship, by transforming
  the Tor traffic between the client and the bridge. This way, censors, who
  usually monitor traffic between the client and the bridge, will see
  innocent-looking transformed traffic instead of the actual Tor traffic.
endef

define Package/obfsproxy/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/obfsproxy $(1)/usr/bin/
endef

$(eval $(call BuildPackage,obfsproxy))
