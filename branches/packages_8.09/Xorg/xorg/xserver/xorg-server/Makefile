#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=xorg-server
PKG_RELEASE:=1.1
PKG_VERSION:=1.5.1
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.4/src/xserver/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/xserver/$(PKG_NAME)-$(PKG_VERSION)/
PKG_BUILD_DEPENDS:=randrproto renderproto fixesproto damageproto xcmiscproto \
				   xextproto xproto scrnsaverproto bigreqsproto resourceproto \
				   fontsproto inputproto kbproto videoproto resourceproto \
				   xf86dgaproto xtrans xf86driproto

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

X_CONFIG=generic
ifeq ($(CONFIG_TARGET_olpc),y)
  X_CONFIG=olpc
endif
ifeq ($(CONFIG_TARGET_om_gta02),y)
  X_CONFIG=om_gta02
endif

define Package/xorg/Default
  SECTION:=xorg-server
  CATEGORY:=Xorg
  SUBMENU:=server
  DEPENDS:=@!avr32
  URL:=http://xorg.freedesktop.org/
endef

define Package/xserver-xorg
$(call Package/xorg/Default)
  PROVIDES:=xserver
  TITLE:=Xorg xserver
  DEPENDS:=+xserver-common \
  +libpthread \
  +libxkbfile \
  +libXfont \
  +libXau \
  +libXv \
  +libfontenc \
  +pixman \
  +libopenssl \
  +libpciaccess \
  +libdrm \
  +libgl-mesa \
  @DISPLAY_SUPPORT
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
		--enable-xorg \
		--enable-dri \
		--disable-kdrive \
		--disable-cfb \
		--disable-afb \
		--disable-mfb \
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
		--disable-xprint \
		--disable-xtrap \
		--disable-dmx \
		--disable-glx \
		--disable-xinerama \
		--disable-xfree86-utils \
		--disable-cup \
		--disable-xevie \
		--disable-evi \
		--disable-screensaver \
		--enable-builtin-fonts \
	)
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
endef

define Package/xserver-xorg/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/Xorg \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib/xorg/modules/{extensions,fonts,linux,multimedia}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/xorg/modules/*.so \
		$(1)/usr/lib/xorg/modules/

	$(foreach d,extensions fonts linux multimedia, \
		$(INSTALL_DATA) \
			$(PKG_INSTALL_DIR)/usr/lib/xorg/modules/$(d)/*.so \
			$(1)/usr/lib/xorg/modules/$(d)/; \
	)
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
