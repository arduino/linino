#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=pecl_http
PECL_LONGNAME:=Extended HTTP Support

PKG_VERSION:=1.7.4
PKG_RELEASE:=1
PKG_MD5SUM:=288bae57b89d8de4bdd7d7dc5954cf8c

PKG_NAME:=php5-pecl-http
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../php5/pecl.mk

CONFIGURE_ARGS+= \
	--enable-http=shared \
	--without-http-shared-deps \
	--with-http-curl-requests="$(STAGING_DIR)/usr" \

$(eval $(call PECLPackage,http,$(PECL_LONGNAME),+libcurl +librt +php5-mod-iconv +php5-mod-session))
$(eval $(call BuildPackage,$(PKG_NAME)))
