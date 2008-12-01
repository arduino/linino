#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=xine-ui
PKG_VERSION:=0.99.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.sourceforge.net/xine/
PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

EXTRA_LDLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib -lnotimpl

define Package/xine-ui
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=xine user interface
  DEPENDS:=+xine-lib +libpng +curl +libiconv +libXv +libICE +libXxf86vm
endef

CONFIGURE_VARS+= \
	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"

EXTRA_LDFLAGS:=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

CONFIGURE_ARGS+=--without-aalib \
			--without-libcaca \
			--disable-lirc \
			--without-readline

define Build/Configure
	(cd $(PKG_BUILD_DIR)/$(CONFIGURE_PATH); \
		if [ -x $(CONFIGURE_CMD) ]; then \
			$(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
			$(CONFIGURE_VARS) \
			$(CONFIGURE_CMD) \
			$(CONFIGURE_ARGS_XTRA) \
			$(CONFIGURE_ARGS) ;\
		fi \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) X_LIBS="-L$(STAGING_DIR)/usr/lib -lnotimpl -lfreetype"
	$(MAKE) -C $(PKG_BUILD_DIR)/ install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Package/xine-ui/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/xine \
		$(PKG_INSTALL_DIR)/usr/share/pixmaps \
		$(1)/usr/share/
endef

$(eval $(call BuildPackage,xine-ui))
