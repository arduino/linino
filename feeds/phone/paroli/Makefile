# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=paroli
PKG_VERSION:=20090605
PKG_REV:=120c1aca795fd28b50e361eb908786ed25f98253
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://git.paroli-project.org/paroli.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,$(STAGING_DIR)/mk/python-package.mk)

define Package/paroli
  SECTION:=phone
  CATEGORY:=Phone
  TITLE:=integrated phone application
  DEPENDS:=+python +fso-frameworkd +python-evas +python-ecore +python-edje +python-e_dbus +python-etk +python-elementary +python-expat +dbus-launch-x +dbus-utils
  URL:=http://paroli-project.org
endef

define Package/paroli/description
  Paroli is a phone suite written in Python which uses the FSO (freesmartphone.org) DBus API
endef

define Build/Compile
	$(call Build/Compile/PyMod,,build)
endef

define Package/paroli/install
	$(INSTALL_DIR) \
		$(1)$(PYTHON_PKG_DIR) \
		$(1)/usr/bin \
		$(1)/usr/share/applications/paroli \
		$(1)/usr/share/paroli/services \
		$(1)/usr/share/icons/paroli \
        $(1)/usr/share/elementary/themes \
        $(1)/usr/share/dbus-1/system-services \
        $(1)/etc/dbus-1/system.d \
		$(1)/etc/paroli \
		$(1)/etc/xdg/autostart

    # CORE
	$(CP) \
		$(PKG_BUILD_DIR)/paroli-core/tichy \
		$(1)$(PYTHON_PKG_DIR)/
	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/paroli-scripts/paroli \
		$(1)/usr/bin/
	$(CP) \
		$(PKG_BUILD_DIR)/data/tichy \
		$(1)/usr/share/icons/paroli/parolid.png
	$(CP) \
		./files/desktop-files/parolid.desktop \
		$(1)/etc/xdg/autostart/
	$(CP) \
		$(PKG_BUILD_DIR)/data/paroli.edj \
		$(1)/usr/share/elementary/themes/
	$(CP) \
		./files/paroli.cfg \
		$(1)/etc/paroli/
	$(CP) \
		$(PKG_BUILD_DIR)/data/dbus/tichy.conf \
		$(1)/etc/dbus-1/system.d/
	$(CP) \
		$(PKG_BUILD_DIR)/data/dbus/org.tichy.launcher.service \
		$(1)//usr/share/dbus-1/system-services/

	## COMPONENTS
	## launcher (homescreen)
	$(INSTALL_DIR) $(1)/usr/share/paroli/applications/paroli-launcher2
	$(CP) \
		$(PKG_BUILD_DIR)/paroli-applications/paroli-launcher2/*.{py,edj} \
		$(1)/usr/share/paroli/applications/paroli-launcher2
	# tele2 (dialer)
	$(INSTALL_DIR) $(1)/usr/share/paroli/applications/tele2
	$(CP) \
		$(PKG_BUILD_DIR)/paroli-applications/tele2/*.{py,edj} \
		$(1)/usr/share/paroli/applications/tele2
	$(CP) \
		$(PKG_BUILD_DIR)/data/tichy \
		$(1)/usr/share/icons/paroli/tele.png
	$(CP) \
		./files/desktop-files/tele.desktop \
		$(1)/usr/share/applications/paroli/
	## msgs2 (messages)
	#$(INSTALL_DIR) $(1)/usr/share/paroli/applications/msgs2
	#$(CP) \
	#	$(PKG_BUILD_DIR)/paroli-applications/msgs2/*.{py,edj} \
	#	$(1)/usr/share/paroli/applications/msgs2
	#$(CP) \
	#	$(PKG_BUILD_DIR)/data/tichy \
	#	$(1)/usr/share/icons/paroli/msgs.png
	#$(CP) \
	#	./files/desktop-files/msgs.desktop \
	#	$(1)/usr/share/applications/paroli/
	## people2 (contacts)
	#$(INSTALL_DIR) $(1)/usr/share/paroli/applications/people2
	#$(CP) \
	#	$(PKG_BUILD_DIR)/paroli-applications/people2/*.{py,edj} \
	#	$(1)/usr/share/paroli/applications/people2/
	#$(CP) \
	#	$(PKG_BUILD_DIR)/data/tichy \
	#	$(1)/usr/share/icons/paroli/people.png
	#$(CP) \
	#	./files/desktop-files/people.desktop \
	#	$(1)/usr/share/applications/paroli/
	## i-o2 (incoming/outgoing)
	#$(INSTALL_DIR) $(1)/usr/share/paroli/applications/i-o2
	#$(CP) \
	#	$(PKG_BUILD_DIR)/paroli-applications/i-o2/*.{py,edj} \
	#	$(1)/usr/share/paroli/applications/i-o2/
	#$(CP) \
	#	$(PKG_BUILD_DIR)/data/tichy \
	#	$(1)/usr/share/icons/paroli/i-o.png
	#$(CP) \
	#	./files/desktop-files/i-o.desktop \
	#	$(1)/usr/share/applications/paroli/

	# SERVICES
	$(CP) \
		$(PKG_BUILD_DIR)/paroli-services/{dialog,hardware,phone,gprs,prefs,system} \
		$(1)/usr/share/paroli/services/
endef

$(eval $(call BuildPackage,paroli))
