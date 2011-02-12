#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xfconf
PKG_VERSION:=4.6.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.tx-us.xfce.org/archive/xfce-$(PKG_VERSION)/src/
PKG_MD5SUM:=d4d3018767ea9eb4b57cc57d4038023b

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/libxfconf
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=libxfconf
  DEPENDS:=+libxfce4util +dbus +libdbus-glib +gtk2 +dbus-launch-x
endef

define Package/xfconf
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=xfconf
  DEPENDS:=+libxfconf
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--libexecdir=/usr/lib/xfconf \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib/pkgconfig,include}

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,la,a} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/
endef

define Package/libxfconf/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
endef

define Package/xfconf/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib/xfconf/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/xfconf/xfconfd \
		$(1)/usr/lib/xfconf/

	$(INSTALL_DIR) $(1)/usr/share/dbus-1/services
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/dbus-1/services/* \
		$(1)/usr/share/dbus-1/services/
endef
$(eval $(call BuildPackage,libxfconf))
$(eval $(call BuildPackage,xfconf))
