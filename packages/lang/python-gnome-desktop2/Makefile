#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gnome-python-desktop
PKG_VERSION:=2.22.0
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/2.22
PKG_MD5SUM:=504877a973f6abc0788283232cd703cb
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

PKG_INSTALL=1

EXTRA_CFLAGS += \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include \

EXTRA_LDFLAGS += \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

STAMP_CONFIGURED:=$(STAMP_CONFIGURED)_$(call confvar,CONFIG_PACKAGE_python-rsvg CONFIG_PACKAGE_python-wnck)

define Package/python-gnome-desktop/Default
  SECTION:=lang
  SUBMENU:=Python
  CATEGORY:=Languages
  TITLE:=$(1) python bindings
  URL:=http://ftp.gnome.org/
  DEPENDS:=+python-mini python-gtk $(2)
endef

define Package/python-rsvg
	$(call Package/python-gnome-desktop/Default,librsvg,+librsvg +pycairo)
endef

define Package/python-wnck
	$(call Package/python-gnome-desktop/Default,libwnck,+libwnck)
endef

define Build/Configure
	$(call Build/Configure/Default, \
		$(if $(CONFIG_PACKAGE_python-rsvg), --enable-rsvg, --disable-rsvg) \
		$(if $(CONFIG_PACKAGE_python-wnck), --enable-wnck, --disable-wnck) \
	)
endef

MAKE_INSTALL_FLAGS += \
	PYGTK_DEFSDIR="$(PKG_INSTALL_DIR)/usr/share/pygtk/2.0/defs"

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc \
		$(1)/usr/lib/pkgconfig/

	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/gtk-2.0
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/gtk-2.0/*.{a,la,so} \
		$(1)$(PYTHON_PKG_DIR)/gtk-2.0/
endef

define Package/python-gnome-desktop/install/Default
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/gtk-2.0
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/gtk-2.0/$(2).so \
		$(1)$(PYTHON_PKG_DIR)/gtk-2.0/
endef

define Package/python-rsvg/install
	$(call Package/python-gnome-desktop/install/Default,$(1),rsvg)
endef

define Package/python-wnck/install
	$(call Package/python-gnome-desktop/install/Default,$(1),wnck)
endef

$(eval $(call BuildPackage,python-rsvg))
$(eval $(call BuildPackage,python-wnck))

