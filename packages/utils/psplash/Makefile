#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=psplash
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://projects.o-hand.com/sources/psplash/
PKG_MD5SUM:=7649b7e0fac573eca2048a2a267e242b

include $(INCLUDE_DIR)/package.mk

define Package/psplash
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=@LINUX_2_6
  TITLE:=A boot splash screen
  URL:=http://projects.o-hand.com/psplash
endef

define Package/psplash/description
PSplash is a userspace graphical boot splash screen.
endef


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/psplash/install
	$(INSTALL_DIR) $(1)/bin
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/bin/psplash \
		$(PKG_INSTALL_DIR)/usr/bin/psplash-write \
		$(1)/bin/
endef


$(eval $(call BuildPackage,psplash))
