#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=matchbox-keyboard
PKG_REV:=2111
PKG_VERSION:=svn$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE:=matchbox-keyboard-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://svn.o-hand.com/repos/matchbox/trunk/matchbox-keyboard
PKG_SOURCE_PROTO:=svn
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/matchbox-keyboard
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=matchbox-keyboard
  MAINTAINER:=Michael Buesch <mb@bu3sch.de>
  URL:=http://matchbox-project.org/?p=1
  DEPENDS:=+libfakekey +cairo +gtk2 +libexpat
endef

define Package/matchbox-keyboard/description
  Virtual keyboard
endef

EXTRA_LDFLAGS:=\
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/matchbox-keyboard/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share $(1)/usr/share/applications \
		$(1)/usr/share/matchbox-keyboard $(1)/usr/share/pixmaps
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/inputmethods/matchbox-keyboard.desktop \
		$(1)/usr/share/applications/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/matchbox-keyboard/* \
		$(1)/usr/share/matchbox-keyboard/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pixmaps/* \
		$(1)/usr/share/pixmaps/
endef

$(eval $(call BuildPackage,matchbox-keyboard))
