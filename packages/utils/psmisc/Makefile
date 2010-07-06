# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=psmisc
PKG_VERSION:=22.11
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/psmisc
PKG_MD5SUM:=b5d32aa285b75c59dee96d3ea26a4881

include $(INCLUDE_DIR)/package.mk

define Package/psmisc
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses
  TITLE:=proc utilities
  URL:=http://sourceforge.net/projects/psmisc/
endef

define Package/psmisc/description
 psmisc is a set of additional small useful utilities that use
 the proc filesystem: fuser, killall, pstree, and prtstat
endef

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)" \
	CPPFLAGS="$(TARGET_CPPFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS)" \

define Package/psmisc/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/fuser $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/killall $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/pstree $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/prtstat $(1)/usr/bin
endef

$(eval $(call BuildPackage,psmisc))
