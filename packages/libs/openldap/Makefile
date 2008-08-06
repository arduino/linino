# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=openldap
PKG_VERSION:=2.2.29
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/ \
	ftp://sunsite.cnlab-switch.ch/mirror/OpenLDAP/openldap-release/ \
	ftp://ftp.nl.uu.net/pub/unix/db/openldap/openldap-release/ \
	ftp://ftp.plig.org/pub/OpenLDAP/openldap-release/
PKG_MD5SUM:=6c4c72a1336aa45b463e738034c078d6

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/openldap/Default
  TITLE:=LDAP implementation
  URL:=http://www.openldap.org/
endef

define Package/libopenldap
  $(call Package/openldap/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libopenssl +libsasl2
  TITLE+= (libraries)
endef

define Package/libopenldap/description
=
	OpenLDAP Software is an open source implementation of the 
	Lightweight Directory Access Protocol (LDAP).	
	This package contains the shared LDAP client libraries, needed by other programs.
endef

define Package/libopenldap/conffiles
/etc/openldap/ldap.conf
endef

define Package/openldap-utils
  $(call Package/openldap/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libopenldap
  TITLE+= (utilities)
endef

define Package/openldap-utils/description
=
	OpenLDAP Software is an open source implementation of the 
	Lightweight Directory Access Protocol (LDAP).	
	This package contains client programs required to access LDAP servers.
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-debug \
	--enable-dynamic \
	--enable-syslog \
	--disable-local \
	--disable-slapd \
	--disable-slurpd \
	--with-cyrus-sasl \
	--without-fetch \
	--with-threads \
	--with-tls \
	--with-yielding_select="yes" \
	--without-cyrus-sasl \
	--without-threads \
	--without-tls 


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		HOSTCC="$(HOSTCC)" \
		depend all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/{lber,ldap}*.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{lber,ldap}*.{a,so*} $(1)/usr/lib/
endef

define Package/libopenldap/install
	$(INSTALL_DIR) $(1)/etc/openldap
	$(CP) $(PKG_INSTALL_DIR)/etc/openldap/ldap.conf $(1)/etc/openldap/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{lber,ldap}*.so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/share/openldap
	$(CP) $(PKG_INSTALL_DIR)/usr/share/openldap/* $(1)/usr/share/openldap/
endef
	
define Package/openldap-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ldap* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,libopenldap))
$(eval $(call BuildPackage,openldap-utils))
