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
PKG_VERSION:=1.5.1
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.4/src/xserver/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/xserver/xorg-server-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS+= -I${STAGING_DIR}/usr/include/X11/GL -I${STAGING_DIR}/usr/include/X11/dri/ -I${STAGING_DIR}/usr/include/X11/ -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

CONFIGURE_ARGS+= --disable-dga \
		--disable-xf86misc \
		--disable-xf86vidmode \
		--disable-xf86bigfont \
		--disable-xorgcfg \
		--disable-xkb \
		--disable-xnest \
		--disable-xvfb \
		--disable-xevie \
		--disable-xprint \
		--disable-xtrap \
		--disable-dmx \
		--disable-w100 \
		--disable-glx \
		--enable-xfbdev \
		--enable-kdrive \
		--disable-xorg \
		--disable-xephyr \
		--enable-builtin-fonts \
		--disable-kdrive-vesa \
		--with-default-font-path=built-ins \

CONFIGURE_VARS+=ac_cv_file__usr_share_sgml_X11_defs_ent=yes

#FIXME: make full blowed xorg-xserver work

#DEPENDS_SERVER:=+calibrateproto \
#		+compositeproto \
#		+damageproto \
#		+fixesproto \
#		+recordproto \
#		+resourceproto \
#		+scrnsaverproto \
#		+videoproto \
#		+xextproto \
#		+xproto \
#		+libXext \
#		+libXdmcp \
#		+libXfont \
#		+libXrandr \
#		+xtrans \
#		+libX11 \
#		+glproto \
#		+xf86driproto \
#		+applewmproto \
#		+dmxproto \
#		+printproto \
#		+windowswmproto \
#		+xf86rushproto \
#		+xproxymanagementprotocol \
#		+libdrm \
#		+xf86miscproto \
#		+xf86vidmodeproto \
#		+xf86dgaproto \
#		+trapproto \
#		+xineramaproto \
#		+evieext \
#		+libxkbfile \
#		+libXt \
#		+libSM \
#		+libxkbui \
#		+libXxf86misc \
#		+libXxf86vm \
#		+libXaw \
#		+libXmu \
#		+libXpm \
#		+libnotimpl \
#		+Mesa \
#		+pixman \
#		@DISPLAY_SUPPORT

define Package/xorg-server/config
	menu "Configuration"
	depends on PACKAGE_xorg-server
	source "$(SOURCE)/Config.in"
	endmenu
endef

X_BIN_FILE=Xfbdev # no Xorg-binary when xorg is disabled :)
#ifneq ($(CONFIG_X_KDRIVE),)
# CONFIGURE_ARGS+=--enable-kdrive --disable-xorg
#  X_BIN_FILE=Xfbdev # no Xorg-binary when xorg is disabled :)
#else
#  CONFIGURE_ARGS+=--disable-kdrive --enable-xorg
#  X_BIN_FILE=Xorg
#endif

ifeq ($(CONFIG_TARGET_olpc),y)
  #XORG_CONFIG_FILE=xorg-olpc.conf
  X_CONFIG=olpc
endif
ifeq ($(CONFIG_TARGET_om_gta02),y)
  #XORG_CONFIG_FILE=xorg-om_gta02.conf
  X_CONFIG=om_gta02
endif

define Package/xorg-server/Default
  SECTION:=xorg-server
  CATEGORY:=Xorg
  URL:=http://xorg.freedesktop.org/
endef

define Package/xorg-server
$(call Package/xorg-server/Default) 
  TITLE:=Xorg server
  MENU:=1
  DEPENDS:=+X_TSLIB:tslib \
  +X_DRI:xf86driproto \
  +X_DRI:libdrm \
  +X_XCALIBRATE:calibrateproto \
  +X_COMPOSITE:compositeproto \
  +X_XINERAMA:xineramaproto \
  +libpthread \
  +randrproto \
  +renderproto \
  +fixesproto \
  +damageproto \
  +xcmiscproto \
  +xextproto \
  +xproto \
  +scrnsaverproto \
  +bigreqsproto \
  +resourceproto \
  +fontsproto \
  +inputproto \
  +kbproto \
  +videoproto \
  +resourceproto \
  +xtrans \
  +libxkbfile \
  +libXfont \
  +libXau \
  +libfontenc \
  +pixman \
  +libopenssl \
  @DISPLAY_SUPPORT
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
		$(if $(CONFIG_X_TSLIB),--enable-tslib) \
		$(if $(CONFIG_X_COMPOSITE),,--disable-composite) \
		$(if $(CONFIG_X_XINERAMA),,--disable-xinerama) \
		$(if $(CONFIG_X_DRI),,--disable-dri) \
		$(if $(CONFIG_X_XCALIBRATE),--enable-xcalibrate) \
		);
endef

define Build/Compile
	DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE) -C $(PKG_BUILD_DIR) install
endef

define Package/xorg-server/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib $(1)/etc/init.d $(1)/etc/config
	#$(CP) $(PKG_INSTALL_DIR)/usr/bin/$(X_BIN_FILE) $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) ./files/x.init $(1)/etc/init.d/x11
	$(if $(X_CONFIG),$(CP) ./files/config/$(X_CONFIG) $(1)/etc/config/x11)
	cd $(1)/usr/bin; ln -sf $(X_BIN_FILE) X
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

#define Package/xorg-server/install
#	$(INSTALL_DIR) $(1)/usr/bin
#	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/$(XORG_BIN_FILE) $(1)/usr/bin/
#	cd $(1)/usr/bin; ln -sf $(XORG_BIN_FILE) X
#	$(INSTALL_DIR) $(1)/usr/share
#	$(CP) $(PKG_INSTALL_DIR)/usr/share/* $(1)/usr/share/
#	$(INSTALL_DIR) $(1)/usr/lib/xserver
#	$(CP) $(PKG_INSTALL_DIR)/usr/lib/xserver/* $(1)/usr/lib/xserver
#	$(INSTALL_DIR) $(1)/usr/lib/xorg/
#	$(CP) -r $(PKG_INSTALL_DIR)/usr/lib/xorg/* $(1)/usr/lib/xorg/
#	find $(1)/usr/lib/xorg/ -name *.la | xargs rm -rf
#	$(INSTALL_DIR) $(1)/usr/lib/X11/
#	$(CP) -r $(PKG_INSTALL_DIR)/usr/lib/X11/* $(1)/usr/lib/X11/
#	rm -rf $(1)/usr/share/X11 $(1)/usr/lib/X11/xserver	
#	$(INSTALL_DIR) $(1)/var/log/
#	$(INSTALL_DIR) $(1)/etc/X11/
#	$(CP) files/$(XORG_CONFIG_FILE) $(1)/etc/X11/xorg.conf
#endef

define Packages/xorg-server-config/install
	$(INSTALL_DIR) $(1)/usr/bin
   $(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/xorgconfig $(1)/usr/bin/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig/
endef

$(eval $(call BuildPackage,xorg-server))
$(eval $(call BuildPackage,xorg-server-config))
