# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=cups
PKG_VERSION:=1.1.23
PKG_RELEASE:=1
PKG_MD5SUM:=4ce09b1dce09b6b9398af0daae9adf63

PKG_SOURCE_URL:=http://ftp.funet.fi/pub/mirrors/ftp.easysw.com/ftp.easysw.com/pub/cups/$(PKG_VERSION) \
	http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/cups/$(PKG_VERSION) \
	ftp://ftp3.easysw.com/pub/cups/$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-source.tar.bz2
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

PKG_BUILDDEP:=zlib

include $(INCLUDE_DIR)/package.mk

define Package/cups
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+zlib
  TITLE:=Common UNIX Printing System
  DESCRIPTION:=A printer spooling system for devices with USB or LP support
  URL:=http://www.cups.org/
endef

define Package/cups/conffiles
/etc/cups/classes.conf
/etc/cups/client.conf
/etc/cups/cupsd.conf
/etc/cups/printers.conf
endef

define Build/Configure
$(call Build/Configure/Default, --with-gnu-ld \
--with-cups-user=root \
--with-cups-group=root \
--without-perl \
--without-python \
--without-php \
--disable-slp \
--disable-gnutls \
--disable-openssl \
--disable-cdsassl \
--disable-ssl \
--disable-slp \
)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DSTROOT="$(PKG_INSTALL_DIR)" \
		STRIP="/bin/true" \
		all install
endef

define Package/cups/install
	rm -rf $(1)/etc/cups
	install -d -m0755 $(1)/etc/cups
	$(CP) $(PKG_INSTALL_DIR)/etc/cups/* $(1)/etc/cups/
	rm -rf $(1)/etc/cups/certs
	ln -sf /tmp $(1)/etc/cups/certs
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	rm -f $(1)/usr/bin/cups-config
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcups.so.* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/cups $(1)/usr/lib/
	install -d -m0755 $(1)/usr/share/cups/templates
	$(CP) $(PKG_INSTALL_DIR)/usr/share/cups/templates/*.tmpl $(1)/usr/share/cups/templates/
	install -d -m0755 $(1)/usr/share/doc/cups
	$(CP) $(PKG_INSTALL_DIR)/usr/share/doc/cups/index.html $(1)/usr/share/doc/cups/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/doc/cups/images $(1)/usr/share/doc/cups/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/* $(1)/usr/sbin/
	# overwrite default config with our own
	$(CP) ./files/etc/cups/* $(1)/etc/cups/
	# install initscript with priority 60
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/cupsd.init $(1)/etc/init.d/S60cupsd
	find $(1) -name CVS | xargs rm -rf
	$(RSTRIP) $(1)
	$(IPKG_BUILD) $(1) $(PACKAGE_DIR)
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/cups-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/cups $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcups.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
	  $(STAGING_DIR)/usr/bin/cups-config \
	  $(STAGING_DIR)/usr/include/cups \
	  $(STAGING_DIR)/usr/lib/libcups.{a,so*}
endef

$(eval $(call BuildPackage,cups))
