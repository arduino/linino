#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gphoto2
PKG_VERSION:=2.4.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/gphoto
PKG_MD5SUM:=a0bd7629040735f16e510b63edf386dd

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/gphoto2
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+libgphoto2 +libpopt +libpthread
  TITLE:=Gphoto Digital Camera Control
  URL:=http://www.gphoto.org/
endef

define Package/gphoto2/description
	For downloading and controlling digital cameras
endef

CONFIGURE_ARGS += \
	--without-aalib \
	--without-libiconv-prefix \
	--without-libintl-prefix \

CONFIGURE_VARS += \
	LIBGPHOTO2_CFLAGS="$$$$CFLAGS -I$(STAGING_DIR)/usr/include/gphoto2 $$$$CPPFLAGS" \
	LIBGPHOTO2_LIBS="$$$$LDFLAGS -lgphoto2 -lgphoto2_port -lltdl" \
	LIBEXIF_CFLAGS="$$$$CFLAGS $$$$CPPFLAGS" \
	LIBEXIF_LIBS="$$$$LDFLAGS -lexif" \
	POPT_CFLAGS="$$$$CFLAGS $$$$CPPFLAGS" \
	POPT_LIBS="$$$$LDFLAGS -lpopt" \

define Package/gphoto2/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/gphoto2/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,gphoto2))
