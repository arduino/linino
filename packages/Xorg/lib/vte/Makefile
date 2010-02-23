#
# Copyright (C) 2008-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vte
PKG_VERSION:=0.17.4
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/0.17
PKG_MD5SUM:=ec6cb2668db7146eae7cfc48af98f3ed
PKG_FIXUP:=libtool

PKG_BUILD_DEPENDS:=intltool/host

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,$(STAGING_DIR)/mk/python-package.mk)

PKG_INSTALL=1

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include

EXTRA_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

STAMP_CONFIGURED:=$(STAMP_CONFIGURED)_$(call confvar,CONFIG_PACKAGE_vte CONFIG_PACKAGE_python-vte)

define Package/vte
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Virtual Terminal Widget
  URL:=http://developer.gnome.org/arch/gnome/widgets/vte.html
  DEPENDS:=+gtk2 +libncurses +libX11
endef

define Package/python-vte
  SECTION:=lang-python
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Python bindings for vte
  URL:=http://developer.gnome.org/arch/gnome/widgets/vte.html
  DEPENDS:=+python-mini +PACKAGE_python-vte:python-gtk +vte
endef

define Package/vte/description
  VTE is a library (libvte) implementing a terminal emulator widget for GTK+,
  and a minimal sample application (vte) using that.  Vte is mainly used in
  gnome-terminal, but can also be used to embed a console/terminal in games,
  editors, IDEs, etc.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--without-xft2 \
		$(if $(CONFIG_PACKAGE_python-vte),--enable-python,--disable-python) \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/vte
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/vte/*.h \
		$(1)/usr/include/vte/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,la,a} \
		$(1)/usr/lib

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig
endef

define Package/vte/install
	$(INSTALL_DIR) $(1)/usr/share/vte/termcap
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/vte/termcap/* \
		$(1)/usr/share/vte/termcap

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib

	$(INSTALL_DIR) $(1)/usr/lib/vte
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/vte/* \
		$(1)/usr/lib/vte
endef

define Package/python-vte/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/gtk-2.0
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/gtk-2.0/*.so* \
		$(1)$(PYTHON_PKG_DIR)/gtk-2.0
endef

$(eval $(call BuildPackage,vte))
$(eval $(call BuildPackage,python-vte))

