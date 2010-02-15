#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xorg-server
PKG_RELEASE:=1
PKG_VERSION:=1.7.1
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/individual/xserver/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Xorg/xserver/$(PKG_NAME)-$(PKG_VERSION)/
PKG_BUILD_DEPENDS:=randrproto renderproto fixesproto damageproto xcmiscproto \
				   xextproto xproto scrnsaverproto bigreqsproto resourceproto \
				   fontsproto inputproto kbproto videoproto resourceproto \
				   compositeproto xf86dgaproto xtrans xf86driproto dri2proto

PKG_INSTALL:=1
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

X_CONFIG=generic
ifeq ($(CONFIG_TARGET_olpc),y)
  X_CONFIG=olpc
endif
ifeq ($(CONFIG_TARGET_s3c24xx),y)
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
  +xkbcomp \
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
		--disable-dependency-tracking \
		--disable-debug \
		--disable-unit-tests \
		--disable-builddocs \
		--disable-glx-tls \
		--disable-composite \
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
		--enable-dri2 \
		--disable-xinerama \
		--disable-xf86vidmode \
		--disable-xace \
		--disable-xselinux \
		--disable-xsecurity \
		--disable-xcalibrate \
		--disable-tslib \
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
		--enable-xorg \
		--disable-dmx \
		--disable-xvfb \
		--disable-xnest \
		--disable-xquartz \
		--disable-standalone-xpbproxy \
		--disable-xwin \
		--disable-kdrive \
		--disable-xfake \
		--disable-xfbdev \
		--disable-installsetuid \
		--disable-secure-rpc \
		--enable-silent-rules \
		--disable-shave \
	)
endef

define Package/xserver-common/install
	$(INSTALL_DIR) $(1)/etc/{init.d,config,X11}
	$(INSTALL_BIN) \
		./files/x.init \
		$(1)/etc/init.d/x11
	$(INSTALL_DATA) ./files/tmp/x11.uci \
		$(1)/etc/config/x11
	test -f ./files/config.xorg/$(X_CONFIG) && \
		$(INSTALL_DATA) \
			./files/config.xorg/$(X_CONFIG) \
			$(1)/etc/X11/xorg.conf
#	test -f ./files/config.uci/$(X_CONFIG) && \
#		$(INSTALL_DATA) \
#			./files/config.uci/$(X_CONFIG) \
#			$(1)/etc/config/x11
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
	$(INSTALL_DIR) $(1)/mk
	$(INSTALL_DATA) \
		./files/xorg-driver.mk \
		$(1)/mk/
	$(SED) 's,@VERSION@,$(PKG_VERSION),' $(1)/mk/xorg-driver.mk
endef

$(eval $(call BuildPackage,xserver-common))
$(eval $(call BuildPackage,xserver-xorg))
