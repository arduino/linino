#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pwrtray
PKG_REV:=e93a705d313d1e7b595a0dce5b4ee8940037a799
PKG_VERSION:=$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://git.bu3sch.de/pwrtray.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

PKG_CONFIG_DEPENDS:= \
	CONFIG_PACKAGE_pwrtray-backend \
	CONFIG_PACKAGE_pwrtray

include $(INCLUDE_DIR)/package.mk

define Package/pwrtray-common
  MAINTAINER:=Michael Buesch <mb@bu3sch.de>
  URL:=http://bu3sch.de/gitweb?p=pwrtray.git;a=summary
endef

define Package/pwrtray-backend
  $(call Package/pwrtray-common)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=System power control daemon
  DEPENDS:=+FEATURE_drawing-backend_libX11:libX11
endef

define Package/pwrtray-backend/description
  Tiny system power control daemon.
endef

define Package/pwrtray
  $(call Package/pwrtray-common)
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=Frontend to pwrtray-backend daemon
  DEPENDS:=+pwrtray-backend +qt4 +qt4-gui
endef

define Package/pwrtray/description
  Small system-tray frontend to the power control daemon.
endef

EXTRA_CFLAGS:= \
	-I$(PKG_BUILD_DIR)/tray/moc \
	-I$(STAGING_DIR)/usr/include/QtCore \
	-I$(STAGING_DIR)/usr/include/QtGui

EXTRA_LDFLAGS:= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib/

MAKE_VARS+= \
	MOC="$(STAGING_DIR_HOST)/bin/moc" \
	STRIP="$(STRIP)" \
	$(if $(CONFIG_PACKAGE_libX11),FEATURE_XLOCK=y,FEATURE_XLOCK=n) \
	$(if $(CONFIG_PACKAGE_pwrtray),FEATURE_TRAY=y,FEATURE_TRAY=n)

#MAKE_FLAGS+= \
#	V=1

define Package/pwrtray-backend/install
	$(INSTALL_DIR) $(1)/etc/init.d $(1)/usr/bin $(1)/usr/share
	$(INSTALL_BIN) ./files/etc/init.d/* $(1)/etc/init.d/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/pwrtray-backend $(1)/usr/bin/
	$(if $(CONFIG_PACKAGE_libX11),$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/pwrtray-xlock $(1)/usr/bin/)
	$(if $(CONFIG_PACKAGE_pwrtray),$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/pwrtray $(1)/usr/bin/)
	$(if $(CONFIG_PACKAGE_pwrtray),$(CP) $(PKG_INSTALL_DIR)/usr/share/pwrtray $(1)/usr/share/)
	[ -e $(1)/etc/pwrtray-backendrc ] || \
		$(INSTALL_DATA) ./files/etc/pwrtray-backendrc $(1)/etc/
endef

$(eval $(call BuildPackage,pwrtray-backend))
$(eval $(call BuildPackage,pwrtray))
