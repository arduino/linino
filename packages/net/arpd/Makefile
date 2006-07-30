#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=arpd
PKG_VERSION:=0.2
PKG_RELEASE:=1
PKG_MD5SUM:=e2911fa9de1b92ef50deda1489ae944d

PKG_SOURCE_URL:=http://niels.xtdnet.nl/honeyd
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/arpd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap +libdnet +libevent
  TITLE:=A daemon to fake ARP replies
  DESCRIPTION:=A daemon to fake ARP replies
  URL:=http://niels.xtdnet.nl/honeyd
endef

define Build/Configure
$(call Build/Configure/Default,--enable-shared --disable-static \
--with-libdnet=$(STAGING_DIR)/usr \
--with-libevent=$(STAGING_DIR)/usr \
--with-libpcap=$(STAGING_DIR)/usr \
)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CCOPT="$(TARGET_CFLAGS)" \
		INCLS="-I. -I$(STAGING_DIR)/usr/include" \
		LIBS="-L$(STAGING_DIR)/usr/lib -lpcap -ldnet -levent"
endef

define Package/arpd/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,arpd))
