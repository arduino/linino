#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=snort
PKG_VERSION:=2.8.4.1
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://dl.snort.org/snort-current/
PKG_MD5SUM:=63f4e76ae96a2d133f4c7b741bad5458

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)
PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

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
  VARIANT:=basic
endef

define Package/snort/description
  $(call Package/snort/Default/description)
endef

define Package/snort-mysql
  $(call Package/snort/Default)
  DEPENDS+= +libmysqlclient
  TITLE+= (MySQL)
  VARIANT:=mysql
endef

define Package/snort-mysql/description
  $(call Package/snort/Default/description)
  This package contains snort with support for logging to a MySQL database.
endef

define Package/snort-pgsql
  $(call Package/snort/Default)
  DEPENDS+= +libpq
  TITLE+= (PostgreSQL)
  VARIANT:=pgsql
endef

define Package/snort-pgsql/description
  $(call Package/snort/Default/description)
  This package contains snort with support for logging to a PostgreSQL database.
endef


CONFIGURE_ARGS += \
	--enable-flexresp \
	--with-libnet-includes="$(STAGING_DIR)/usr/lib/libnet-1.0.x/include" \
	--with-libnet-libraries="$(STAGING_DIR)/usr/lib/libnet-1.0.x/lib" \
	--with-libpcap-includes="$(STAGING_DIR)/usr/include" \
	--with-libpcap-libraries="$(STAGING_DIR)/usr/lib" \
	--with-libpcre-includes="$(STAGING_DIR)/usr/include" \
	--with-libpcre-libraries="$(STAGING_DIR)/usr/lib" \

CONFIGURE_VARS += \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/mysql" \
	LDFLAGS="$$$$LDFLAGS -L$(STAGING_DIR)/usr/lib/mysql" \
	PATH="$(STAGING_DIR)/usr/lib/libnet-1.0.x/bin:$$$$PATH" \

MAKE_FLAGS += \
	extra_incl="" \

ifeq ($(BUILD_VARIANT),basic)

  CONFIGURE_ARGS += \
	--without-mysql \
	--without-postgresql \

endif
ifeq ($(BUILD_VARIANT),mysql)

  CONFIGURE_ARGS += \
	--with-mysql="$(STAGING_DIR)/usr" \
	--without-postgresql \

endif
ifeq ($(BUILD_VARIANT),pgsql)

  CONFIGURE_ARGS += \
	--without-mysql \
	--with-postgresql="$(STAGING_DIR)/usr" \

endif


define Package/snort/conffiles
/etc/default/snort
/etc/snort/snort.conf
/etc/snort/threshold.conf
endef

define Package/snort/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/snort $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/snort_dynamicengine
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/snort_dynamicengine/libsf_engine.so* $(1)/usr/lib/snort_dynamicengine/
	$(INSTALL_DIR) $(1)/usr/lib/snort_dynamicpreprocessor
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/snort_dynamicpreprocessor/libsf_{dce2,dcerpc,dns,ftptelnet,smtp,ssh,ssl}_preproc.so* $(1)/usr/lib/snort_dynamicpreprocessor/
	$(INSTALL_DIR) $(1)/etc/snort
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/snort.conf $(1)/etc/snort/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/classification.config $(1)/etc/snort/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/gen-msg.map $(1)/etc/snort/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/reference.config $(1)/etc/snort/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/sid-msg.map $(1)/etc/snort/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/threshold.conf $(1)/etc/snort/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/unicode.map $(1)/etc/snort/
	$(INSTALL_DIR) $(1)/etc/snort/preproc_rules
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/preproc_rules/*.rules $(1)/etc/snort/preproc_rules/
	$(INSTALL_DIR) $(1)/etc/snort/rules
	$(INSTALL_DATA) ./files/snort.local.rules $(1)/etc/snort/rules/local.rules
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_DATA) ./files/snort.default $(1)/etc/default/snort
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/snort.init $(1)/etc/init.d/snort
endef

Package/snort-mysql/conffiles = $(Package/snort/conffiles)
Package/snort-mysql/install = $(Package/snort/install)

Package/snort-pgsql/conffiles = $(Package/snort/conffiles)
Package/snort-pgsql/install = $(Package/snort/install)

$(eval $(call BuildPackage,snort))
$(eval $(call BuildPackage,snort-mysql))
$(eval $(call BuildPackage,snort-pgsql))
