#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xfburn
PKG_VERSION:=0.4.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://goodies.xfce.org/releases/$(PKG_NAME)
PKG_MD5SUM:=621a59415138c191c25e3d30a5ed5742

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/xfburn
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=xfburn
  DEPENDS:=+libxfcegui4 +libexo +libburn +libisofs
endef

define Package/xfburn/install
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

	$(INSTALL_DIR) $(1)/usr/share/Thunar/sendto
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/Thunar/sendto/* \
		$(1)/usr/share/Thunar/sendto/

	$(INSTALL_DIR) $(1)/usr/share/xfburn
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/xfburn/* \
		$(1)/usr/share/xfburn/
endef

$(eval $(call BuildPackage,xfburn))
