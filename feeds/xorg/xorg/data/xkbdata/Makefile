#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xkbdata
PKG_RELEASE:=2
PKG_VERSION:=1.0.1

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/individual/data/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Xorg/$(PKG_NAME)-$(PKG_VERSION)/
PKG_MD5SUM:=9bf179be9a195953dc5f4c15e23ab7f0

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/xkbdata
  SECTION:=xorg-data
  CATEGORY:=Xorg
  SUBMENU:=data
  TITLE:=xkbdata
  DEPENDS:=+xkbcomp
  URL:=http://xorg.freedesktop.org/
endef

define Package/xkbdata/install
	$(INSTALL_DIR) $(1)/usr/share/X11/xkb/{rules,types,keycodes,geometry,compat,symbols}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/X11/xkb/rules/xorg \
		$(1)/usr/share/X11/xkb/rules/base
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/X11/xkb/rules/xorg.lst \
		$(1)/usr/share/X11/xkb/rules/base.lst

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/X11/xkb/types/* \
		$(1)/usr/share/X11/xkb/types/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/X11/xkb/keycodes/{aliases,xfree86} \
		$(1)/usr/share/X11/xkb/keycodes/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/X11/xkb/geometry/pc \
		$(1)/usr/share/X11/xkb/geometry/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/X11/xkb/compat/* \
		$(1)/usr/share/X11/xkb/compat/

	$(if $(filter y,$(CONFIG_TARGET_omap24xx_n810-gui)), \
		$(INSTALL_DIR) $(1)/usr/share/X11/xkb/symbols/nokia_vndr; \
		$(INSTALL_DATA) ./files/nokia_n810/rx-44 $(1)/usr/share/X11/xkb/symbols/nokia_vndr/; \
		$(INSTALL_DATA) ./files/nokia_n810/su-8w $(1)/usr/share/X11/xkb/symbols/nokia_vndr/; \
	)
endef

$(eval $(call BuildPackage,xkbdata))
