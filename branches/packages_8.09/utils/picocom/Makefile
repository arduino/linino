# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=picocom
PKG_VERSION:=1.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://efault.net/npat/hacks/picocom/dist/
PKG_MD5SUM:=08fcc5f6bb9e7676a2569386d5ea9f70

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/picocom
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A minimal dumb-terminal emulation program
  URL:=http://efault.net/npat/hacks/picocom/
  SUBMENU:=terminal
endef

define Package/picocom/description
	As its name suggests, picocom is a minimal dumb-terminal emulation 
	program. It is, in principle, very much like minicom, only it's pico 
	instead of mini! It was designed to serve as a simple, manual, modem 
	configuration, testing, and debugging tool. It has also served (quite 
	well) as a low-tech "terminal-window" to allow operator intervention 
	in PPP connection scripts. It could also prove useful in many other 
	similar tasks.
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		picocom
endef

define Package/picocom/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/picocom $(1)/usr/bin/
endef

$(eval $(call BuildPackage,picocom))
