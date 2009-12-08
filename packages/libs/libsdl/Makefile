# 
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libsdl
PKG_VERSION:=1.2.14
PKG_RELEASE:=1

PKG_SOURCE:=SDL-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.libsdl.org/release/
PKG_MD5SUM:=e52086d1b508fa0b76c52ee30b55bec4
PKG_BUILD_DIR:=$(BUILD_DIR)/SDL-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libsdl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Simple DirectMedia Layer
  URL:=http://www.libsdl.org
  DEPENDS:=+DirectFB
endef

define Package/libsdl/description
 SDL is a library that allows programs portable low level access to a video
 framebuffer, audio output, mouse, and keyboard.
endef

CONFIGURE_ARGS += \
	--without-x

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/SDL* \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libSDL*.{a,so*} \
		$(1)/usr/lib/
endef

define Package/libsdl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libSDL*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsdl))
