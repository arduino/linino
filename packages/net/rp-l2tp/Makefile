#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=rp-l2tp
PKG_VERSION:=0.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/rp-l2tp
PKG_MD5SUM:=0e45d11cb4fa6c56cce6b1d119733ed9
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/rp-l2tpd/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Roaring Penguin L2TP
  DESCRIPTION:=\
	Roaring Penguin L2TP (Layer 2 Tunneling Protocol) implementation.
  URL:=http://sourceforge.net/projects/rp-l2tp/
endef

define Package/rp-l2tpd
  $(call Package/rp-l2tpd/Default)
  TITLE+= daemon
  MENU:=1
endef

define Package/rp-l2tpd-mod-cmd
  $(call Package/rp-l2tpd/Default)
  DEPENDS:=rp-l2tpd
  TITLE:=Simple command handler for the RR L2TP daemon
endef

define Package/rp-l2tpd-mod-ppp
  $(call Package/rp-l2tpd/Default)
  DEPENDS:=rp-l2tpd
  TITLE:=PPP handler for the RR L2TP daeomon
endef

# uses GNU configure

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/rp-l2tpd/install	
	install -d -m0755 $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/etc/l2tp.conf.example $(1)/etc/l2tp.conf
	install -d -m0755 $(1)/usr/lib/l2tp
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/l2tpd $(1)/usr/sbin/
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/rp-l2tpd.init $(1)/etc/init.d/rp-l2tpd
endef

define Package/rp-l2tpd-mod-cmd/install	
	install -d -m0755 $(1)/usr/lib/l2tp
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/l2tp/cmd.so $(1)/usr/lib/l2tp/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/l2tp-control $(1)/usr/sbin/
endef

define Package/rp-l2tpd-mod-ppp/install
	install -d -m0755 $(1)/usr/lib/l2tp
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/l2tp/sync-pppd.so $(1)/usr/lib/l2tp/
endef

$(eval $(call BuildPackage,rp-l2tpd))
$(eval $(call BuildPackage,rp-l2tpd-mod-cmd))
$(eval $(call BuildPackage,rp-l2tpd-mod-ppp))
