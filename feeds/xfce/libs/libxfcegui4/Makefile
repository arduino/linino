#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libxfcegui4
PKG_VERSION:=4.6.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://archive.xfce.org/xfce/$(PKG_VERSION)/src/
PKG_MD5SUM:=539cff747634b8ee6f0d2362ee78a286

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/libxfcegui4
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=libxfcegui4
  DEPENDS:=+libxfce4util +gtk2 +libglade +libxfconf +libSM +libX11
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib/pkgconfig,include/xfce4/libxfcegui4,include/xfce4/libxfce4kbd-private}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/xfce4/libxfcegui4/* \
		$(1)/usr/include/xfce4/libxfcegui4
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/xfce4/libxfce4kbd-private/* \
		$(1)/usr/include/xfce4/libxfce4kbd-private/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{la,so*,a} \
		$(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libxfcegui4/install
	$(INSTALL_DIR) $(1)/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/* \
		$(1)/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/

	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/libglade/2.0
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/libglade/2.0/*.so \
		$(1)/usr/lib/libglade/2.0/

	$(INSTALL_DIR) $(1)/usr/share/icons/hicolor
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/hicolor/* \
		$(1)/usr/share/icons/hicolor/
endef

$(eval $(call BuildPackage,libxfcegui4))
