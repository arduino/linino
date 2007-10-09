#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=MySQL-python
PKG_VERSION:=1.2.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/mysql-python
PKG_MD5SUM:=532268f02870bea18c1d465e88afff30

include $(INCLUDE_DIR)/package.mk
include ../python/python-package.mk

define PyPackage/python-mysql
 TITLE:=MySQL database adapter for Python
 URL=http://mysql-python.sourceforge.net/
 DEPENDS+= +libmysqlclient
endef

define PyPackage/python-mysql/description
 MySQLdb is an thread-compatible interface to the popular MySQL database 
 server that provides the Python database API.
endef

define PyPackage/python-mysql/filespec
+|$(PYTHON_PKG_DIR)/_mysql.so
+|$(PYTHON_PKG_DIR)/_mysql_exceptions.py*
+|$(PYTHON_PKG_DIR)/MySQLdb
endef

define Build/Compile
	$(call Build/Compile/PyMod,., \
		install --prefix="$(PKG_INSTALL_DIR)/usr", \
	)
endef

$(eval $(call PyPackage,python-mysql))
