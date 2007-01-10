# 
# Copyright (C) 2006 OpenWrt.org
# Copyright (C) 2006 loswillios
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=linuxigd
PKG_VERSION:=0.95
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/linux-igd
PKG_MD5SUM:=0f203a2db5e3fb01496b73e417dbd9a6
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_BUILDDEP:=iptables libupnp

include $(INCLUDE_DIR)/package.mk

define Package/linuxigd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=UPnP daemon
  DEPENDS:=+libupnp +libpthread
  DESCRIPTION:=\
	It implements the UPnP Internet Gateway Device specification (IGD) \\\
	and allows UPnP aware clients, such as MSN Messenger, Azureus or \\\
	Miranda to work properly from behind a NAT firewall. \\\
	\\\
	Please edit /etc/upnpd.conf before using upnpd!
  URL:=http://linux-igd.sourceforge.net/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)  \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		BINDIR="/usr/sbin" \
		MANDIR="/usr/man" \
		HAVE_LIBIPTC=1 \
		LIBIPTC_PREFIX="$(STAGING_DIR)/usr" \
		LIBUPNP_PREFIX="$(STAGING_DIR)/usr" \
		all
endef

define Package/linuxigd/conffiles
/etc/upnpd.conf
endef

define Package/linuxigd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/upnpd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/upnpd.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/linuxigd
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/*.gif $(1)/etc/linuxigd/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/*.xml $(1)/etc/linuxigd/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/upnpd.init $(1)/etc/init.d/upnpd
endef

$(eval $(call BuildPackage,linuxigd))
