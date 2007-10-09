#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=pypcap
PKG_VERSION:=1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pypcap.googlecode.com/files
PKG_MD5SUM:=034c3cbbfa81aa19e8f685b767c65764

include $(INCLUDE_DIR)/package.mk
include ../python/python-package.mk

define PyPackage/python-pcap
 TITLE:=Python interface to lipcap
 URL:=http://code.google.com/p/pypcap/
 DEPENDS+= +libpcap
endef

define PyPackage/python-pcap/filespec
+|$(PYTHON_PKG_DIR)/pcap.so
endef

define Build/Compile
	$(call Build/Compile/PyMod,., \
		install --prefix="$(PKG_INSTALL_DIR)/usr", \
		PCAP_HOME="$(STAGING_DIR)/usr" \
	)
endef

$(eval $(call PyPackage,python-pcap))
