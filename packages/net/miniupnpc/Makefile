include $(TOPDIR)/rules.mk

PKG_NAME:=miniupnpc
PKG_VERSION:=1.4
PKG_RELEASE:=2

PKG_SOURCE_URL:=http://miniupnp.free.fr/files
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=e8de10c42d64e77c321e57400d50e7e4

include $(INCLUDE_DIR)/package.mk

define Package/miniupnpc
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Firewall
  TITLE:=Lightweight UPnP client
  URL:=http://miniupnp.tuxfamily.org/
endef

TARGET_CFLAGS += $(FPIC)

define Package/miniupnpc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/upnpc-static $(1)/usr/bin/upnpc
endef

$(eval $(call BuildPackage,miniupnpc))
