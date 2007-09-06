#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$
 
include $(TOPDIR)/rules.mk

PKG_NAME:=rdiff-backup
PKG_VERSION:=1.0.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://savannah.nongnu.org/download/rdiff-backup/
PKG_MD5SUM:=756b38aaf2602d097cafd08996fb7887

include $(INCLUDE_DIR)/package.mk
-include $(TOPDIR)/package/python/python-package.mk

define PyPackage/rdiff-backup
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Incremental backup utility
  URL:=http://www.nongnu.org/rdiff-backup
  DEPENDS+= +librsync
endef

define PyPackage/rdiff-backup/filespec
+|/usr/bin/rdiff-backup
+|$(PYTHON_PKG_DIR)/rdiff_backup
endef

define Build/Compile
	$(call Build/Compile/PyMod,., \
		build --librsync-dir="$(STAGING_DIR)/usr" , \
	)
	$(call Build/Compile/PyMod,., \
		install --prefix="$(PKG_INSTALL_DIR)/usr", \
	)
endef

$(eval $(call PyPackage,rdiff-backup))
