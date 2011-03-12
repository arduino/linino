#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=snort
PKG_VERSION:=2.8.4.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://dl.snort.org/snort-current/
PKG_MD5SUM:=63f4e76ae96a2d133f4c7b741bad5458

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/snort/Default
  SUBMENU:=Firewall
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libnet0 +libpcap +libpcre
  TITLE:=Lightweight Network Intrusion Detection System
  URL:=http://www.snort.org/
endef

define Package/snort/Default/description
  Snort is an open source network intrusion detection and prevention system.
  It is capable of performing real-time traffic analysis, alerting, blocking
  and packet logging on IP networks.  It utilizes a combination of protocol
  analysis and pattern matching in order to detect anomalies, misuse and
  attacks.
endef

define Package/snort
  $(call Package/snort/Default)
endef

define Package/snort/description
  $(call Package/snort/Default/description)
endef

define Package/snort-mysql
  $(call Package/snort/Default)
  DEPENDS+= +libmysqlclient
  TITLE+= (MySQL)
endef

define Package/snort-mysql/description
  $(call Package/snort/Default/description)
  This package contains snort with support for logging to a MySQL database.
endef

define Package/snort-pgsql
  $(call Package/snort/Default)
  DEPENDS+= +libpq
  TITLE+= (PostgreSQL)
endef

define Package/snort-pgsql/description
  $(call Package/snort/Default/description)
  This package contains snort with support for logging to a PostgreSQL database.
endef

define Compile/Template

$(PKG_BUILD_DIR)/snort$(1): $(STAMP_CONFIGURED)
	touch -r $(PKG_BUILD_DIR)/Makefile.am $(PKG_BUILD_DIR)/configure.in 
	touch -r $(PKG_BUILD_DIR)/Makefile.in $(PKG_BUILD_DIR)/configure
	-$(MAKE) -C $(PKG_BUILD_DIR) distclean
	$(call Build/Configure/Default, \
		--enable-flexresp \
		--with-libnet-includes="$(STAGING_DIR)/usr/lib/libnet-1.0.x/include" \
		--with-libnet-libraries="$(STAGING_DIR)/usr/lib/libnet-1.0.x/lib" \
		--with-libpcap-includes="$(STAGING_DIR)/usr/include" \
		--with-libpcap-libraries="$(STAGING_DIR)/usr/lib" \
		--with-libpcre-includes="$(STAGING_DIR)/usr/include" \
		--with-libpcre-libraries="$(STAGING_DIR)/usr/lib" \
		$(2) \
		, \
		CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/mysql" \
		LDFLAGS="$$$$LDFLAGS -L$(STAGING_DIR)/usr/lib/mysql" \
		PATH="$(STAGING_DIR)/usr/lib/libnet-1.0.x/bin:$$$$PATH" \
		$(3) \
	);
	$(MAKE) -C $(PKG_BUILD_DIR) \
		extra_incl="" \
		all
	mv $(PKG_BUILD_DIR)/src/snort $(PKG_BUILD_DIR)/snort$(1)

$(PKG_BUILD_DIR)/.built: $(PKG_BUILD_DIR)/snort$(1)

endef


define Install/Template

define Package/snort$(1)/conffiles
/etc/default/snort
/etc/snort/snort.conf
/etc/snort/threshold.conf
endef

define Package/snort$(1)/install
	$(INSTALL_DIR) $$(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/snort$(1) $$(1)/usr/sbin/snort
	$(INSTALL_DIR) $$(1)/etc/snort
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/snort.conf $$(1)/etc/snort/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/classification.config $$(1)/etc/snort/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/gen-msg.map $$(1)/etc/snort/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/reference.config $$(1)/etc/snort/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/sid-msg.map $$(1)/etc/snort/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/threshold.conf $$(1)/etc/snort/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/unicode.map $$(1)/etc/snort/
	$(INSTALL_DIR) $$(1)/etc/default
	$(INSTALL_DATA) ./files/snort.default $$(1)/etc/default/snort
	$(INSTALL_DIR) $$(1)/etc/init.d
	$(INSTALL_BIN) ./files/snort.init $$(1)/etc/init.d/snort
endef

endef


ifneq ($(SDK)$(CONFIG_PACKAGE_snort),)
  define Compile/snort
    $(call Compile/Template,, \
		--without-mysql \
		--without-postgresql \
    )
    $(call Install/Template,)
  endef
endif
$(eval $(Compile/snort))

ifneq ($(SDK)$(CONFIG_PACKAGE_snort-mysql),)
  define Compile/snort-mysql
    $(call Compile/Template,-mysql, \
		--with-mysql="$(STAGING_DIR)/usr" \
		--without-postgresql \
    )
    $(call Install/Template,-mysql)
  endef
endif
$(eval $(Compile/snort-mysql))


ifneq ($(SDK)$(CONFIG_PACKAGE_snort-pgsql),)
  define Compile/snort-pgsql
    $(call Compile/Template,-pgsql, \
		--without-mysql \
		--with-postgresql="$(STAGING_DIR)/usr" \
    )
    $(call Install/Template,-pgsql)
  endef
endif
$(eval $(Compile/snort-pgsql))

define Build/Configure
endef

define Build/Compile
endef

$(eval $(call BuildPackage,snort))
$(eval $(call BuildPackage,snort-mysql))
$(eval $(call BuildPackage,snort-pgsql))
