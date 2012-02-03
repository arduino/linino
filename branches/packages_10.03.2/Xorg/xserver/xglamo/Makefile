# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=xglamo
PKG_VERSION:=20081205
PKG_REV:=3f113f5f4dbaf14dee439eac8d510313fff3aafc
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://git.openmoko.org/git/xglamo.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/xserver/$(PKG_NAME)-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS+= -I${STAGING_DIR}/usr/include/X11/GL -I${STAGING_DIR}/usr/include/X11/dri/ -I${STAGING_DIR}/usr/include/X11/ -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

CONFIGURE_ARGS += --disable-dga \
		--disable-xinerama \
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
		--disable-xv \
		--disable-record \
		--disable-xephyr \
		--disable-xorg \
		--enable-kdrive \
		--enable-tslib \
		--enable-dri \
		--enable-drm \
		--enable-builtin-fonts \
		--with-default-font-path=built-ins \

CONFIGURE_VARS+=ac_cv_file__usr_share_sgml_X11_defs_ent=yes

ifeq ($(CONFIG_TARGET_s3c24xx),y)
  X_CONFIG=om_gta02
  TS_POINTERCAL=om_gta02
endif

define Package/xglamo
  # xineramaproto necessary even when xinerama is disabled due to buggy xglamo
  TITLE:=xglamo
  SECTION:=xorg-server
  SUBMENU:=server
  CATEGORY:=Xorg
  URL:=http://git.openmoko.org/?p=xglamo.git
  DEPENDS:=+tslib \
  +recordproto \
  +glproto \
  +libdrm \
  +xf86driproto \
  +xineramaproto \
  +calibrateproto \
  +compositeproto \
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
  @DISPLAY_SUPPORT \
  @arm||armeb \
  @TARGET_s3c24xx
endef

define Package/xglamo/description
	 kdrive server with acceleration support for the graphics chip <glamo> by smedia
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR) && \
      $(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
      $(CONFIGURE_VARS) \
      ./autogen.sh \
      $(CONFIGURE_ARGS_XTRA) \
      $(CONFIGURE_ARGS) \
		);
endef

define Build/Compile
	DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE) -C $(PKG_BUILD_DIR) install
endef

define Package/xglamo/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib $(1)/etc/init.d $(1)/etc/config $(1)/etc/uci-defaults
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/Xglamo $(1)/usr/bin/
	$(CP) ./files/x.init $(1)/etc/init.d/x11
	$(if $(TS_POINTERCAL),$(CP) ./files/pointercal.$(TS_POINTERCAL) $(1)/etc/pointercal)
	$(if $(X_CONFIG),$(CP) ./files/config/x11.$(X_CONFIG) $(1)/etc/config/x11)
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,xglamo))
