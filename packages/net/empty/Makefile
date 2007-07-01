#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=empty
PKG_VERSION:=0.6.11b
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=@SF/empty
PKG_MD5SUM:=fb2c06de44ba37ea98b0be8296b89953
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/empty
  SECTION:=net
  CATEGORY:=Network
  TITLE:=run applications under pseudo-terminal (PTY) sessions.
  DESCRIPTION:=\
  	run applications under pseudo-terminal (PTY) sessions. Replace TCL/Expect with a simple tool\\\
	and use your favorite shell (sh, bash, csh, tcsh, ksh, zsh, etc)
  URL:=http://empty.sourceforge.net
endef

define Package/empty/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,empty))
