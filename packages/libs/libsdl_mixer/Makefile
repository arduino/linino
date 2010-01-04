# 
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libsdl-mixer
PKG_VERSION:=1.2.11
PKG_RELEASE:=1

PKG_SOURCE:=SDL_mixer-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.libsdl.org/projects/SDL_mixer/release/
PKG_MD5SUM:=65ada3d997fe85109191a5fb083f248c
PKG_BUILD_DIR:=$(BUILD_DIR)/SDL_mixer-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libsdl-mixer
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Simple DirectMedia Layer Sound Mixer
  URL:=http://www.libsdl.org/projects/SDL_mixer/
  DEPENDS:=+libsdl +libmikmod
endef

define Package/libsdl-mixer/description
  SDL_mixer is a sample multi-channel audio mixer library.
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/SDL

CONFIGURE_ARGS += \
	--with-sdl-exec-prefix=$(PKG_BUILD_DIR)

define Build/Configure
	$(INSTALL_DIR) $(PKG_BUILD_DIR)/bin
	$(INSTALL_BIN) ./files/sdl-config $(PKG_BUILD_DIR)/bin/
	$(call Build/Configure/Default)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/SDL $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/SDL/SDL_mixer.h \
		$(1)/usr/include/SDL/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libSDL_mixer*.{a,so*} \
		$(1)/usr/lib/
endef

define Package/libsdl-mixer/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libSDL_mixer*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsdl-mixer))
