#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ulogd
PKG_VERSION:=1.24
PKG_RELEASE:=1
PKG_MD5SUM:=05b4ed2926b9a22aaeaf642917bbf8ff

PKG_SOURCE_URL:=ftp://ftp.netfilter.org/pub/ulogd/ \
	ftp://ftp.be.netfilter.org/pub/netfilter/ulogd/ \
	ftp://ftp.de.netfilter.org/pub/netfilter/ulogd/ \
	ftp://ftp.no.netfilter.org/pub/netfilter/ulogd/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

define Package/ulogd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+iptables
  MENU:=1
  TITLE:=Netfilter userspace logging daemon
  DESCRIPTION:=The netfilter userspace logging daemon\\\
  URL:=http://gnumonks.org/projects/ulogd
endef

define Package/ulogd/conffiles
/etc/default/ulogd
/etc/ulogd.conf
endef

define Package/ulogd-mod-mysql
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=ulogd +libmysqlclient
  TITLE:=Output plugin for logging into a MySQL database
endef

define Package/ulogd-mod-pcap
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=ulogd +libpcap
  TITLE:=Output plugin for logging into pcap format
endef

define Package/ulogd-mod-pgsql
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=ulogd +libpq
  TITLE:=Output plugin for logging into a PostgreSQL database
endef

define Package/ulogd-mod-sqlite
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=ulogd +libsqlite3
  TITLE:=Output plugin for logging into an SQLite database
endef

define Package/ulogd-mod-extra
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=ulogd
  TITLE:=All other plugins
endef

include $(INCLUDE_DIR)/package.mk

ifneq ($(Package/ulogd-mod-mysql),)
ULOGD_MYSQL_OPTION:=--with-mysql=$(STAGING_DIR)/usr
endif

ifneq ($(Package/ulogd-mod-pcap),)
ULOGD_PCAP_HEADER:=yes
else
ULOGD_PCAP_HEADER:=no
endif

ifneq ($(Package/ulogd-mod-pgsql),)
ULOGD_PGSQL_OPTION:=--with-pgsql=$(STAGING_DIR)/usr
endif

ifneq ($(Package/ulogd-mod-sqlite),)
ULOGD_SQLITE_OPTION:=--with-sqlite3=$(STAGING_DIR)/usr
endif

define Build/Configure
$(call Build/Configure/Default,--enable-shared \
			--disable-static \
			$(ULOGD_MYSQL_OPTION) \
			$(ULOGD_PGSQL_OPTION) \
			$(ULOGD_SQLITE_OPTION),ac_cv_header_pcap_h=$(ULOGD_PCAP_HEADER))
endef

define Build/Compile
$(call Build/Compile/Default,DESTDIR="$(PKG_INSTALL_DIR)" \
		STAGING_DIR=$(STAGING_DIR) \
		all install)
endef

define Package/ulogd/install	
	install -d -m0755 $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/etc/ulogd.conf $(1)/etc/
	install -d -m0755 $(1)/etc/default
	install -m0644 ./files/ulogd.default $(1)/etc/default/ulogd
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/ulogd.init $(1)/etc/init.d/ulogd
	ln -sf ulogd $(1)/etc/init.d/S49ulogd
	install -d -m0755 $(1)/usr/lib/ulogd
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ulogd/ulogd_BASE.so $(1)/usr/lib/ulogd/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/ulogd $(1)/usr/sbin/
endef

define BuildPlugin
  define Package/$(1)/install
	install -m0755 -d $$(1)/usr/lib/ulogd
	for m in $(2); do \
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/ulogd/ulogd_$$$$$$$${m}.so $$(1)/usr/lib/ulogd/ ; \
	done
  endef

  $$(eval $$(call BuildPackage,$(1)))
endef

$(eval $(call BuildPackage,ulogd))
$(eval $(call BuildPlugin,ulogd-mod-mysql,MYSQL))
$(eval $(call BuildPlugin,ulogd-mod-pcap,PCAP))
$(eval $(call BuildPlugin,ulogd-mod-pgsql,PGSQL))
$(eval $(call BuildPlugin,ulogd-mod-sqlite,SQLITE3))
$(eval $(call BuildPlugin,ulogd-mod-extra,LOCAL LOGEMU OPRINT PWSNIFF SYSLOG))
