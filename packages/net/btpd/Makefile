#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=btpd
PKG_VERSION:=0.15
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.murmeldjur.se/btpd/
PKG_MD5SUM:=b64e2e8b9936e99685bc1e7246655561

include $(INCLUDE_DIR)/package.mk

define Package/btpd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl
  SUBMENU:=BitTorrent
  TITLE:=btpd - BitTorrent Protocol Daemon
  URL:=http://www.murmeldjur.se/btpd/
endef

define Package/btpd/description
	BTPD is a bittorrent client consisting of a daemon and client commands, 
	which can be used to read and/or manipulate the daemon state. 
	The daemon is capable of running several torrents simultaneously and only uses one tcp port. 
	It's fairly low on resource usage and should be perfect for file distribution sites. 
	Efficient downloads and ease of use makes this client a good choice for the casual user as well.
endef

CONFIGURE_ARGS += -C --with-evloop-method=poll

define Package/btpd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/btpd/btpd $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cli/btcli $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cli/btinfo $(1)/usr/bin	
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/btpd.init $(1)/etc/init.d/btpd
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/btpd.config $(1)/etc/config/btpd
endef

$(eval $(call BuildPackage,btpd))
