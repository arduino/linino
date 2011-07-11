# 
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=strongswan
PKG_VERSION:=4.5.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://download.strongswan.org/
PKG_MD5SUM:=ac33b8f849a274127f84df0838cae953

PKG_MOD_AVAILABLE:= \
	aes \
	agent \
	attr \
	attr-sql \
	blowfish \
	constraints \
	coupling \
	curl \
	des \
	dhcp \
	dnskey \
	duplicheck \
	eap-md5 \
	eap-mschapv2 \
	eap-radius \
	farp \
	fips-prf \
	gcrypt \
	gmp \
	hmac \
	kernel-klips \
	kernel-netlink \
	kernel-pfkey \
	ldap \
	led \
	load-tester \
	md5 \
	medcli \
	medsrv \
	mysql \
	padlock \
	pem \
	pgp \
	pkcs1 \
	pubkey \
	random \
	resolve \
	revocation \
	sha1 \
	sha2 \
	smp \
	socket-default \
	socket-raw \
	sql \
	sqlite \
	stroke \
	uci \
	updown \
	whitelist \
	x509 \
	xauth \
	xcbc \

PKG_BUILD_DEPENDS:= \
	PACKAGE_strongswan4-libfast:clearsilver \
	PACKAGE_strongswan4-libfast:fcgi \

PKG_CONFIG_DEPENDS:= \
	CONFIG_STRONGSWAN4_ENABLE_CISCO_QUIRKS \
	CONFIG_STRONGSWAN4_ENABLE_NAT_TRANSPORT \
	CONFIG_STRONGSWAN4_ENABLE_VENDOR_ID \
	CONFIG_STRONGSWAN4_ENABLE_XAUTH_VID \
	CONFIG_STRONGSWAN4_DEVICE_RANDOM \
	CONFIG_STRONGSWAN4_DEVICE_URANDOM \
	CONFIG_STRONGSWAN4_ROUTING_TABLE \
	CONFIG_STRONGSWAN4_ROUTING_TABLE_PRIO \
	$(patsubst %,CONFIG_PACKAGE_strongswan4-mod-%,$(PKG_MOD_AVAILABLE)) \

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk


define Package/strongswan4/Default
  SUBMENU:=VPN
  SECTION:=net
  CATEGORY:=Network
  TITLE:=StrongSwan
  URL:=http://www.strongswan.org/
endef

define Package/strongswan4/description/Default
 StrongSwan is an OpenSource IPsec implementation for the Linux 
 operating system.
endef


define Package/strongswan4
$(call Package/strongswan4/Default)
  DEPENDS:= +libpthread +ip \
	+kmod-crypto-authenc \
	+kmod-ipsec +kmod-ipsec4 \
	+kmod-ipt-ipsec +iptables-mod-ipsec
  MENU:=1
endef

define Package/strongswan4/config
	source "$(SOURCE)/Config.in"
endef

define Package/strongswan4/description
$(call Package/strongswan4/description/Default)
 .
 This package contains shared libraries and scripts.
endef


define Package/strongswan4-full
$(call Package/strongswan4/Default)
  TITLE+= (full)
  DEPENDS:= strongswan4 \
	+strongswan4-app-charon \
	+strongswan4-app-pluto \
	+strongswan4-libfast \
	+strongswan4-mod-aes \
	+strongswan4-mod-agent \
	+strongswan4-mod-attr \
	+strongswan4-mod-attr-sql \
	+strongswan4-mod-blowfish \
	+strongswan4-mod-constraints \
	+strongswan4-mod-coupling \
	+strongswan4-mod-curl \
	+strongswan4-mod-des \
	+strongswan4-mod-dhcp \
	+strongswan4-mod-dnskey \
	+strongswan4-mod-duplicheck \
	+strongswan4-mod-eap-md5 \
	+strongswan4-mod-eap-mschapv2 \
	+strongswan4-mod-eap-radius \
	+strongswan4-mod-farp \
	+strongswan4-mod-fips-prf \
	+strongswan4-mod-gcrypt \
	+strongswan4-mod-gmp \
	+strongswan4-mod-hmac \
	+strongswan4-mod-kernel-netlink \
	+strongswan4-mod-kernel-pfkey \
	+strongswan4-mod-ldap \
	+strongswan4-mod-led \
	+strongswan4-mod-load-tester \
	+strongswan4-mod-md5 \
	+strongswan4-mod-medcli \
	+strongswan4-mod-medsrv \
	+strongswan4-mod-mysql \
	+TARGET_x86:strongswan4-mod-padlock \
	+strongswan4-mod-pem \
	+strongswan4-mod-pgp \
	+strongswan4-mod-pkcs1 \
	+strongswan4-mod-pubkey \
	+strongswan4-mod-random \
	+strongswan4-mod-resolve \
	+strongswan4-mod-revocation \
	+strongswan4-mod-sha1 \
	+strongswan4-mod-sha2 \
	+strongswan4-mod-smp \
	+strongswan4-mod-socket-raw \
	+strongswan4-mod-sql \
	+strongswan4-mod-sqlite \
	+strongswan4-mod-stroke \
	+strongswan4-mod-uci \
	+strongswan4-mod-updown \
	+strongswan4-mod-whitelist \
	+strongswan4-mod-x509 \
	+strongswan4-mod-xauth \
	+strongswan4-mod-xcbc \
	+strongswan4-utils
endef

define Package/strongswan4-full/description
$(call Package/strongswan4/description/Default)
 .
 This meta-package contains dependencies for all of the strongswan4 
 plugins except kernel-klips and socket-default which are ommitted in 
 favor of the kernel-netlink and socket-raw plugins.
endef


define Package/strongswan4-default
$(call Package/strongswan4/Default)
  TITLE+= (default)
  DEPENDS:= strongswan4 \
	+strongswan4-app-charon \
	+strongswan4-app-pluto \
	+strongswan4-mod-aes \
	+strongswan4-mod-constraints \
	+strongswan4-mod-attr \
	+strongswan4-mod-des \
	+strongswan4-mod-dnskey \
	+strongswan4-mod-fips-prf \
	+strongswan4-mod-gmp \
	+strongswan4-mod-hmac \
	+strongswan4-mod-kernel-netlink \
	+strongswan4-mod-md5 \
	+strongswan4-mod-pem \
	+strongswan4-mod-pgp \
	+strongswan4-mod-pkcs1 \
	+strongswan4-mod-pubkey \
	+strongswan4-mod-random \
	+strongswan4-mod-revocation \
	+strongswan4-mod-resolve \
	+strongswan4-mod-sha1 \
	+strongswan4-mod-sha2 \
	+strongswan4-mod-socket-raw \
	+strongswan4-mod-stroke \
	+strongswan4-mod-updown \
	+strongswan4-mod-x509 \
	+strongswan4-mod-xauth \
	+strongswan4-mod-xcbc \
	+strongswan4-utils
endef

define Package/strongswan4-default/description
$(call Package/strongswan4/description/Default)
 .
 This meta-package contains only dependencies to match upstream
 defaults.
endef


define Package/strongswan4-minimal
$(call Package/strongswan4/Default)
  TITLE+= (minimal)
  DEPENDS:= strongswan4 \
	+strongswan4-app-charon \
	+strongswan4-mod-aes \
	+strongswan4-mod-gmp \
	+strongswan4-mod-hmac \
	+strongswan4-mod-kernel-netlink \
	+strongswan4-mod-pubkey \
	+strongswan4-mod-random \
	+strongswan4-mod-sha1 \
	+strongswan4-mod-socket-default \
	+strongswan4-mod-stroke \
	+strongswan4-mod-updown \
	+strongswan4-mod-x509 \
	+strongswan4-mod-xcbc
endef

define Package/strongswan4-minimal/description
$(call Package/strongswan4/description/Default)
 .
 This meta-package contains only dependencies for a minimal IKEv2 setup.
endef


define Package/strongswan4-app-charon
$(call Package/strongswan4/Default)
  TITLE+= IKEv2 keying daemon
  DEPENDS:= strongswan4
endef

define Package/strongswan4-app-charon/description
$(call Package/strongswan4/description/Default)
 .
 This package contains charon, an IKEv2 keying daemon.
endef


define Package/strongswan4-app-pluto
$(call Package/strongswan4/Default)
  TITLE+= IKEv1 keying daemon
  DEPENDS:= strongswan4
endef

define Package/strongswan4-app-pluto/description
$(call Package/strongswan4/description/Default)
 .
 This package contains pluto, an IKEv1 keying daemon.
endef


define Package/strongswan4-libfast
$(call Package/strongswan4/Default)
  TITLE+= libfast
  DEPENDS:= strongswan4
endef

define Package/strongswan4-libfast/description
$(call Package/strongswan4/description/Default)
 .
 This package contains libfast, a lightweight framework to build native 
 web applications using ClearSilver and FastCGI.
endef


define Package/strongswan4-utils
$(call Package/strongswan4/Default)
  TITLE+= utilities
  DEPENDS:= strongswan4
endef

define Package/strongswan4-utils/description
$(call Package/strongswan4/description/Default)
 .
 This package contains the openac, pki & scepclient utilities.
endef


# 1. Name
# 2. Title
# 3. Depends
define BuildPlugin
  define Package/strongswan4-mod-$(1)
    $$(call Package/strongswan4/Default)
    TITLE:= StrongSwan $(2) plugin
    DEPENDS:= strongswan4 $(3)
  endef

  define Package/strongswan4-mod-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/ipsec/plugins
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/ipsec/plugins/libstrongswan-$(1).so \
		$$(1)/usr/lib/ipsec/plugins/ ;
	$(call Plugin/$(1)/install,$$(1))
  endef

  $$(eval $$(call BuildPackage,strongswan4-mod-$(1)))
endef


CONFIGURE_ARGS+= \
	$(if $(CONFIG_STRONGSWAN4_ENABLE_CISCO_QUIRKS),--enable-cisco-quirks,--disable-cisco-quirks) \
	$(if $(CONFIG_STRONGSWAN4_ENABLE_NAT_TRANSPORT),--enable-nat-transport,--disable-nat-transport) \
	$(if $(CONFIG_STRONGSWAN4_ENABLE_VENDOR_ID),--enable-vendor-id,--disable-vendor-id) \
	$(if $(CONFIG_STRONGSWAN4_ENABLE_XAUTH_VID),--enable-xauth-vid,--disable-xauth-vid) \
	--disable-scripts \
	--disable-static \
	$(if $(CONFIG_PACKAGE_strongswan4-libfast),--enable-fast,--disable-fast) \
	$(if $(CONFIG_PACKAGE_strongswan4-utils),--enable-tools,--disable-tools) \
	--with-random-device="$(call qstrip,$(CONFIG_STRONGSWAN4_DEVICE_RANDOM))" \
	--with-urandom-device="$(call qstrip,$(CONFIG_STRONGSWAN4_DEVICE_URANDOM))" \
	--with-routing-table="$(call qstrip,$(CONFIG_STRONGSWAN4_ROUTING_TABLE))" \
	--with-routing-table-prio="$(call qstrip,$(CONFIG_STRONGSWAN4_ROUTING_TABLE_PRIO))" \
	$(foreach m,$(PKG_MOD_AVAILABLE), \
	  $(if $(CONFIG_PACKAGE_strongswan4-mod-$(m)),--enable-$(m),--disable-$(m)) \
	) \

ifneq ($(CONFIG_PACKAGE_strongswan4-libfast),)
  EXTRA_CPPFLAGS+= -I$(STAGING_DIR)/usr/include/ClearSilver
endif

EXTRA_LDFLAGS+= -Wl,-rpath-link,$(STAGING_DIR)/usr/lib


define Package/strongswan4/conffiles
/etc/ipsec.conf
/etc/ipsec.secrets
/etc/strongswan.conf
endef

define Package/strongswan4/install
	$(INSTALL_DIR) $(1)/etc
	$(CP) -R $(PKG_INSTALL_DIR)/etc/ipsec.d $(1)/etc/
	$(CP) $(PKG_INSTALL_DIR)/etc/{ipsec.conf,strongswan.conf} $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/{libstrongswan.so.*,libhydra.so.*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/ipsec $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/lib/ipsec
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/{_copyright,starter} $(1)/usr/lib/ipsec/
	$(INSTALL_CONF) ./files/ipsec.secrets $(1)/etc/
endef


define Package/strongswan4-default/install
	true
endef


define Package/strongswan4-full/install
	true
endef


define Package/strongswan4-minimal/install
	true
endef


define Package/strongswan4-app-charon/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcharon.so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/ipsec
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/{charon,stroke} $(1)/usr/lib/ipsec/
endef


define Package/strongswan4-app-pluto/install
	$(INSTALL_DIR) $(1)/usr/lib/ipsec
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/{pluto,_pluto_adns,whack} $(1)/usr/lib/ipsec/
endef


define Package/strongswan4-libfast/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfast.so.* $(1)/usr/lib/
endef


define Package/strongswan4-utils/install
	$(INSTALL_DIR) $(1)/usr/lib/ipsec
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/{openac,pki,scepclient} $(1)/usr/lib/ipsec/
endef


define Plugin/attr-sql/install
	$(INSTALL_DIR) $(1)/usr/lib/ipsec
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/pool $(1)/usr/lib/ipsec/
endef

define Plugin/updown/install
	$(INSTALL_DIR) $(1)/usr/lib/ipsec
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/{_updown,_updown_espmark} $(1)/usr/lib/ipsec/
endef


$(eval $(call BuildPackage,strongswan4))
$(eval $(call BuildPackage,strongswan4-default))
$(eval $(call BuildPackage,strongswan4-full))
$(eval $(call BuildPackage,strongswan4-minimal))
$(eval $(call BuildPackage,strongswan4-app-charon))
$(eval $(call BuildPackage,strongswan4-app-pluto))
$(eval $(call BuildPackage,strongswan4-libfast))
$(eval $(call BuildPackage,strongswan4-utils))

$(eval $(call BuildPlugin,aes,AES crypto,))
$(eval $(call BuildPlugin,agent,SSH agent signing,))
$(eval $(call BuildPlugin,attr,File-based config attr,))
$(eval $(call BuildPlugin,attr-sql,SQL-based config attrib,+strongswan4-mod-sql))
$(eval $(call BuildPlugin,blowfish,Blowfish crypto,))
$(eval $(call BuildPlugin,constraints,X.509 constraint checking,))
$(eval $(call BuildPlugin,coupling,Peer certificate coupling,))
$(eval $(call BuildPlugin,curl,cURL,+PACKAGE_strongswan4-mod-curl:libcurl))
$(eval $(call BuildPlugin,des,DES crypto,))
$(eval $(call BuildPlugin,dhcp,DHCP-based IP and DNS,))
$(eval $(call BuildPlugin,dnskey,DNS RR key decoding,))
$(eval $(call BuildPlugin,duplicheck,Duplicate checking,))
$(eval $(call BuildPlugin,eap-md5,MD5 EAP (CHAP) auth,))
$(eval $(call BuildPlugin,eap-mschapv2,MS-CHAPv2 EAP auth,))
$(eval $(call BuildPlugin,eap-radius,RADIUS proxy auth,))
$(eval $(call BuildPlugin,farp,Fake arp respsonses,))
$(eval $(call BuildPlugin,fips-prf,FIPS PRF crypto,))
$(eval $(call BuildPlugin,gcrypt,libgcrypt,+PACKAGE_strongswan4-mod-gcrypt:libgcrypt))
$(eval $(call BuildPlugin,gmp,libgmp,+PACKAGE_strongswan4-mod-gmp:libgmp))
$(eval $(call BuildPlugin,hmac,HMAC crypto,))
$(eval $(call BuildPlugin,kernel-klips,KLIPS kernel interface,))
$(eval $(call BuildPlugin,kernel-netlink,netlink kernel interface,))
$(eval $(call BuildPlugin,kernel-pfkey,PK_KEY kernel interface,))
$(eval $(call BuildPlugin,ldap,LDAP,+PACKAGE_strongswan4-mod-ldap:libopenldap))
$(eval $(call BuildPlugin,led,LED blink on IKE activity,))
$(eval $(call BuildPlugin,load-tester,load testing,))
$(eval $(call BuildPlugin,md5,MD5 crypto,))
$(eval $(call BuildPlugin,medcli,mediation client configuration database,))
$(eval $(call BuildPlugin,medsrv,mediation server configuration database,))
$(eval $(call BuildPlugin,mysql,MySQL database interface,+strongswan4-mod-sql +PACKAGE_strongswan4-mod-mysql:libmysqlclient))
$(eval $(call BuildPlugin,padlock,VIA PadLock crypto,@TARGET_x86))
$(eval $(call BuildPlugin,pem,PEM decoding,))
$(eval $(call BuildPlugin,pgp,PGP key decoding,))
$(eval $(call BuildPlugin,pkcs1,PKCS1 key decoding,))
$(eval $(call BuildPlugin,pubkey,raw public key,))
$(eval $(call BuildPlugin,random,RNG,))
$(eval $(call BuildPlugin,resolve,DNS resolver,))
$(eval $(call BuildPlugin,revocation,X.509 revocation checking,))
$(eval $(call BuildPlugin,sha1,SHA1 crypto,))
$(eval $(call BuildPlugin,sha2,SHA2 crypto,))
$(eval $(call BuildPlugin,smp,SMP configuration and control interface,+PACKAGE_strongswan4-mod-smp:libxml2))
$(eval $(call BuildPlugin,socket-default,default socket for IKEv2,))
$(eval $(call BuildPlugin,socket-raw,RAW socket for IKEv1 and IKEv2,))
$(eval $(call BuildPlugin,sql,SQL database interface,))
$(eval $(call BuildPlugin,sqlite,SQLite database interface,+strongswan4-mod-sql +PACKAGE_strongswan4-mod-sqlite:libsqlite3))
$(eval $(call BuildPlugin,stroke,Stroke,))
$(eval $(call BuildPlugin,uci,UCI config interface,+PACKAGE_strongswan4-mod-uci:libuci))
$(eval $(call BuildPlugin,updown,updown firewall,))
$(eval $(call BuildPlugin,whitelist,Peer identity whitelisting,))
$(eval $(call BuildPlugin,x509,x509 certificate,))
$(eval $(call BuildPlugin,xauth,XAUTH authentication,))
$(eval $(call BuildPlugin,xcbc,xcbc crypto,))
