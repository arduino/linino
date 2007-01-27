#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=pwgen
PKG_VERSION:=2.05
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/pwgen
PKG_MD5SUM:=b94546a346cb352054ea2d3d09f7f885
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/pwgen
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Automatic Password generator
  DESCRIPTION:=\
	pwgen generates random, meaningless but pronounceable passwords. \\\
	These passwords contain either only lowercase letters, or upper \\\
	and lower case mixed, or digits thrown in. \\\
	Uppercase letters and digits are placed in a way that eases \\\
	remembering their position when memorizing only the word. \\\
	\\\
	E.g. to generate a WPA preshared-key do: \\\
	    pwgen -c -n -s 63 1
  URL:=http://sourceforge.net/projects/pwgen/
endef

# uses GNU configure

define Package/pwgen/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/pwgen $(1)/usr/bin/
endef

$(eval $(call BuildPackage,pwgen))
