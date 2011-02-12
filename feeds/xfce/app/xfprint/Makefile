#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xfprint
PKG_VERSION:=4.6.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.tx-us.xfce.org/archive/xfce-$(PKG_VERSION)/src/
PKG_MD5SUM:=d92fca97a42816085080baf07a99a62e

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/xfprint
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=xfprint
  DEPENDS:=+libxfce4util +libxfcegui4 +xfconf
endef

define Build/InstallDev
	$(INSTALL_DIR)	$(1)/usr/{lib/pkgconfig,include/xfce4/libxfprint}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/xfce4/libxfprint/* \
		$(1)/usr/include/xfce4/libxfprint/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{la,so*,a} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/xfprint/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/xfce4/xfprint-plugins
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/xfce4/xfprint-plugins/*.so* \
		$(1)/usr/lib/xfce4/xfprint-plugins/

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/share/icons
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/* \
		$(1)/usr/share/icons/

	$(INSTALL_DIR) $(1)/usr/share/applications
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications
endef

$(eval $(call BuildPackage,xfprint))
