#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=xdm
PKG_VERSION:=1.1.8
PKG_RELEASE:=2

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/individual/app
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/xdm
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=+libX11 +libXmu +libXau +libXaw
  TITLE:=xdm
  URL:=http://xorg.freedesktop.org/
endef

TARGET_LDFLAGS+=\
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Build/Configure
	$(call Build/Configure/Default, \
		--without-pam \
		--with-random-device=/dev/urandom \
		--disable-dynamic-greeter \
		--disable-xprint \
	)
endef

define Package/xdm/install
	$(INSTALL_DIR) $(1)/usr/{bin,lib/X11/xdm,share/X11/app-defaults}
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/X11/xdm/{X*,chooser,GiveConsole,TakeConsole,xdm-config,pixmaps} \
		$(1)/usr/lib/X11/xdm/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/X11/app-defaults/* \
		$(1)/usr/share/X11/app-defaults/
endef

$(eval $(call BuildPackage,xdm))
