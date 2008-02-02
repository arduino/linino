include $(TOPDIR)/rules.mk

PKG_NAME:=btpd
PKG_VERSION:=0.13
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.murmeldjur.se/btpd/
PRG_MD5SUM:=0d9c4a672eea6f298fa6e44d94da1657

include $(INCLUDE_DIR)/package.mk

define Package/btpd
  SECTION:=net
  CATEGORY:=Network
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

CONFIGURE_ARGS += -C

define Package/btpd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/btpd/btpd $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cli/btcli $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cli/btinfo $(1)/usr/bin	
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/btpd.init $(1)/etc/init.d/btpd
endef

$(eval $(call BuildPackage,btpd))
