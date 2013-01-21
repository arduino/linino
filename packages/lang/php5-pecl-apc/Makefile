#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=APC
PECL_LONGNAME:=Alternative PHP Cache

PKG_VERSION:=3.1.13
PKG_RELEASE:=1
PKG_MD5SUM:=c9e47002e3a67ebde3a6f81437c7b6e0

PKG_NAME:=php5-pecl-apc
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../php5/pecl.mk

CONFIGURE_ARGS+= \
	--enable-apc=shared \
	--disable-apc-mmap \

$(eval $(call PECLPackage,apc,$(PECL_LONGNAME),+librt))
$(eval $(call BuildPackage,$(PKG_NAME)))
