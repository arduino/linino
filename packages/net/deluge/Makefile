#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=deluge
PKG_VERSION:=1.2.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.deluge-torrent.org/source/
PKG_MD5SUM:=cec6b48f0abd79ea2cff3815a1124192

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/deluge
  SUBMENU:=BitTorrent
  SECTION:=net
  CATEGORY:=Network
  TITLE:=deluge-daemon
  URL:=http://deluge-torrent.org/
  DEPENDS:=+python +rblibtorrent +python2-chardet +pyxdg +twisted +twisted-web +pyopenssl +distribute
endef

define Package/deluge/config
	config DELUGE_WITH_WEBUI
		bool "Include the web interface"
		select PACKAGE_mako
		default n

	config DELUGE_WITH_GTKUI
		bool "Include the GTK interface"
		depends PACKAGE_pygame
		depends PACKAGE_pygobject
		depends PACKAGE_pygtk
		depends PACKAGE_librsvg
		default n
endef

define Package/deluge/description
  BitTorrent client with a client/server model.
endef

define Package/deluge/conffiles
/etc/config/deluge
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) -a files $(PKG_BUILD_DIR)
	find $(PKG_BUILD_DIR)/files -name 'CVS' -o -name '.svn' -o -name '*~' | $(XARGS) rm -rf
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root=$(PKG_INSTALL_DIR))

	$(if $(CONFIG_DELUGE_WITH_WEBUI),,$(RM) "$(PKG_INSTALL_DIR)/usr/bin/deluge-web" ; \
		$(RM) "$(PKG_INSTALL_DIR)/usr/share/man/man1/deluge-web.1" ; \
		$(RM) -r "$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/deluge/ui/web")

	$(if $(CONFIG_DELUGE_WITH_GTKUI),,$(RM) "$(PKG_INSTALL_DIR)/usr/bin/deluge-gtk" ; \
		$(RM) "$(PKG_INSTALL_DIR)/usr/share/man/man1/deluge-gtk.1" ; \
		$(RM) -r "$(PKG_INSTALL_DIR)/usr/share/applications" ; \
		$(RM) -r "$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/deluge/ui/gtkui")
endef

define Package/deluge/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR) $(1)/usr/bin $(1)/etc/config $(1)/etc/init.d
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)

	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/deluge.init $(1)/etc/init.d/deluge
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/files/deluge.config $(1)/etc/config/deluge

	$(SED) 's,#!$(STAGING_DIR)/host/bin/$(PYTHON),#!/usr/bin/$(PYTHON),' $(1)/usr/bin/*
endef

$(eval $(call BuildPackage,deluge))
