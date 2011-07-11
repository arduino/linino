#
# Copyright (C) 2008-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gtkperf
PKG_VERSION:=0.40
PKG_RELEASE:=2

PKG_SOURCE_URL:=@SF/gtkperf
PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)
PKG_MD5SUM:=4331dde4bb83865e15482885fcb0cc53

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+=\
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \

define Package/gtkperf
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=+gtk2
  TITLE:=gtkperf
  URL:=http://gtkperf.sourceforge.net
endef

define Package/gtkperf/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin
endef

$(eval $(call BuildPackage,gtkperf))
