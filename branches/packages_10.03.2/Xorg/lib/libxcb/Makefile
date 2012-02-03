#
# Copyright (C) 2008-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libxcb
PKG_VERSION:=1.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://xcb.freedesktop.org/dist/
PKG_MD5SUM:=9310b02433273d75d42f10da3c7455aa
PKG_FIXUP:=libtool
PKG_INSTALL:=1
PKG_BUILD_DEPENDS:=xcbproto libpthread-stubs

include $(INCLUDE_DIR)/package.mk

PROTOS:=composite damage dpms glx randr record render res screensaver shape \
        shm sync xevie xf86dri xfixes xinerama xprint xtest xvmc xv

define Package/libxcb
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=libxcb
  DEPENDS:=+libXau +libXdmcp
  URL:=http://xcb.freedesktop.org/
endef

define Package/libxcb/description
libxcb provides an interface to the X Window System protocol, which
replaces the current Xlib interface.
endef

define Package/libxcb-xlib
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=libxcb-xlib
  DEPENDS:=+libxcb
endef

define Package/libxcb-proto/Default
define Package/libxcb-$(1)
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=libxcb-$(1)
  DEPENDS:=+libxcb
endef
endef

$(foreach proto,$(PROTOS),$(eval $(call Package/libxcb-proto/Default,$(proto))))

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib/pkgconfig,include/xcb}
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/xcb/* \
		$(1)/usr/include/xcb/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libxcb/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libxcb.so* \
		$(1)/usr/lib/
endef

define Package/libxcb-xlib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libxcb-xlib.so* \
		$(1)/usr/lib/
endef

define Package/libxcb-proto/install/Default
define Package/libxcb-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libxcb-$(1).so* \
		$$(1)/usr/lib/
endef
endef

$(foreach proto,$(PROTOS),$(eval $(call Package/libxcb-proto/install/Default,$(proto))))

$(eval $(call BuildPackage,libxcb))
$(eval $(call BuildPackage,libxcb-xlib))
$(foreach proto,$(PROTOS),$(eval $(call BuildPackage,libxcb-$(proto))))
