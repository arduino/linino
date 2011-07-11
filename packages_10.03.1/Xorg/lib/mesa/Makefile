#
# Copyright (C) 2008-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=Mesa
PKG_RELEASE:=2
PKG_VERSION:=7.2

PKG_SOURCE_URL:=@SF/mesa3d
PKG_SOURCE:=$(PKG_NAME)Lib-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=04d379292e023df0b0266825cb0dbde5
PKG_FIXUP:=libtool
PKG_BUILD_DEPENDS:=glproto

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL:=1

define Package/libgl-mesa
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  DEPENDS:=+libX11 +libXext +libXfixes +libXdamage +libXxf86vm +libdrm +libexpat
  TITLE:=Mesa OpenGL library
  URL:=http://mesa3d.org
endef

define Package/libglu-mesa
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  DEPENDS:=+libgl-mesa
  TITLE:=Mesa OpenGL utility library
  URL:=http://mesa3d.org
endef

define Package/libgl-mesa-dri/Default
define Package/libgl-mesa-dri-$(1)
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  DEPENDS:=libgl-mesa @DISPLAY_SUPPORT $(if $(findstring swrast,$(1)),,@TARGET_x86)
  TITLE:=mesa dri $(1)
  URL:=http://mesa3d.org
endef
endef

DRIDRIVERS:=i810 i915 i965 mach64 mga r128 r200 r300 radeon s3v \
            savage sis tdfx trident unichrome ffb swrast

$(foreach dri,$(DRIDRIVERS),$(eval $(call Package/libgl-mesa-dri/Default,$(dri))))

STAMP_CONFIGURED:=$(STAMP_CONFIGURED)_$(call confvar,CONFIG_PACKAGE_libgl-mesa \
    CONFIG_PACKAGE_libglu-mesa \
    $(foreach dri,$(DRIDRIVERS),CONFIG_PACKAGE_libgl-mesa-dri-$(dri)))

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-glw \
		--with-driver=dri \
		--with-dri-drivers="$(foreach dri,$(DRIDRIVERS),$(if $(CONFIG_PACKAGE_libgl-mesa-dri-$(dri)),$(dri)))" \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{include/GL,lib/pkgconfig}
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/GL/* \
		$(1)/usr/include/GL

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig
endef

define Package/libgl-mesa/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libGL.so* \
		$(1)/usr/lib/
endef

define Package/libglu-mesa/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libGLU.so* \
		$(1)/usr/lib/
endef

define Package/libgl-mesa-dri/install/Default
define Package/libgl-mesa-dri-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/dri/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/dri/$(1)_dri.so* \
		$$(1)/usr/lib/dri
endef
endef

$(foreach dri,$(DRIDRIVERS),$(eval $(call Package/libgl-mesa-dri/install/Default,$(dri))))

$(eval $(call BuildPackage,libgl-mesa))
$(eval $(call BuildPackage,libglu-mesa))
$(foreach dri,$(DRIDRIVERS),$(eval $(call BuildPackage,libgl-mesa-dri-$(dri))))
