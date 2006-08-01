# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=perl
PKG_VERSION:=5.8.6
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.cpan.org/pub/CPAN/src/5.0 \
	        ftp://ftp.mpi-sb.mpg.de/pub/perl/CPAN/src/5.0 \
	   	ftp://ftp.gmd.de/mirrors/CPAN/src/5.0 \
		ftp://ftp.funet.fi/pub/languages/perl/CPAN/src/5.0
PKG_MD5SUM:=8d4aa4e061fd5bc0c39e4f0a63267880
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/microperl
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A really minimal perl
  DESCRIPTION:=A really minimal perl.\\\
    A perl package without operating-specific functions such as readdir.
  URL:=http://www.perl.com/
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) -f Makefile.micro \
		CC="$(TARGET_CC)" OPTIMIZE="$(TARGET_CFLAGS)"
endef

define Package/microperl/install
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/microperl $(1)/usr/bin/
endef

$(eval $(call BuildPackage,microperl))
