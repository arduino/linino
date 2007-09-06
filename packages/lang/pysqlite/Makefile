#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=pysqlite
PKG_VERSION:=2.3.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://initd.org/pub/software/pysqlite/releases/2.3/2.3.5/
PKG_MD5SUM:=b4a185e936848370fcc1a5b17755b641

include $(INCLUDE_DIR)/package.mk
include ../python/python-package.mk

define PyPackage/pysqlite
 TITLE:=SQLite database adapter
 URL=http://www.initd.org/tracker/pysqlite/wiki/pysqlite
 DEPENDS+= +libsqlite3
endef

define PyPackage/pysqlite/description
 This package contains an SQLite database adapter for the Python 
 programming language.
endef

define PyPackage/pysqlite/filespec
+|$(PYTHON_PKG_DIR)/pysqlite2
-|$(PYTHON_PKG_DIR)/pysqlite2/test
endef

define Build/Compile
	$(call Build/Compile/PyMod,., \
		install --prefix="$(PKG_INSTALL_DIR)/usr", \
	)
endef

$(eval $(call PyPackage,pysqlite))
