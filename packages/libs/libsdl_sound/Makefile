# 
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libsdl-sound
PKG_VERSION:=1.0.3
PKG_RELEASE:=1

PKG_SOURCE:=SDL_sound-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://icculus.org/SDL_sound/downloads/
PKG_MD5SUM:=aa09cd52df85d29bee87a664424c94b5
PKG_BUILD_DIR:=$(BUILD_DIR)/SDL_sound-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libsdl-sound
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Simple DirectMedia Layer Sound Decoder
  URL:=http://icculus.org/SDL_sound/
  DEPENDS:=+libsdl
endef

define Package/libsdl-sound/description
  SDL_sound is a library that handles the decoding
  of several popular sound file formats, such as .WAV and .MP3.
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/SDL

CONFIGURE_ARGS += \
	--with-sdl-exec-prefix=$(STAGING_DIR)

CONFIGURE_VARS += \
	LIBS="-lSDL -ldirect -ldirectfb -lfusion"

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/SDL $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/SDL/SDL_sound.h \
		$(1)/usr/include/SDL/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libSDL_sound*.{a,so*} \
		$(1)/usr/lib/
endef

define Package/libsdl-sound/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libSDL_sound*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsdl-sound))
