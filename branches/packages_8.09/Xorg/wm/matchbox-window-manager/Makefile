#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=matchbox-window-manager
PKG_VERSION:=1.2
PKG_RELEASE:=1.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://matchbox-project.org/sources/$(PKG_NAME)/$(PKG_VERSION)
PKG_FIXUP:=libtool

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib/libiconv/lib \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib/libintl/lib

include $(INCLUDE_DIR)/package.mk

define Package/matchbox-window-manager
  TITLE:=matchbox window manager
  SECTION:=xorg-wm
  CATEGORY:=Xorg
  SUBMENU:=window manager
  DEPENDS:=+libX11 +zlib +libfreetype +fontconfig +libmatchbox
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR=$(PKG_INSTALL_DIR) \
		LIBMB_LIBS="-L$(STAGING_DIR)/usr/lib -lfontconfig -lXrender \
		-lz -lexpat -lfreetype -lXft -lmb -lX11 -lXext -lXau -lXdmcp \
		-lpng12" \
		all install 
endef

define Package/matchbox-window-manager/install
	$(INSTALL_DIR) $(1)/etc/matchbox
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/etc/matchbox/kbdconfig \
		$(1)/etc/matchbox/

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/
	
	$(INSTALL_DIR) $(1)/usr/share/{matchbox,themes}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/matchbox/* \
		$(1)/usr/share/matchbox/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/themes/* \
		$(1)/usr/share/themes/
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DATA) \
		./files/uci-defaults/x11 \
		$(1)/etc/uci-defaults/
endef

define Package/matchbox-window-manager/postinst
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit
	. /etc/functions.sh
	uci_apply_defaults
endef

$(eval $(call BuildPackage,matchbox-window-manager))
