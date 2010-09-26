#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pwrtray
PKG_REV:=5f61c465b6f14909cda0d18bf9ccf5bb34d86e5b
PKG_VERSION:=$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://git.bu3sch.de/pwrtray.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/pwrtray
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=pwrtray
  URL:=http://bu3sch.de/gitweb?p=pwrtray.git;a=summary
  DEPENDS:=+qt4 +qt4-gui
endef

define Package/pwrtray/description
  Tiny power control tray application.
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
	STRIP="$(STRIP)"

#MAKE_FLAGS+= \
#	V=1

define Package/pwrtray/install
	$(INSTALL_DIR) $(1)/etc/init.d $(1)/usr/bin $(1)/usr/share
	$(INSTALL_BIN) ./files/etc/init.d/* $(1)/etc/init.d/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/pwrtray-backend $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/pwrtray $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/pwrtray $(1)/usr/share/
	[ -e $(1)/etc/pwrtray-backendrc ] || \
		$(INSTALL_DATA) ./files/etc/pwrtray-backendrc $(1)/etc/
endef

$(eval $(call BuildPackage,pwrtray))
