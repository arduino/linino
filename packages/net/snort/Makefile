# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=snort
PKG_VERSION:=2.4.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.snort.org/dl/current/
PKG_MD5SUM:=9dc9060d1f2e248663eceffadfc45e7e
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/snort/Default
  SUBMENU:=snort (Ligthweight Network Intrusion Detection System)
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libnet0 +libpcap +libpcre
  TITLE:=Ligthweight Network Intrusion Detection System
  URL:=http://www.snort.org/
endef

define Package/snort
  $(call Package/snort/Default)
endef

define Package/snort-mysql
  $(call Package/snort/Default)
  DEPENDS+= +libmysqlclient
  TITLE+= (MySQL)
endef

define Package/snort-pgsql
  $(call Package/snort/Default)
  DEPENDS+= +libpq
  TITLE+= (PostgreSQL)
endef


ifneq ($(SDK),)
  CONFIG_PACKAGE_snort:=m
  CONFIG_PACKAGE_snort-mysql:=m
  CONFIG_PACKAGE_snort-pgsql:=m
endif

define Compile/Template

$(PKG_BUILD_DIR)/snort-$(1): $(PKG_BUILD_DIR)/.configured
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
	mv $(PKG_BUILD_DIR)/src/snort $(PKG_BUILD_DIR)/snort-$(1)

$(PKG_BUILD_DIR)/.built: $(PKG_BUILD_DIR)/snort-$(1)

endef


define Install/Template

define Package/$(1)/conffiles
/etc/default/snort
/etc/snort/snort.conf
/etc/snort/threshold.conf
endef

define Package/$(1)/install
	install -d -m0755 $$(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/snort-$(2) $$(1)/usr/sbin/snort
	install -d -m0755 $$(1)/etc/snort
	install -m0644 $(PKG_BUILD_DIR)/etc/snort.conf $$(1)/etc/snort/
	install -m0644 $(PKG_BUILD_DIR)/etc/classification.config $$(1)/etc/snort/
	install -m0644 $(PKG_BUILD_DIR)/etc/gen-msg.map $$(1)/etc/snort/
	install -m0644 $(PKG_BUILD_DIR)/etc/reference.config $$(1)/etc/snort/
	install -m0644 $(PKG_BUILD_DIR)/etc/sid-msg.map $$(1)/etc/snort/
	install -m0644 $(PKG_BUILD_DIR)/etc/threshold.conf $$(1)/etc/snort/
	install -m0644 $(PKG_BUILD_DIR)/etc/unicode.map $$(1)/etc/snort/
	install -d -m0755 $$(1)/etc/default
	install -m0644 ./files/snort.default $$(1)/etc/default/snort
	install -d -m0755 $$(1)/etc/init.d
	install -m0755 ./files/snort.init $$(1)/etc/init.d/snort
endef

endef


ifneq ($(CONFIG_PACKAGE_snort),)
  $(eval $(call Compile/Template,basic, \
		--without-mysql \
		--without-postgresql \
  ))
  $(eval $(call Install/Template,snort,basic))
endif
ifneq ($(CONFIG_PACKAGE_snort-mysql),)
  $(eval $(call Compile/Template,mysql, \
		--with-mysql="$(STAGING_DIR)/usr" \
		--without-postgresql \
  ))
  $(eval $(call Install/Template,snort-mysql,mysql))
endif
ifneq ($(CONFIG_PACKAGE_snort-pgsql),)
  $(eval $(call Compile/Template,pgsql, \
		--without-mysql \
		--with-postgresql="$(STAGING_DIR)/usr" \
  ))
  $(eval $(call Install/Template,snort-pgsql,pgsql))
endif

define Build/Configure
endef

define Build/Compile
endef

$(eval $(call BuildPackage,snort))
$(eval $(call BuildPackage,snort-mysql))
$(eval $(call BuildPackage,snort-pgsql))
