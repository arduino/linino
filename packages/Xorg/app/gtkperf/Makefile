#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gtkperf
PKG_RELEASE:=1
PKG_VERSION:=0.40
PKG_SOURCE_URL:=@SF/gtkperf
PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL:=1

define Package/gtkperf
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=+gtk2
  TITLE:=gtkperf
  URL:=http://gtkperf.sourceforge.net
endef

TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include/
TARGET_LDFLAGS+=-L$(STAGING_DIR)/usr/lib/libintl/lib/
TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libiconv/include/
TARGET_LDFLAGS+=-L$(STAGING_DIR)/usr/lib/libiconv/lib/

define Package/gtkperf/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin
endef

$(eval $(call BuildPackage,gtkperf))
