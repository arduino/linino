# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=netpipe
PKG_VERSION:=3.6.2
PKG_RELEASE:=1

PKG_SOURCE:=NetPIPE_$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.scl.ameslab.gov/netpipe/code
PKG_MD5SUM:=62570140a3617eca4b15b3255d3edbe6
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/NetPIPE_$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/netpipe
  SECTION:=net
  CATEGORY:=Networking
  TITLE:=A Network Protocol Independent Performance Evaluator
  DESCRIPTION:=A Network Protocol Independent Performance Evaluator
  URL:=http://www.scl.ameslab.gov/netpipe/
endef

define Build/Configure
endef

define Package/netpipe/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/NPtcp $(1)/usr/bin/
endef

$(eval $(call BuildPackage,netpipe))
