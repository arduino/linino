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
PKG_BUILD_DEPENDS:=randrproto renderproto fixesproto damageproto xcmiscproto \
                   xextproto xproto scrnsaverproto bigreqsproto resourceproto \
                   fontsproto inputproto kbproto videoproto resourceproto \
                   xf86dgaproto

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS+= \
	-I$(STAGING_DIR)/usr/include/X11/GL \
	-I$(STAGING_DIR)/usr/include/X11/dri/ \
	-I$(STAGING_DIR)/usr/include/X11/ \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

CONFIGURE_ARGS+= \
	--disable-aiglx \
	--disable-glx-tls \
	--disable-dga \
	--disable-xdmcp \
	--disable-xdm-auth-1 \
	--disable-config-hal \
	--disable-xf86misc \
	--disable-xf86vidmode \
	--disable-xf86bigfont \
	--disable-xorgcfg \
	--disable-xkb \
	--disable-xnest \
	--disable-xquartz \
	--disable-xwin \
	--disable-x11app \
	--disable-xsdl \
	--disable-xfake \
	--disable-install-setuid \
	--disable-kbd_mode \
	--disable-xvfb \
	--disable-xevie \
	--disable-xprint \
	--disable-xtrap \
	--disable-dmx \
	--disable-glx \
	--enable-builtin-fonts \
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

define Package/xserver-common/config
	source "$(SOURCE)/Config.in"
endef

X_CONFIG=generic
ifeq ($(CONFIG_TARGET_olpc),y)
  X_CONFIG=olpc
endif
ifeq ($(CONFIG_TARGET_om_gta02),y)
  X_CONFIG=om_gta02
endif

define Package/xorg/Default
  PROVIDES:=xserver
  SECTION:=xorg-server
  CATEGORY:=Xorg
  SUBMENU:=server
  DEPENDS:=@!avr32
  URL:=http://xorg.freedesktop.org/
endef

define Package/xserver/Default
$(call Package/xorg/Default)
  DEPENDS:=+xserver-common \
  +libpthread \
  +xtrans \
  +libxkbfile \
  +libXfont \
  +libXau \
  +libXv \
  +libfontenc \
  +pixman \
  +libopenssl \
  +libpciaccess \
  @DISPLAY_SUPPORT
endef

define Package/xserver-xorg
$(call Package/xserver/Default)
  PROVIDES:=xserver
  TITLE:=Xorg xserver
  DEPENDS+=+libdrm \
  +xf86driproto \
  +libgl-mesa \
  +xineramaproto
endef

define Package/xserver-kdrive/Default
$(call Package/xserver/Default)
  DEPENDS+=+X_TSLIB:tslib \
  +X_DRI:xf86driproto \
  +X_DRI:libdrm \
  +X_XCALIBRATE:calibrateproto \
  +X_COMPOSITE:compositeproto \
  +X_XINERAMA:xineramaproto
endef

define Package/xserver-kdrive-xvesa
$(call Package/xserver-kdrive/Default)
  TITLE:=Kdrive vesa xserver
  DEPENDS+=@TARGET_x86
endef

define Package/xserver-kdrive-xfbdev
$(call Package/xserver-kdrive/Default)
  TITLE:=Kdrive framebuffer xserver
endef

define Package/xserver-kdrive-xephyr
$(call Package/xserver-kdrive/Default)
  TITLE:=Kdrive ephyr xserver
endef

define Package/xserver-xorg-config
$(call Package/xorg/Default)
  TITLE:=Xorg server configuration tools
  DEPENDS:=xserver-xorg
endef

define Package/xserver-common
$(call Package/xorg/Default)
  TITLE:=meta-package
endef

define Build/Configure
	$(call Build/Configure/Default, \
		$(if $(CONFIG_PACKAGE_xserver-xorg),--enable-xorg --enable-dri,--disable-xorg --disable-dri) \
		$(if $(CONFIG_PACKAGE_xserver-kdrive-xvesa), \
			--enable-kdrive \
			--enable-kdrive-vesa, \
			--disable-kdrive-vesa) \
		$(if $(CONFIG_PACKAGE_xserver-kdrive-xfbdev), \
			--enable-kdrive \
			--enable-xfbdev, \
			--disable-xfbdev) \
		$(if $(CONFIG_PACKAGE_xserver-kdrive-xephyr), \
			--enable-kdrive \
			--enable-xephyr, \
			--disable-xephyr) \
		$(if $(CONFIG_X_TSLIB),--enable-tslib,--disable-tslib) \
		$(if $(CONFIG_X_COMPOSITE),--enable-composite,--disable-composite) \
		$(if $(CONFIG_X_XINERAMA),--enable-xinerama,--disable-xinerama) \
		$(if $(CONFIG_X_XCALIBRATE),--enable-xcalibrate,--disable-xcalibrate) \
	)
endef

define Build/Compile
	DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE) -C $(PKG_BUILD_DIR) install
endef

define Package/xserver-common/install
	$(INSTALL_DIR) $(1)/etc/{init.d,config}
	$(INSTALL_BIN) \
		./files/x.init \
		$(1)/etc/init.d/x11
	$(if $(X_CONFIG), \
		$(INSTALL_DATA) \
			./files/config/$(X_CONFIG) \
			$(1)/etc/config/x11 \
	)

	$(INSTALL_DIR) $(1)/usr/lib/xorg
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/xorg/protocol.txt \
		$(1)/usr/lib/xorg/
endef

define Package/xserver-kdrive-xfbdev/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/Xfbdev \
		$(1)/usr/bin/
endef

define Package/xserver-kdrive-xvesa/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/Xvesa \
		$(1)/usr/bin/
endef

define Package/xserver-kdrive-xephyr/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/Xephyr \
		$(1)/usr/bin/
endef

define Package/xserver-xorg/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/Xorg \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib/X11
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/X11/* \
		$(1)/usr/lib/X11/

	$(INSTALL_DIR) $(1)/usr/lib/xorg/modules/{extensions,fonts,linux,multimedia}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/xorg/modules/*.so \
		$(1)/usr/lib/xorg/modules/

	$(for dir,extensions fonts linux multimedia, \
		$(INSTALL_DATA) \
			$(PKG_INSTALL_DIR)/usr/lib/xorg/modules/$(d)/*.so \
			$(1)/usr/lib/xorg/modules/$(d) \
	)
endef

define Packages/xorg-server-config/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/xorgconfig $(1)/usr/bin/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/share/aclocal/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/aclocal/* \
		$(1)/usr/share/aclocal/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
	$(if $(CONFIG_PACKAGE_xserver-xorg), \
		$(INSTALL_DIR) $(1)/usr/include/xorg; \
		$(INSTALL_DATA) \
			$(PKG_INSTALL_DIR)/usr/include/xorg/*.h \
			$(1)/usr/include/xorg/; \
	)
endef

$(eval $(call BuildPackage,xserver-common))
$(eval $(call BuildPackage,xserver-xorg))
$(eval $(call BuildPackage,xserver-kdrive-xvesa))
$(eval $(call BuildPackage,xserver-kdrive-xfbdev))
$(eval $(call BuildPackage,xserver-kdrive-xephyr))
$(eval $(call BuildPackage,xserver-xorg-config))
