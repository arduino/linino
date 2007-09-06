#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$
 
include $(TOPDIR)/rules.mk

PKG_NAME:=kid
PKG_VERSION:=0.9.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.kid-templating.org/dist/0.9.6/dist
PKG_MD5SUM:=31e7156698a6f214b4067afb9e13728f

include $(INCLUDE_DIR)/package.mk
include ../python/python-package.mk

define PyPackage/kid
 TITLE:=XML-based Templating
 URL=http://www.kid-templating.org/
endef

define PyPackage/kid/description
 Kid is a simple template language for XML based vocabularies written in 
 Python.
endef

define PyPackage/kid/filespec
+|$(PYTHON_PKG_DIR)/kid
-|$(PYTHON_PKG_DIR)/kid/test
endef

define Build/Compile
	$(call Build/Compile/PyMod,., \
		install --prefix="$(PKG_INSTALL_DIR)/usr", \
	)
endef

$(eval $(call PyPackage,kid))
