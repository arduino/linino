#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=imlib2
PKG_VERSION:=1.4.1
PKG_RELEASE:=4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/enlightenment
PKG_MD5SUM:=16a3d885e523303be794282c0ed90841

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

define Package/imlib2
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Image library
  DEPENDS:=+libX11 +giflib +libtiff +libjpeg +gtk1 +libfreetype +libXext
endef

TARGET_CFLAGS += "-Wl,-rpath-link=$(STAGING_DIR)/usr/lib"

define Build/Configure
	$(call Build/Configure/Default, \
		--x-includes="$(STAGING_DIR)/usr/include/X11" \
		--x-libraries="$(STAGING_DIR)/usr/lib/" \
		--disable-gtktest \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{include,lib/pkgconfig}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{la,so*,a} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/

	$(INSTALL_DIR) $(2)/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/imlib2-config \
		$(2)/bin/
	$(SED) \
		's,^\(prefix\|exec_prefix\)=.*,\1=$(STAGING_DIR)/usr,g' \
		$(2)/bin/imlib2-config
endef

define Package/imlib2/install
	$(INSTALL_DIR) $(1)/usr/lib/imlib2/{loaders,filters}
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/imlib2/filters/*.so* \
		$(1)/usr/lib/imlib2/filters

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/imlib2/loaders/*.so* \
		$(1)/usr/lib/imlib2/loaders
endef

$(eval $(call BuildPackage,imlib2))
