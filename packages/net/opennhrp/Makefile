include $(TOPDIR)/rules.mk

PKG_NAME:=opennhrp
PKG_VERSION:=0.11.2
PKG_RELEASE:=1

PKG_SOURCE_URL:=@SF/opennhrp
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=3aace509ac79acbde3bb3e44e88798d5
PKG_CAT:=bzcat

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/opennhrp
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libcares +ipsec-tools
  TITLE:=NBMA Next Hop Resolution Protocol
  URL:=http://opennhrp.sourceforge.net/
endef

define Package/opennhrp/description
  OpenNHRP implements NBMA Next Hop Resolution Protocol (as defined in RFC 2332).
  It makes it possible to create dynamic multipoint VPN Linux router using NHRP,
  GRE and IPsec. It aims to be Cisco DMVPN compatible. 
endef

define Package/opennhrp/install
	$(INSTALL_DIR) $(1)/usr/sbin $(1)/etc/opennhrp $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nhrp/opennhrp $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nhrp/opennhrpctl $(1)/usr/sbin/
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/etc/opennhrp.conf $(1)/etc/opennhrp/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/opennhrp-script* $(1)/etc/opennhrp/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/racoon-ph1down.sh $(1)/etc/opennhrp/
	$(INSTALL_BIN) ./files/opennhrp.init $(1)/etc/init.d/opennhrp
endef

$(eval $(call BuildPackage,opennhrp))
