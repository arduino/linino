# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ipcad
PKG_VERSION:=3.7
PKG_RELEASE:=1
PKG_MD5SUM:=34c542c99593dfe9d5b408deffcfe70e

PKG_SOURCE_URL:=@SF/ipcad
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/ipcad
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap
  TITLE:=listens for traffic on the specified interfaces
  DESCRIPTION:=This daemon listens for traffic on the specified interfaces.\\\
It has the built-in RSH and NetFlow engines to allow exporting\\\
the accounting data the same way as Cisco routers do.\\\
  URL:=http://lionet.info/ipcad/
endef

define Package/ipcad/conffiles/
/etc/ipcad.conf
endef


define Build/Configure
$(call Build/Configure/Default,--enable-shared \
--disable-static \
--disable-rpath \
--with-gnu-ld \
--with-psrc=pcap \
--with-pcap-include="$(STAGING_DIR)/usr/include" \
--with-pcap-libraries="$(STAGING_DIR)/usr/lib",touch cfglex.c cslex.c;)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR=$(PKG_INSTALL_DIR) \
		all install
endef

define Package/ipcad/install	
	install -d -m0755 $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/etc/ipcad.conf $(1)/etc/
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ipcad $(1)/usr/bin/
endef

$(eval $(call BuildPackage,ipcad))
