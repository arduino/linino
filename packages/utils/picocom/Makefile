# 
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=picocom
PKG_VERSION:=1.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://picocom.googlecode.com/files
PKG_MD5SUM:=426c3d30b82cbc80b0dafdccd6020c6c

include $(INCLUDE_DIR)/package.mk

define Package/picocom
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A minimal dumb-terminal emulation program
  URL:=http://code.google.com/p/picocom/
  SUBMENU:=Terminal
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
		CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		picocom
endef

define Package/picocom/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/picocom $(1)/usr/bin/
endef

$(eval $(call BuildPackage,picocom))
