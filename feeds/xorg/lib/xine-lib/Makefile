#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=xine-lib
PKG_VERSION:=1.1.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/xine
PKG_MD5SUM:=b1f42602c776bb93e3cbf127e220cbfd

PKG_FIXUP:=libtool
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS+=\
	--enable-static \
	--disable-vcd \
	--disable-imagemagick \
	--disable-flac

XINE_LIB_FLAGS:=\
	LIBFLAC_CFLAGS="" \
	LIBFLAC_LIBS="" \
	X_CFLAGS="" \
	X_LIBS="" \
	XINE_ACFLAGS="" \
	CXXFLAGS="$(TARGET_CFLAGS)"

CONFIGURE_VARS+=$(XINE_LIB_FLAGS)

define Package/xine-lib
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=xine libraries
  DEPENDS:=+libX11 +libXext +alsa-lib +zlib +libfreetype
  URL:=http://www.xine-project.org/
endef

MAKE_FLAGS+=$(XINE_LIB_FLAGS)

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
	$(SED) 's,-I$$$${prefix}/include,-I$(STAGING_DIR)/usr/include/,g' $(1)/usr/bin/xine-config 
	$(SED) 's,-L$$$${exec_prefix}/lib,-L$(STAGING_DIR)/usr/lib/,g' $(1)/usr/bin/xine-config
	$(INSTALL_DIR) $(2)/bin
	mv $(1)/usr/bin/xine-config $(2)/bin
endef

define Package/xine-lib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,xine-lib))
