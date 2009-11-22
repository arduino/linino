# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ahcpd
PKG_VERSION:=0.50
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.pps.jussieu.fr/~jch/software/files/
PKG_MD5SUM:=627ec199784c60e5250651f82511fff2

include $(INCLUDE_DIR)/package.mk

define Package/ahcpd
  SECTION:=ipv6
  CATEGORY:=IPv6
  TITLE:=Ad-Hoc Configuration Protocol daemon
  URL:=http://www.pps.jussieu.fr/~jch/software/ahcp/
  DEPENDS:=+kmod-ipv6 +ip
endef

define Package/ahcpd/description
 Ahcpd is a daemon for configuring an IPv6 network using the Ad-Hoc
 Configuration Protocol (AHCP).  AHCP is designed for wireless mesh
 networks, where IPv6 autoconfiguration and DHCPv6 do not work, but may
 also be used on wired networks.
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); \
		$(SED) 's,/usr/local/bin/,/usr/lib/ahcp/,g' ahcpd.c ; \
		$(SED) 's,/usr/local/lib/ahcp/,/usr/lib/ahcp/,g' ahcp-config.sh ; \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		all
endef

define Package/ahcpd/conffiles
/etc/config/ahcpd
endef

define Package/ahcpd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib/ahcp
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ahcp-config.sh $(1)/usr/lib/ahcp/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ahcpd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/ahcpd.config $(1)/etc/config/ahcpd
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/ahcpd.init $(1)/etc/init.d/ahcpd
endef

$(eval $(call BuildPackage,ahcpd))
