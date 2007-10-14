#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=pyevent
PKG_VERSION:=0.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pyevent.googlecode.com/files/
PKG_MD5SUM:=584912c92d08bf005283fb29a47a6e4d

include $(INCLUDE_DIR)/package.mk
include ../python/python-package.mk

define PyPackage/python-event
 TITLE:=Python interface to libevent
 URL:=http://code.google.com/p/pyevent/
 DEPENDS+= +libevent
endef

define PyPackage/python-event/filespec
+|$(PYTHON_PKG_DIR)/event.so
endef

define Build/Compile
  	$(call Build/Compile/PyMod,., \
		install --prefix="$(PKG_INSTALL_DIR)/usr", \
		LIBEVENT_HOME="$(STAGING_DIR)/usr/lib" \
	)
endef

$(eval $(call PyPackage,python-event))
