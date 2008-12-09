#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=xbitmaps
PKG_NAME:=xbitmaps
PKG_RELEASE:=1
PKG_VERSION:=1.0.1
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.3/src/data/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

define Package/xbitmaps
  SECTION:=xorg-data
  CATEGORY:=Xorg
  SUBMENU:=data
  DEPENDS:=
  TITLE:=xbitmaps
  URL:=http://xorg.freedesktop.org/
endef

define Build/InstallDev
	DESTDIR=$(1) $(MAKE) -C $(PKG_BUILD_DIR)/ $(MAKE_FLAGS) install
endef

#ifeq (libXext,libX11)
# CONFIGURE_ARGS_XTRA=--without-xcb
#endif

define Build/Compile
	$(call $(PKG_NAME)/Compile)
	make -C $(PKG_BUILD_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	DESTDIR=$(PKG_INSTALL_DIR) $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR)/$(CONFIGURE_PATH); \
	if [ -x $(CONFIGURE_CMD) ]; then \
		$(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
		$(CONFIGURE_VARS) \
		$(CONFIGURE_CMD) \
		$(CONFIGURE_ARGS_XTRA) \
		$(CONFIGURE_ARGS) ; \
	fi \
	)
endef

define Package/xbitmaps/install/Default
	$(INSTALL_DIR) $(1)/usr/include/X11/bitmaps
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/bitmaps/* $(1)/usr/include/X11/bitmaps
endef

$(eval $(call BuildPackage,xbitmaps))
