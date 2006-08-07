#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=rp-pppoe
PKG_VERSION:=3.5
PKG_RELEASE:=1
PKG_MD5SUM:=

PKG_SOURCE_URL:=http://roaringpenguin.com/penguin/pppoe/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/rp-pppoe
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+ppp
  SUBMENU:=Roaring Penguin PPPoE (PPP over Ethernet) implementation
  TITLE:=Roaring Penguin PPPoE (PPP over Ethernet) implementation
endef
  
define Package/rp-pppoe-client
  $(call Package/rp-pppoe)
  TITLE:=PPPoE (PPP over Ethernet) client
endef

define Package/rp-pppoe-relay
  $(call Package/rp-pppoe)
  TITLE:=PPPoE (PPP over Ethernet) relay
endef

define Package/rp-pppoe-server
  $(call Package/rp-pppoe)
  TITLE:=PPPoE (PPP over Ethernet) server
endef

define Package/rp-pppoe-sniff
  $(call Package/rp-pppoe)
  TITLE:=PPPoE (PPP over Ethernet) sniffer
endef

define Build/Configure
 (cd $(PKG_BUILD_DIR)/src ; rm -rf config.{cache,status}; \
                $(TARGET_CONFIGURE_OPTS) \
                CFLAGS="$(TARGET_CFLAGS)" \
                ac_cv_func_setvbuf_reversed=no \
                ac_cv_sizeof_unsigned_short=2 \
                ac_cv_sizeof_unsigned_int=4 \
                ac_cv_sizeof_unsigned_long=4 \
                ac_cv_linux_kernel_pppoe=yes \
                ac_cv_pack_bitfields_reversed=yes \
                ./configure \
                  --target=$(GNU_TARGET_NAME) \
                  --host=$(GNU_TARGET_NAME) \
                  --build=$(GNU_HOST_NAME) \
                  --program-prefix="" \
                  --program-suffix="" \
                  --prefix=/usr \
                  --exec-prefix=/usr \
                  --bindir=/usr/bin \
                  --datadir=/usr/share \
                  --includedir=/usr/include \
                  --infodir=/usr/share/info \
                  --libdir=/usr/lib \
                  --libexecdir=/usr/lib \
                  --localstatedir=/var \
                  --mandir=/usr/share/man \
                  --sbindir=/usr/sbin \
                  --sysconfdir=/etc \
                  $(DISABLE_LARGEFILE) \
		  $(DISABLE_NLS) \
        )
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/rp-pppoe-client/install	
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/pppoe-client.init $(1)/etc/init.d/pppoe-client
	install -d -m0755 $(1)/etc/ppp
	install -m0644 $(PKG_INSTALL_DIR)/etc/pppoe.conf $(1)/etc/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/pppoe $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/adsl-* $(1)/usr/sbin/
endef

define Package/rp-pppoe-relay/install	
	install -d -m0755 $(1)/etc/default
	install -m0755 ./files/pppoe-relay.default $(1)/etc/default/pppoe-relay
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/pppoe-relay.init $(1)/etc/init.d/pppoe-relay
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/pppoe-relay $(1)/usr/sbin/
endef

define Package/rp-pppoe-server/install	
	install -d -m0755 $(1)/etc/default
	install -m0755 ./files/pppoe-server.default $(1)/etc/default/pppoe-server
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/pppoe-server.init $(1)/etc/init.d/pppoe-server
	install -d -m0755 $(1)/etc/ppp
	install -m0644 $(PKG_INSTALL_DIR)/etc/ppp/pppoe-server-options $(1)/etc/ppp/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/pppoe-server $(1)/usr/sbin/
endef

define Package/rp-pppoe-sniff/install	
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/pppoe-sniff $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,rp-pppoe-client))
$(eval $(call BuildPackage,rp-pppoe-relay))
$(eval $(call BuildPackage,rp-pppoe-server))
$(eval $(call BuildPackage,rp-pppoe-sniff))

