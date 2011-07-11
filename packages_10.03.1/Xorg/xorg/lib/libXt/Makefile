#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libXt
PKG_RELEASE:=1
PKG_VERSION:=1.0.7

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/individual/lib/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Xorg/$(PKG_NAME)-$(PKG_VERSION)/
PKG_MD5SUM:=96f3c93434a93186d178b60d4a262496

PKG_FIXUP:=libtool
PKG_INSTALL:=1
PKG_BUILD_DEPENDS:=xproto kbproto

include $(INCLUDE_DIR)/package.mk

define Package/libXt
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  DEPENDS:=+libSM +libX11 +libICE
  TITLE:=libXt
  URL:=http://xorg.freedesktop.org/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-malloc0returnsnull \
		--without-xcb \
		, \
		CC_FOR_BUILD="$(HOSTCC)" \
		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/util \
        CPPFLAGS="$(HOST_CPPFLAGS)"

	$(call Build/Compile/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib/pkgconfig,include/X11/}
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} \
		$(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/X11/* \
		$(1)/usr/include/X11/
endef

define Package/libXt/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libXt))
