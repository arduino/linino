#
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xserver-kdrive
PKG_VERSION:=1.7.1
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/individual/xserver/
PKG_SOURCE:=xorg-server-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Xorg/xserver/$(PKG_NAME)/xorg-server-$(PKG_VERSION)/
PKG_MD5SUM:=dda7842467cda6018fdc87e6002e4db1

PKG_BUILD_DEPENDS:=randrproto renderproto fixesproto damageproto xcmiscproto \
				   xextproto xproto bigreqsproto resourceproto \
				   fontsproto inputproto kbproto videoproto resourceproto \
				   xf86dgaproto xtrans xf86driproto calibrateproto \
				   compositeproto xineramaproto

PKG_CONFIG_DEPENDS := \
	CONFIG_PACKAGE-xserver-kdrive-fbdev \
	CONFIG_PACKAGE_xserver-kdrive-xephyr \
    CONFIG_X_TSLIB CONFIG_X_COMPOSITE \
	CONFIG_X_XINERAMA CONFIG_X_XCALIBRATE

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/xserver-kdrive/Default
  PROVIDES:=xserver
  SECTION:=xorg-server
  CATEGORY:=Xorg
  SUBMENU:=server
  URL:=http://xorg.freedesktop.org/
  DEPENDS:=@!avr32 \
  +xserver-common \
  +libpthread \
  +libxkbfile \
  +libXfont \
  +libXau \
  +libXv \
  +libfontenc \
  +pixman \
  +libopenssl \
  +libdrm \
  @DISPLAY_SUPPORT \
  +X_TSLIB:tslib
endef

define Package/xserver-kdrive-xfbdev
$(call Package/xserver-kdrive/Default)
  TITLE:=Kdrive framebuffer xserver
endef

define Package/xserver-kdrive-xephyr
$(call Package/xserver-kdrive/Default)
  TITLE:=Kdrive ephyr xserver
  DEPENDS += @BROKEN
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-kdrive \
		$(if $(CONFIG_PACKAGE_xserver-kdrive-xfbdev), \
			--enable-xfbdev, \
			--disable-xfbdev) \
		$(if $(CONFIG_PACKAGE_xserver-kdrive-xephyr), \
			--enable-xephyr, \
			--disable-xephyr) \
		$(if $(CONFIG_X_TSLIB),--enable-tslib,--disable-tslib) \
		$(if $(CONFIG_X_COMPOSITE),--enable-composite,--disable-composite) \
		$(if $(CONFIG_X_XINERAMA),--enable-xinerama,--disable-xinerama) \
		$(if $(CONFIG_X_XCALIBRATE),--enable-xcalibrate,--disable-xcalibrate) \
		--disable-dependency-tracking \
		--disable-debug \
		--disable-unit-tests \
		--disable-builddocs \
		--disable-glx-tls \
		--disable-shm \
		--disable-xres \
		--disable-record \
		--enable-xv \
		--enable-xvmc \
		--disable-dga \
		--disable-screensaver \
		--disable-xdmcp \
		--disable-xdm-auth-1 \
		--disable-glx \
		--enable-dri \
		--disable-dri2 \
		--disable-xf86vidmode \
		--disable-xace \
		--disable-xselinux \
		--disable-xsecurity \
		--disable-multibuffer \
		--disable-dbe \
		--disable-xf86bigfont \
		--enable-dpms \
		--disable-config-dbus \
		--disable-config-hal \
		--disable-xfree86-utils \
		--disable-xaa \
		--enable-vgahw \
		--disable-vbe \
		--enable-int10-module \
		--disable-xorg \
		--disable-dmx \
		--disable-xvfb \
		--disable-xnest \
		--disable-xquartz \
		--disable-standalone-xpbproxy \
		--disable-xwin \
		--disable-xfake \
		--disable-installsetuid \
		--disable-secure-rpc \
		--enable-silent-rules \
		--disable-shave \
	)
endef

define Package/xserver-kdrive-xfbdev/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/Xfbdev \
		$(1)/usr/bin/
endef

define Package/xserver-kdrive-xephyr/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/Xephyr \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,xserver-kdrive-xfbdev))
$(eval $(call BuildPackage,xserver-kdrive-xephyr))
