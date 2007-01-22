# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=procps
PKG_VERSION:=3.2.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://procps.sourceforge.net
PKG_MD5SUM:=f490bca772b16472962c7b9f23b1e97d
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

PKG_BUILD_DEPENDS:=libncurses

include $(INCLUDE_DIR)/package.mk

define Package/procps
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses
  TITLE:=proc utilities
  DESCRIPTION:=\
	procps is the package that has a bunch of small useful\\\
	utilities that give information about processes using\\\
	the /proc filesystem. The package includes the programs\\\
	ps, top, vmstat, w, kill, free, slabtop, and skill.
  URL:=http://sourceforge.net/projects/procps/
endef

define Build/Configure
endef

define Build/Compile
	$(call Build/Compile/Default, \
		CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
		LDFLAGS="$(EXTRA_LDFLAGS)" \
	)
endef

define Package/procps/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ps/ps $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/pgrep $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/pkill $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/pmap $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/pwdx $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/skill $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/slabtop $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/snice $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tload $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/vmstat $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/w $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/watch $(1)/usr/bin
endef

$(eval $(call BuildPackage,procps))
