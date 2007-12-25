# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=xorg-server
PKG_RELEASE:=1
PKG_VERSION:=X11R7.2-1.2.0
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.2/src/xserver/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/server/xorg-server-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS+= -I${STAGING_DIR}/usr/include/X11/GL -I${STAGING_DIR}/usr/include/X11/dri/ -I${STAGING_DIR}/usr/include/X11/ -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

CONFIGURE_ARGS_KDRIVE=--enable-composite --enable-kdrive \
		--disable-dga --disable-dri --disable-xinerama \
		--disable-xf86misc --disable-xf86vidmode \
		--disable-xorg --disable-xorgcfg \
		--disable-xkb --disable-xnest --disable-xvfb \
		--disable-xevie --disable-xprint --disable-xtrap \
		--disable-dmx --disable-w100 \
		--with-default-font-path=built-ins \
		--enable-tslib --enable-xcalibrate 

CONFIGURE_VARS+=ac_cv_file__usr_share_sgml_X11_defs_ent=yes 
CONFIGURE_ARGS+=$(if $(CONFIG_XORG_BUILD_KDRIVE), $(CONFIGURE_ARGS_KDRIVE))

DEPENDS_SERVER:=+calibrateproto \
		+compositeproto \
		+damageproto \
		+fixesproto \
		+recordproto \
		+resourceproto \
		+scrnsaverproto \
		+videoproto \
		+xextproto \
		+xproto \
		+libXext \
		+libXdmcp \
		+libXfont \
		+libXrandr \
		+xtrans \
		+libX11 \
		+glproto \
		+xf86driproto \
		+applewmproto \
		+dmxproto \
		+printproto \
		+windowswmproto \
		+xf86rushproto \
		+xproxymanagementprotocol \
		+libdrm \
		+xf86miscproto \
		+xf86vidmodeproto \
		+xf86dgaproto \
		+trapproto \
		+xineramaproto \
		+evieext \
		+libxkbfile \
		+libXt \
		+libSM \
		+libxkbui \
		+libXxf86misc \
		+libXxf86vm \
		+libXaw \
		+libXmu \
		+libXpm \
		+libnotimpl \
		+Mesa \
		@DISPLAY_SUPPORT

DEPENDS_KDRIVE:=+calibrateproto \
		+compositeproto \
		+damageproto \
		+fixesproto \
		+recordproto \
		+resourceproto \
		+scrnsaverproto \
		+videoproto \
		+xextproto \
		+xproto \
		+libXext \
		+libXdmcp \
		+libXfont \
		+libXrandr \
		+xtrans \
		+libX11 \
		@DISPLAY_SUPPORT 

define Package/xorg-server/config
	config XORG_BUILD_KDRIVE
		bool "Build kdrive instead of xserver"
		depends PACKAGE_xorg-server
endef

define Package/xorg-server/Default
  SECTION:=xorg-server
  CATEGORY:=Xorg
  URL:=http://xorg.freedesktop.org/
endef

define Package/xorg-server
$(call Package/xorg-server/Default) 
  TITLE:=Xorg server
  MENU:=1
  DEPENDS:=$(if $(CONFIG_XORG_BUILD_KDRIVE), $(DEPENDS_KDRIVE), $(DEPENDS_SERVER))
endef

define Package/xorg-server-config
$(call Package/xorg-server/Default) 
  TITLE:=Xorg server configuration tools 
  DEPENDS:=xorg-server
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR) \
		$(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
		$(CONFIGURE_VARS) \
		$(CONFIGURE_CMD) \
		$(CONFIGURE_ARGS_XTRA) \
		$(CONFIGURE_ARGS) \
		--with-default-font-path=built-ins \
		);
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install

endef

define Package/xorg-server/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/Xorg $(1)/usr/bin/
	cd $(1)/usr/bin; ln -sf Xorg X
	$(INSTALL_DIR) $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/usr/share/* $(1)/usr/share/
	$(INSTALL_DIR) $(1)/usr/lib/xserver
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/xserver/* $(1)/usr/lib/xserver
	$(INSTALL_DIR) $(1)/usr/lib/xorg/
	$(CP) -r $(PKG_INSTALL_DIR)/usr/lib/xorg/* $(1)/usr/lib/xorg/
	find $(1)/usr/lib/xorg/ -name *.la | xargs rm -rf
	$(INSTALL_DIR) $(1)/usr/lib/X11/
	$(CP) -r $(PKG_INSTALL_DIR)/usr/lib/X11/* $(1)/usr/lib/X11/
	rm -rf $(1)/usr/share/X11 $(1)/usr/lib/X11/xserver	
	$(INSTALL_DIR) $(1)/var/log/
	$(INSTALL_DIR) $(1)/etc/X11/
	$(CP) files/xorg.conf $(1)/etc/X11/
endef

define Packages/xorg-server-config/install
	$(INSTALL_DIR) $(1)/usr/bin
    $(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/xorgconfig $(1)/usr/bin/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/xorg-server.pc $(1)/usr/lib/pkgconfig/
endef

$(eval $(call BuildPackage,xorg-server))
$(eval $(call BuildPackage,xorg-server-config))
