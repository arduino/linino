# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=radiusclient-ng
PKG_VERSION:=0.5.2
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.berlios.de/radiusclient-ng/
PKG_MD5SUM:=c54eb70e964bdd22dd44b39a9b4df8ca
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libradiusclient-ng
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A RADIUS client library
  DESCRIPTION:=A RADIUS client library.\\\
    Purpose of this project is to build a portable, easy-to-use and standard \\\
    compliant library suitable for developing free and commercial software \\\
    that need support for RADIUS protocol (RFCs 2128 and 2139).\\\
    \\\
    This package contains shared libraries, needed by other programs.
  URL:=http://developer.berlios.de/projects/radiusclient-ng/
endef

define Package/libradiusclient-ng/conffiles
/etc/radiusclient-ng/issue
/etc/radiusclient-ng/port-id-map
/etc/radiusclient-ng/radiusclient.conf
/etc/radiusclient-ng/servers
endef


define Package/radiusclient-ng
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=libradiusclient-ng
  TITLE:=A RADIUS client
  DESCRIPTION:=A RADIUS client.\\\
    Purpose of this project is to build a portable, easy-to-use and standard \\\
    compliant library suitable for developing free and commercial software \\\
    that need support for RADIUS protocol (RFCs 2128 and 2139).\\\
    \\\
    This package contains a RADIUS client.
  URL:=http://www.balabit.com/products/syslog_ng/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		ac_cv_func_getdomainname=yes \
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
			--enable-shared \
			--enable-static \
			--disable-rpath \
			--with-gnu-ld \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libradiusclient-ng/install
	install -d -m0755 $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/etc/radiusclient-ng $(1)/etc/
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libradiusclient-ng.so.* $(1)/usr/lib/
endef

define Package/radiusclient-ng/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/rad{acct,iusclient,login,status} $(1)/usr/sbin/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/radiusclient-ng.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libradiusclient-ng.{a,so}* $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/radiusclient-ng.h \
		$(STAGING_DIR)/usr/lib/libradiusclient-ng.{a,so}*
endef

$(eval $(call BuildPackage,libradiusclient-ng))
$(eval $(call BuildPackage,radiusclient-ng))
