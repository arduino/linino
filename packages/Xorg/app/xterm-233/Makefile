#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=xterm
PKG_VERSION:=223
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.2/src/extras/

include $(INCLUDE_DIR)/package.mk

define Package/xterm
  SECTION:=xorg-extra
  CATEGORY:=Xorg
  SUBMENU:=terminals
  TITLE:=xterm
  DEPENDS:=+libX11 +libncurses +libXaw
endef

define Build/Configure
	sed -e "s%/usr/contrib/X11R6%${STAGING_DIR}/usr/lib%g" -i $(PKG_BUILD_DIR)/configure
	cd  $(PKG_BUILD_DIR)/; $(TARGET_CONFIGURE_OPTS)	$(CONFIGURE_VARS) \
		$(CONFIGURE_CMD) \
		$(CONFIGURE_ARGS_XTRA) \
		$(CONFIGURE_ARGS) \
		--host=$(GNU_TARGET_NAME) \
		--x-includes=$(STAGING_DIR)/usr/include/  \
		--x-libraries=$(STAGING_DIR)/usr/lib/ \
		LIBS="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib"
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) 
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Package/xterm/install
	$(INSTALL_DIR) $(1)/usr/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin $(1)/usr/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib $(1)/usr/
endef

$(eval $(call BuildPackage,xterm))
