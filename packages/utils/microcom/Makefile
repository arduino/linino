# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=microcom
PKG_VERSION:=1.02
PKG_XVERSION:=102
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=m$(PKG_XVERSION).tar.gz
PKG_SOURCE_URL:=http://microcom.port5.com/
PKG_MD5SUM:=c7817035dc41cb02e7cfb565cf9b7401

include $(INCLUDE_DIR)/package.mk

define Package/microcom
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A serial terminal  emulation program
  DESCRIPTION:=A serial terminal  emulation program.\\\
    microcom is a minicom-like serial terminal emulator with scripting \\\
    support.
  URL:=http://microcomlinux.homestead.com/
endef

define Build/Prepare
	rm -rf $(PKG_BUILD_DIR)
	mkdir -p $(PKG_BUILD_DIR)
	# the .tar.gz is different - no subdirectory, so do this manually
	zcat $(DL_DIR)/$(PKG_SOURCE) | tar -C $(PKG_BUILD_DIR) $(TAR_OPTIONS) -
endef

define Build/Configure
	$(CP) $(PKG_BUILD_DIR)/Makefile  $(PKG_BUILD_DIR)/Makefile.tmp
	sed 's~gcc~$$(CC)~' $(PKG_BUILD_DIR)/Makefile.tmp > $(PKG_BUILD_DIR)/Makefile
endef

define Package/microcom/install
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/microcom $(1)/usr/bin
endef

$(eval $(call BuildPackage,microcom))
