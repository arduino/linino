#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=bind
PKG_VERSION:=9.3.1
PKG_RELEASE:=7
PKG_BUILDDEP:=openssl

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.isc.org/isc/bind9/9.3.1/
PKG_MD5SUM:=9ff3204eea27184ea0722f37e43fc95d
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

PKG_BUILDDEP:=libopenssl

include $(INCLUDE_DIR)/package.mk

define Package/bind
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=ISC's DNS suite implementation
  DEPENDS:=+libopenssl
  TITLE:=ISC's DNS suite implementation
  DESCRIPTION:=ISC's DNS suite implementation
  URL:=http://www.isc.org/sw/bind/
endef

define Package/bind-server
  $(call Package/bind)
  DEFAULT:=m if ALL
  TITLE:=ISC's DNS server implementation
  DESCRIPTION:=ISC's DNS server implementation
endef

define Package/bind-client
  $(call Package/bind)
  DEFAULT:=m if ALL
  TITLE:=A dynamic DNS client
  DESCRIPTION:=A dynamic DNS client
endef

define Package/bind-tools
  $(call Package/bind)
  DEFAULT:=m if ALL
  TITLE:=Bind administration tools
  DESCRIPTION:=A DNS client
endef
  
define Package/bind-rndc
  $(call Package/bind)
  DEFAULT:=m if ALL  
  TITLE:=bind administration tools (rndc and rndc-confgen only)
  DESCRIPTION:=bind administration tools (rndc and rndc-confgen only)
endef

define Package/bind-check
  $(call Package/bind)
  DEFAULT:=m if ALL
  TITLE:=bind administration tools (named-checkconf and named-checkzone only)
  DESCRIPTION:=bind administration tools (named-checkconf and named-checkzone only)
endef

define Package/bind-dnssec
  $(call Package/bind)
  DEFAULT:=m if ALL
  TITLE:=Bind administration tools (dnssec-keygen and dnssec-signzone only)
  DESCRIPTION:=Bind administration tools (dnssec-keygen and dnssec-signzone only)
endef

define Package/bind-host
  $(call Package/bind)
  DEFAULT:=m if ALL
  TITLE:=A simple DNS client
  DESCRIPTION:=A simple DNS client
endef

define Package/bind-dig
  $(call Package/bind)
  DEFAULT:=m if ALL
  TITLE:=A DNS client
  DESCRIPTION:=A DNS client
endef

define Package/Build/Configure
$(call Build/Configure/Default,--enable-shared \
--enable-static \
--enable-ipv6 \
--with-randomdev=/dev/urandom \
--disable-threads \
--with-openssl=$(STAGING_DIR)/usr/
)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)/lib/dns \
		CC="$(HOSTCC)" \
		CFLAGS="-O2" \
		gen
	$(MAKE) -C $(PKG_BUILD_DIR) \
	DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/bind-server/install
	install -d -m0755 $(1)/usr/sbin
	install -d -m0755 $(1)/etc/init.d
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/named $(1)/usr/sbin/
	$(CP) files/bind $(1)/etc
	$(CP) files/named.init $(1)/etc/init.d/S$(PKG_INIT_LEVEL)named
	find $(1)/etc/bind -name ".svn" | xargs rm -rf
endef

define Package/bind-client/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/nsupdate $(1)/usr/bin/
endef

define Package/bind-tools/install
	install -d -m0755 $(1)/usr/bin
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/dig $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/host $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/dnssec-keygen $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/dnssec-signzone $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/named-checkconf $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/named-checkzone $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/rndc $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/rndc-confgen $(1)/usr/sbin/
endef

define Package/bind-rndc/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/rndc $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/rndc-confgen $(1)/usr/sbin/
endef

define Package/bind-check/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/named-checkconf $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/named-checkzone $(1)/usr/sbin/
endef

define Package/bind-dnssec/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/dnssec-keygen $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/dnssec-signzone $(1)/usr/sbin/
endef

define Package/bind-host/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/host $(1)/usr/bin/
endef

define Package/bind-dig/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/dig $(1)/usr/bin/
endef

$(eval $(call BuildPackage,bind-server))
$(eval $(call BuildPackage,bind-client))
$(eval $(call BuildPackage,bind-tools))
$(eval $(call BuildPackage,bind-rndc))
$(eval $(call BuildPackage,bind-check))
$(eval $(call BuildPackage,bind-dnssec))
$(eval $(call BuildPackage,bind-host))
$(eval $(call BuildPackage,bind-dig))
