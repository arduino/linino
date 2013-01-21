#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=bcompiler
PECL_LONGNAME:=PHP bytecode Compiler

PKG_VERSION:=1.0.2
PKG_RELEASE:=1
PKG_MD5SUM:=99f76a5ef536d43180b41036a6a13e43

PKG_NAME:=php5-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../php5/pecl.mk

$(eval $(call PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),@BROKEN))
$(eval $(call BuildPackage,$(PKG_NAME)))
