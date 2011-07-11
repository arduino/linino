#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xkbcomp
PKG_RELEASE:=2
PKG_VERSION:=1.1.1

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/individual/app
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Xorg/$(PKG_NAME)-$(PKG_VERSION)/
PKG_MD5SUM:=38c387bacdc01038c8ac280588792bcf

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_LDFLAGS+= \
    -Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
    -Wl,-rpath=/usr/lib

define Package/xkbcomp
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=+libX11 +libxkbfile
  TITLE:=xkbcomp
  URL:=http://xorg.freedesktop.org/
endef

define Package/xkbcomp/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/usr/share/xkbdata/compiled
endef

$(eval $(call BuildPackage,xkbcomp))
