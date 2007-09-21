# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=xorg-server-X11R7.2
PKG_RELEASE:=1
PKG_VERSION:=1.2.0
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.2/src/xserver/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/server/xorg-server-X11R7.2-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

define Package/xorg-server-X11R7.2/Default
  SECTION:=xorg-server
  CATEGORY:=Xorg
  SUBMENU:=server
  URL:=http://xorg.freedesktop.org/
endef

define Package/xorg-server-X11R7.2
$(call Package/xorg-server-X11R7.2/Default) 
  TITLE:=Xorg server
  DEPENDS:=+compositeproto-X11R7.1 \
		+damageproto-X11R7.0 \
		+fixesproto-X11R7.1 \
		+recordproto-X11R7.0 \
		+resourceproto-X11R7.0 \
		+scrnsaverproto-X11R7.1 \
		+videoproto-X11R7.0 \
		+xextproto-X11R7.0 \
		+xproto-X11R7.2 \
		+libXext-X11R7.2 \
		+libXdmcp-X11R7.2 \
		+libXfont-X11R7.2 \
		+libXrandr-X11R7.2 \
		+xtrans-X11R7.2 \
		+libX11-X11R7.2 \
		+glproto-X11R7.2 \
		+xf86driproto-X11R7.0 \
		+applewmproto-X11R7.0 \
		+dmxproto-X11R7.0 \
		+printproto-X11R7.0 \
		+windowswmproto-X11R7.0 \
		+xf86rushproto-X11R7.0 \
		+xproxymanagementprotocol-X11R7.0 \
		+libdrm \
		+xf86miscproto-X11R7.0 \
		+xf86vidmodeproto-X11R7.0 \
		+xf86dgaproto-X11R7.0 \
		+trapproto-X11R7.0 \
		+xineramaproto-X11R7.0 \
		+evieext-X11R7.0 \
		+libxkbfile-X11R7.2 \
		+libXt-X11R7.2 \
		+libSM-X11R7.2 \
		+libxkbui-X11R7.1 \
		+libXxf86misc-X11R7.1 \
		+libXxf86vm-X11R7.1 \
		+libXaw-X11R7.1 \
		+libXmu-X11R7.2 \
		+libXpm-X11R7.2 \
		+libnotimpl \
		+Mesa \
		@TARGET_x86
  MENU:=1
endef

define Package/xorg-server-X11R7.2-config
$(call Package/xorg-server-X11R7.2/Default) 
  TITLE:=Xorg server configuration tools 
  DEPENDS:=xorg-server-X11R7.2
endef

EXTRA_CFLAGS+= -I${STAGING_DIR}/usr/include/X11/GL -I${STAGING_DIR}/usr/include/X11/dri/ -I${STAGING_DIR}/usr/include/X11/ -Wl,-rpath-link=$(STAGING_DIR)/usr/lib


define Build/Configure
	(cd $(PKG_BUILD_DIR) \
		$(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
		$(CONFIGURE_VARS) \
		$(CONFIGURE_CMD) \
		$(CONFIGURE_ARGS_XTRA) \
		$(CONFIGURE_ARGS) \
		--with-default-font-path=built-ins \
		as_ac_File=no \
		);
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install

endef

define Package/xorg-server-X11R7.2/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/Xorg $(1)/usr/bin/
	cd $(1)/usr/bin; ln -s Xorg X
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

define Packages/xorg-server-X11R7.2-config/install
	$(INSTALL_DIR) $(1)/usr/bin
    $(CP) $(PKG_INSTALL_DIR)/usr/bin/xorgconfig $(1)/usr/bin/
endef

define Build/InstallDev
 	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/xorg-server.pc $(STAGING_DIR)/usr/lib/pkgconfig/
endef

$(eval $(call BuildPackage,xorg-server-X11R7.2))
$(eval $(call BuildPackage,xorg-server-X11R7.2-config))
