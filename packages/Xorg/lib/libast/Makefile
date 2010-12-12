#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=libast
PKG_VERSION:=0.7
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.eterm.org/download/
PKG_MD5SUM:=a9ec3b2da317f35869316e6d9571d296

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libast
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=libast
  DEPENDS:=+libpcre \
  	+FEATURE_drawing-backend_libX11:libX11 \
  	+FEATURE_drawing-backend_libX11:libXt
endef

CONFIGURE_ARGS+= \
	--with-regexp="pcre" \
	--without-imlib \

ifneq ($(CONFIG_FEATURE_drawing-backend_libX11),)
  CONFIGURE_ARGS+= \
	--with-x \
	--x-includes="$(STAGING_DIR)/usr/include" \
	--x-libraries="$(STAGING_DIR)/usr/lib"
else
  CONFIGURE_ARGS+= \
	--without-x
endif

CONFIGURE_VARS+= \
	dps_cv_snprintf_bug=0 \
	dps_cv_vsnprintf_bug=0 \
	dps_cv_symlink_open_bug=0 \

EXTRA_LDFLAGS+= -Wl,-rpath-link,$(STAGING_DIR)/usr/lib

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/include $(2)/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libast.{la,so*} $(1)/usr/lib/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(2)/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(SED) "s,-I/usr/include,,g" $(2)/bin/libast-config
	$(SED) "s,-L/usr/lib,,g" $(2)/bin/libast-config
	$(SED) "s,-L/usr/X11R6/lib,,g" $(2)/bin/libast-config
endef

define Package/libast/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libast.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libast))
