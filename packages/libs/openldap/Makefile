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

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/ \
	ftp://sunsite.cnlab-switch.ch/mirror/OpenLDAP/openldap-release/ \
	ftp://ftp.nl.uu.net/pub/unix/db/openldap/openldap-release/ \
	ftp://ftp.plig.org/pub/OpenLDAP/openldap-release/
PKG_MD5SUM:=6c4c72a1336aa45b463e738034c078d6
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

PKG_CONFIGURE_OPTIONS = \
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

include $(INCLUDE_DIR)/package.mk

define Package/libopenldap
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libopenssl +libsasl2
  TITLE:=LDAP client libraries
  DESCRIPTION:=LDAP (Lightweight Directory Access Protocol) client libraries.\\\
    OpenLDAP Software is an open source implementation of the \\\
    Lightweight Directory Access Protocol (LDAP).\\\
    \\\
    This package contains the shared LDAP client libraries, needed by other \\\
    programs.
  URL:=http://www.openldap.org/
endef

define Package/libopenldap/conffiles
/etc/openldap/ldap.conf
endef

define Package/openldap-utils
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=libopenldap
  TITLE:=LDAP client utilities
  DESCRIPTION:=LDAP (Lightweight Directory Access Protocol) client utilities.\\\
    OpenLDAP Software is an open source implementation of the \\\
    Lightweight Directory Access Protocol (LDAP).\\\
    \\\
    This package contains client programs required to access LDAP servers.
  URL:=http://www.openldap.org/
endef

define Build/Configure
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		./configure \
			--target=$(GNU_HOST_NAME) \
			--host=$(GNU_HOST_NAME) \
			--build=$(GNU_HOST_NAME) \
			--program-prefix="" \
			--program-suffix="" \
			--prefix=/usr \
			--exec-prefix=/usr \
			--bindir=/usr/bin \
			--datadir=/usr/share \
			--includedir=/usr/include \
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			$(PKG_CONFIGURE_OPTIONS) \
			--without-cyrus-sasl \
			--without-threads \
			--without-tls \
	);
	$(MAKE) -C $(PKG_BUILD_DIR) depend 
	$(MAKE) -C $(PKG_BUILD_DIR)/libraries/liblutil
	$(MAKE) -C $(PKG_BUILD_DIR)/libraries/liblber
	$(MAKE) -C $(PKG_BUILD_DIR)/libraries/liblunicode
	$(MAKE) -C $(PKG_BUILD_DIR)/libraries/liblber clean
	$(MAKE) -C $(PKG_BUILD_DIR)/libraries/liblutil clean
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib " \
		ac_cv_func_memcmp_clean="yes" \
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
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			$(PKG_CONFIGURE_OPTIONS) \
	);
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libopenldap/install
	install -m0755 -d $(1)/etc/openldap
	$(CP) $(PKG_INSTALL_DIR)/etc/openldap/ldap.conf $(1)/etc/openldap/
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{lber,ldap}*.so.* $(1)/usr/lib/
	install -m0755 -d $(1)/usr/share/openldap
	$(CP) $(PKG_INSTALL_DIR)/usr/share/openldap/* $(1)/usr/share/openldap/
endef
	
define Package/openldap-utils/install
	install -m0755 -d $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ldap* $(1)/usr/bin/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/{lber,ldap}*.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{lber,ldap}*.{a,so*} $(STAGING_DIR)/usr/lib/
endef
	
define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/{lber,ldap}*.h \
		$(STAGING_DIR)/usr/lib/lib{lber,ldap}*.{a,so*}
endef

$(eval $(call BuildPackage,libopenldap))
$(eval $(call BuildPackage,openldap-utils))
