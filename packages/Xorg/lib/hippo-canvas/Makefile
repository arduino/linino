#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hippo-canvas
PKG_VERSION:=0.3.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/0.3/
PKG_MD5SUM:=9a0f64eb0258a3e8ba710eff9798a7d0
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

PKG_INSTALL:=1

EXTRA_CFLAGS += \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/include/libcroco-0.6 \

STAMP_CONFIGURED:=$(STAMP_CONFIGURED)_$(call confvar,CONFIG_PACKAGE_hippo-canvas CONFIG_PACKAGE_python-hippo-canvas)

define Package/hippo-canvas
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Hippo Canvas
  URL:=http://developer.mugshot.org/wiki/Hippo_Canvas
  DEPENDS:=+librsvg +gtk2 +cairo +libcroco +pango
endef

define Package/hippo-canvas/description
The Hippo Canvas is a Cairo/GObject/GTK+ based canvas, written in C with
support for flexible layout, CSS styling, and initial work on animations.
endef

define Package/python-hippo-canvas
  SECTION:=lang-python
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Python bindings for hippo canvas
  URL:=http://developer.mugshot.org/wiki/Hippo_Canvas
  DEPENDS:=+python-mini +PACKAGE_python-hippo-canvas:python-gtk +PACKAGE_python-hippo-canvas:pycairo +hippo-canvas
endef

define Build/Configure
	$(call Build/Configure/Default, \
		$(if $(CONFIG_PACKAGE_python-hippo-canvas), \
			--enable-python, \
			--disable-python \
		) \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/

	$(INSTALL_DIR) $(1)/usr/include/hippo-canvas-1/hippo/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/hippo-canvas-1/hippo/* \
		$(1)/usr/include/hippo-canvas-1/hippo/
endef

define Package/hippo-canvas/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
endef

define Package/python-hippo-canvas/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/*.so* \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,hippo-canvas))
$(eval $(call BuildPackage,python-hippo-canvas))
