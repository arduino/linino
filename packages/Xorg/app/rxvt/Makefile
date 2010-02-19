#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=rxvt
PKG_RELEASE:=2
PKG_VERSION:=2.7.10

PKG_SOURCE_URL:=@SF/rxvt
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL:=1

#TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/rxvt
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=+libX11 +libXext +libXau +libXtst +imlib2
  TITLE:=rxvt
  URL:=http://rxvt.sourceforge.net
endef

define Package/rxvt/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share/applications $(1)/usr/share/icons
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/
	$(INSTALL_DATA) \
		./files/rxvt.desktop \
		$(1)/usr/share/applications/rxvt.desktop
	$(INSTALL_DATA) \
		./files/icon.png \
		$(1)/usr/share/icons/rxvt.png
endef

$(eval $(call BuildPackage,rxvt))
