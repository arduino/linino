include $(TOPDIR)/rules.mk

PKG_NAME:=ptpd
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/ptpd
PKG_MD5SUM:=b112b2bedc7f6e6e11a838608b9e0357

include $(INCLUDE_DIR)/package.mk

MAKE_PATH:=src

define Package/ptpd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=PTPD
  URL:=http://ptpd.sourceforge.net/
endef

define Package/ptpd/daemon
 The PTP daemon (PTPd) implements the Precision Time protocol (PTP) as defined by the IEEE 1588 standard.
 PTP was developed to provide very precise time coordination of LAN connected computers.
endef

define Package/ptpd/install
	$(INSTALL_DIR) $(1)/usr/sbin $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/ptpd $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/ptpd.init $(1)/etc/init.d/
endef

$(eval $(call BuildPackage,ptpd))
