# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12228 2008-08-06 22:43:15Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=enlightenment
PKG_REV:=38886
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://svn.enlightenment.org/svn/e/trunk/e
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/enlightenment
  SECTION:=xorg-wm
  CATEGORY:=Xorg
  SUBMENU:=window manager
  TITLE:=Enlightenment e17 window manager
  URL:=http://enlightenment.org
  DEPENDS:=+libintl +libpthread +eet +evas +ecore +edje +efreet +dbus +edbus +dejavu-fonts-ttf +freedesktop-compliant
endef

define Package/enlightenment/config
	menu "Configuration"
	depends on PACKAGE_enlightenment
	source "$(SOURCE)/Config.in"
	endmenu
endef

define Package/enlightenment/description
   Enlightenment is a window manager. Enlightenment is a desktop shell. Enlightenment is the building blocks to create beautiful applications. Enlightenment, or simply e, is a group of people trying to make a new generation of software.
endef

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include
EXTRA_LDFLAGS+=-lintl -L$(STAGING_DIR)/usr/lib/libintl/lib -Wl,-rpath-link=$(STAGING_DIR)/usr/lib 

define Build/Configure
	(cd $(PKG_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Build/Configure/Default, --with-edje-cc=$(STAGING_DIR_HOST)/usr/bin/edje_cc  --with-eet-eet=$(STAGING_DIR_HOST)/usr/bin/eet)
endef

define Build/Compile
	mkdir -p $(STAGING_DIR_HOST)/usr/bin
	# let's see who is workarounding the edje[_cc]/eet-issue most dirrty ^^
	ln -sf `which edje_cc` $(STAGING_DIR_HOST)/usr/bin/
	ln -sf `which eet` $(STAGING_DIR_HOST)/usr/bin/
	DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE) -C $(PKG_BUILD_DIR) all install
	rm -f $(STAGING_DIR_HOST)/usr/bin/{edje_cc,eet}
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib $(1)/usr/bin $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/* $(1)/usr/share/
endef

define Package/enlightenment/install
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/bin $(1)/usr/share $(1)/etc/uci-defaults
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/* $(1)/usr/share/
	$(INSTALL_DATA) ./files/uci-defaults/x11 $(1)/etc/uci-defaults/
	$(if $(CONFIG_E17_ILLUME),echo -n "illume" >> $(1)/etc/uci-defaults/x11)
	$(if $(CONFIG_E17_MINIMALIST),echo -n "minimalist" >> $(1)/etc/uci-defaults/x11)
	$(if $(CONFIG_E17_NETBOOK),echo -n "netbook" >> $(1)/etc/uci-defaults/x11)
	$(if $(CONFIG_E17_SCALEABLE),echo -n "scaleable" >> $(1)/etc/uci-defaults/x11)
	$(if $(CONFIG_E17_STANDARD),echo -n "standard" >> $(1)/etc/uci-defaults/x11)
	echo "'" >> $(1)/etc/uci-defaults/x11
	find $(1)/ -name *.la | xargs rm -f
	find $(1)/ -name *.a | xargs rm -f
endef

define Package/enlightenment/postinst
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit
	. /etc/functions.sh
	uci_apply_defaults
endef

$(eval $(call BuildPackage,enlightenment))
$(eval $(call RequireCommand,edje_cc, \
	Command <edje_cc> not found - please install edje with edje-cc enabled \
))
$(eval $(call RequireCommand,eet, \
	Command <eet> not found - please install eet \
))
