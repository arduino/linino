#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=util-macros
PKG_RELEASE:=1
PKG_VERSION:=1.3.0

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/individual/util/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Xorg/$(PKG_NAME)-$(PKG_VERSION)/
PKG_MD5SUM:=0837fe88af7d692308b25815457a3288

include $(INCLUDE_DIR)/package.mk

define Package/util-macros
  SECTION:=xorg-utils
  CATEGORY:=Xorg
  SUBMENU:=utils
  DEPENDS:=
  TITLE:=${PKG_NAME}
  URL:=http://xorg.freedesktop.org/
endef

define Build/Configure
	cd $(PKG_BUILD_DIR); \
		./configure \
			--prefix=${STAGING_DIR} \
			--sysconfdir=/etc \
			--mandir=${STAGING_DIR}/share/man \
			--localstatedir=/var
endef

#define Build/Compile
#	DESTDIR=$(PKG_INSTALL_DIR) $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
#endef

define Build/InstallDev
	$(INSTALL_DIR) $(2)/share/aclocal
	$(CP) $(PKG_BUILD_DIR)/*.m4 $(2)/share/aclocal/
endef

$(eval $(call BuildPackage,util-macros))
