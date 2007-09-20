# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 8299 2007-08-01 12:32:53Z nico $

include $(TOPDIR)/rules.mk


PKG_NAME:=xorg-kdrive-X11R7.2
PKG_RELEASE:=1
PKG_VERSION:=1.2.0
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.2/src/xserver/
PKG_SOURCE:=xorg-server-X11R7.2-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/server/kdrive/xorg-server-X11R7.2-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

define Package/xorg-kdrive-X11R7.2
  SECTION:=xorg-server
  CATEGORY:=Xorg
  SUBMENU:=server
  TITLE:=Xorg kdrive server
  URL:=http://xorg.freedesktop.org/
  DEPENDS:=+compositeproto-X11R7.1 +damageproto-X11R7.0 +fixesproto-X11R7.1 +recordproto-X11R7.0 +resourceproto-X11R7.0 +scrnsaverproto-X11R7.1 +videoproto-X11R7.0 +xextproto-X11R7.0 +xproto-X11R7.2 +libXext-X11R7.2 +libXdmcp-X11R7.2 +libXfont-X11R7.2 +libXrandr-X11R7.2 +xtrans-X11R7.2 +libX11-X11R7.2  @TARGET_x86 
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR)/$(CONFIGURE_PATH); \
		if [ -x $(CONFIGURE_CMD) ]; then \
		$(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
		$(CONFIGURE_VARS) \
		$(CONFIGURE_CMD) \
		$(CONFIGURE_ARGS_XTRA) \
		$(CONFIGURE_ARGS) \
			--enable-composite --enable-kdrive \
			--disable-dga --disable-dri --disable-xinerama \
			--disable-xf86misc --disable-xf86vidmode \
			--disable-xorg --disable-xorgcfg \
			--disable-xkb --disable-xnest --disable-xvfb \
			--disable-xevie --disable-xprint --disable-xtrap \
			--disable-dmx --disable-w100 \
			--with-default-font-path=built-ins \
			--enable-tslib --enable-xcalibrate \
			ac_cv_file__usr_share_X11_sgml_defs_ent=no
	fi;\
	)
endef

define Build/Compile
	 $(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/xorg-kdrive-X11R7.2/install
    $(INSTALL_DIR) $(1)/usr/lib
	    $(CP) $(PKG_INSTALL_DIR)/usr/local/lib/libfreetype.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,xorg-kdrive-X11R7.2))
