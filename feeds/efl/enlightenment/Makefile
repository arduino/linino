# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12228 2008-08-06 22:43:15Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=enlightenment
PKG_REV:=40853
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://svn.enlightenment.org/svn/e/trunk/e
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

PKG_BUILD_DEPENDS:=edje/host eet/host

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/enlightenment
  SECTION:=xorg-wm
  CATEGORY:=Xorg
  SUBMENU:=window manager
  TITLE:=Enlightenment e17 window manager
  URL:=http://enlightenment.org
  DEPENDS:=+libintl +eet +evas +ecore +edje +efreet +dbus +edbus +dejavu-fonts-ttf +freedesktop-compliant
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

TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include
TARGET_LDFLAGS+=-lintl -L$(STAGING_DIR)/usr/lib/libintl/lib

define Build/Configure
	( cd $(PKG_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Build/Configure/Default, \
		--disable-pam \
		--disable-simple-x11 \
		--disable-nls \
		--disable-rpath \
		--enable-files \
		--enable-ibar \
		--disable-dropshadow \
		--enable-clock \
		--enable-pager \
		--enable-battery \
		--enable-temperature \
		--disable-cpufreq \
		--enable-ibox \
		--enable-start \
		--enable-exebuf \
		--enable-winlist \
		--enable-fileman \
		--enable-fileman-opinfo \
		--disable-wizard \
		--disable-msgbus-lang \
		--enable-gadman \
		--enable-mixer \
		--disable-connman \
		--enable-illume \
		--enable-syscon \
		--with-x \
		--with-edje-cc=$(STAGING_DIR_HOST)/bin/edje_cc \
		--with-eet-eet=$(STAGING_DIR_HOST)/bin/eet \
	)
endef

PROFILES:=\
	illume \
	minimalist \
	netbook \
	scalable \
	standard \

define Build/Compile
	DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE) -C $(PKG_BUILD_DIR) all install
	$(foreach c, $(PROFILES), \
		! [ -f ./files/config/$(c).cfg.src ] || $(STAGING_DIR_HOST)/bin/eet -e $(PKG_INSTALL_DIR)/usr/share/enlightenment/data/config/$(c)/e.cfg config ./files/config/$(c).cfg.src 1
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/* $(1)/usr/share/
endef

define Package/enlightenment/install
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/bin $(1)/usr/share $(1)/etc/uci-defaults
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/* $(1)/usr/share/
	$(CP) $(PKG_INSTALL_DIR)/etc/* $(1)/etc/
	$(foreach c, $(PROFILES), \
		$(if $(CONFIG_E17_$(c)), \
			$(INSTALL_DATA) ./files/uci-defaults/x11_$(c) $(1)/etc/uci-defaults/
		)
	)
	$(FIND) $(1)/ -name "*.la" | $(XARGS) rm
	$(FIND) $(1)/ -name "*.a" | $(XARGS) rm
endef

define Package/enlightenment/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] && exit
. /etc/functions.sh
uci_apply_defaults
endef

$(eval $(call BuildPackage,enlightenment))
