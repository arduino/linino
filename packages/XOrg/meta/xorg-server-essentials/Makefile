# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=xorg-server-essentials
PKG_RELEASE:=1
PKG_VERSION:=1

include $(INCLUDE_DIR)/package.mk

define Package/xorg-server-essentials
  SECTION:=xorg-meta
  CATEGORY:=Xorg
  TITLE:=Xorg server essentials 
  URL:=http://xorg.freedesktop.org/
  DEPENDS:=+xorg-server \
  		+font-alias \
		+font-base \
		+font-cursor-misc \
		+xf86-input-mouse \
		+xf86-video-vesa \
		+xf86-video-vga \
		+xf86-input-evdev \
		+xf86-input-keyboard \
		+xinit \
		@TARGET_x86
endef

define Build/Configure
	echo 
endef

define Build/Compile
	echo 
endef

define Package/xorg-server-essentials/install
	$(INSTALL_DIR) $(1)/root
	$(CP) files/xinitrc $(1)/root/.xinitrc
endef

$(eval $(call BuildPackage,xorg-server-essentials))
