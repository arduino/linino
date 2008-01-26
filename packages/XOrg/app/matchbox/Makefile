# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=matchbox-window-manager
PKG_VERSION:=1.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://matchbox-project.org/sources/matchbox-window-manager/$(PKG_VERSION)

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/matchbox
  TITLE:=matchbox window manager
  SECTION:=xorg-wm
  CATEGORY:=Xorg
  DEPENDS:=+xorg-server-essentials +zlib +libfreetype +fontconfig +libmatchbox @DISPLAY_SUPPORT
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		LIBMB_LIBS="-L$(STAGING_DIR)/usr/lib -lfontconfig -lXrender -lz -lexpat -lfreetype -lXft -lmb -lX11 -lXext -lXau -lXdmcp -lpng12" \
		all install 
endef

define Package/matchbox/install
	$(INSTALL_DIR) $(1)/
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,matchbox))
