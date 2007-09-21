# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=xorg-server-X11R7.2-essentials
PKG_RELEASE:=1
PKG_VERSION:=1

include $(INCLUDE_DIR)/package.mk

define Package/xorg-server-X11R7.2-essentials
  SECTION:=xorg-meta
  CATEGORY:=Xorg
  TITLE:=Xorg server essentials 
  URL:=http://xorg.freedesktop.org/
  DEPENDS:=+xorg-server-X11R7.2 \
  		+font-alias-X11R7.0 \
		+font-misc-misc-X11R7.0 \
		+font-cursor-misc-X11R7.0 \
		+xf86-input-mouse-X11R7.2 \
		+xf86-video-vesa-X11R7.2 \
		+xf86-video-vga-X11R7.1 \
		+xf86-input-evdev-X11R7.1 \
		+xf86-input-keyboard-X11R7.2 \
		@TARGET_x86
endef

define Build/Configure
	echo 
endef

define Build/Compile
	echo 
endef

define Package/xorg-server-X11R7.2-essentials/install
	$(INSTALL_DIR) $(1)/root
	$(CP) files/xinitrc $(1)/root/.xinitrc
endef

$(eval $(call BuildPackage,xorg-server-X11R7.2-essentials))
