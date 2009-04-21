#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=cups
PKG_VERSION:=1.3.7
PKG_RELEASE:=4.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-source.tar.bz2
PKG_SOURCE_URL:= \
	http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/cups/$(PKG_VERSION) \
	ftp://ftp.easysw.com/pub/cups/$(PKG_VERSION) \
	ftp://ftp3.easysw.com/pub/cups/$(PKG_VERSION)
PKG_MD5SUM:=db4a45a17104f10f3ee599d88267c9e5

PKG_BUILD_DEPENDS:=zlib

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

include $(INCLUDE_DIR)/package.mk

define Package/cups
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+zlib +libpthread +libpng +libjpeg
  TITLE:=Common UNIX Printing System
  URL:=http://www.cups.org/
  SUBMENU:=printing
endef

define Package/cups/description
	A printer spooling system for devices with USB or LP support.
endef

define Package/cups/conffiles
/etc/cups/classes.conf
/etc/cups/client.conf
/etc/cups/cupsd.conf
/etc/cups/printers.conf
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-cups-user=root \
		--with-cups-group=root \
		--without-perl \
		--without-python \
		--without-php \
		--enable-shared \
		--disable-dbus \
		--disable-pam \
		--disable-slp \
		--disable-gnutls \
		--disable-openssl \
		--disable-cdsassl \
		--disable-ssl \
		--disable-gssapi \
		--disable-slp, \
		UNAME="Linux" \
		LIBS="-L$(STAGING_DIR)/usr/lib -lz -lpng -ljpeg" \
	)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		DSTROOT="$(PKG_INSTALL_DIR)" \
		STRIP="/bin/true" \
		all install
endef

define Package/cups/install
	rm -rf $(1)/etc/cups
	$(INSTALL_DIR) $(1)/etc/cups
	$(CP) $(PKG_INSTALL_DIR)/etc/cups/* $(1)/etc/cups/
	rm -rf $(1)/etc/cups/certs
	ln -sf /tmp $(1)/etc/cups/certs
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	rm -f $(1)/usr/bin/cups-config
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcups.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/cups $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/share/cups/templates
	$(CP) $(PKG_INSTALL_DIR)/usr/share/cups/templates/*.tmpl $(1)/usr/share/cups/templates/
	$(INSTALL_DIR) $(1)/usr/share/doc/cups
	$(CP) $(PKG_INSTALL_DIR)/usr/share/doc/cups/index.html $(1)/usr/share/doc/cups/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/doc/cups/*.css $(1)/usr/share/doc/cups/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/doc/cups/images $(1)/usr/share/doc/cups/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/sbin/{accept,cupsaddsmb,cupsctl,cupsd,cupsfilter,lpadmin,lpc,lpinfo,lpmove} \
		$(1)/usr/sbin/
	(cd $(1)/usr/sbin; ln -sf accept reject; ln -sf accept cupsenable; ln -sf accept cupsdisable;)
	# overwrite default config with our own
	$(CP) ./files/etc/cups/* $(1)/etc/cups/
	# install initscript with priority 60
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/cupsd.init $(1)/etc/init.d/cupsd
endef

define Build/InstallDev
	$(INSTALL_DIR) $(2)/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/cups-config $(2)/bin/
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/cups $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcups.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,cups))
