# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org


include $(TOPDIR)/rules.mk

PKG_NAME:=calibrateproto
PKG_RELEASE:=1
PKG_VERSION:=git

include $(INCLUDE_DIR)/package.mk

define Package/calibrateproto
  SECTION:=xorg-proto
  CATEGORY:=Xorg
  SUBMENU:=proto
  DEPENDS:=
  TITLE:=calibrateproto
  URL:=http://xorg.freedesktop.org/
endef

define Build/Prepare
$(call Build/Prepare/Default)
	$(CP) src/* $(PKG_BUILD_DIR)
endef

define Build/InstallDev
	DESTDIR=$(1) $(MAKE) -C $(PKG_BUILD_DIR)/$(SUBPACKAGE)  $(MAKE_FLAGS) install
endef

define Build/Compile
	echo
endef

$(eval $(call BuildPackage,calibrateproto))
