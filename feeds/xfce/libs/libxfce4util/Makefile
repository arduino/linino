#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libxfce4util
PKG_VERSION:=4.6.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://archive.xfce.org/src/xfce/libxfce4util/4.6
PKG_MD5SUM:=eac51d58179cbcadc3f802450a8ec9cd

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/libxfce4util
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=libxfce4util
  DEPENDS:=+glib2
endef

CONFIGURE_ARGS += --with-broken-putenv=no
MAKE_FLAGS += GTKDOC_REBASE=true

define Build/InstallDev
	$(INSTALL_DIR)	$(1)/usr/{lib/pkgconfig,include/xfce4/libxfce4util}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/xfce4/libxfce4util/*.h \
		$(1)/usr/include/xfce4/libxfce4util
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{la,so*,a} \
		$(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libxfce4util/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib

	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/sbin/* \
		$(1)/usr/sbin
endef

$(eval $(call BuildPackage,libxfce4util))
