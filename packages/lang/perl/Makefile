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

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.cpan.org/pub/CPAN/src/5.0 \
	        ftp://ftp.mpi-sb.mpg.de/pub/perl/CPAN/src/5.0 \
	   	ftp://ftp.gmd.de/mirrors/CPAN/src/5.0 \
		ftp://ftp.funet.fi/pub/languages/perl/CPAN/src/5.0
PKG_MD5SUM:=8d4aa4e061fd5bc0c39e4f0a63267880

include $(INCLUDE_DIR)/package.mk

define Package/microperl
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=A really minimal perl
  URL:=http://www.perl.com/
endef

define Package/microperl/description
 A perl package without operating-specific functions such as readdir.
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) -f Makefile.micro \
		CC="$(TARGET_CC)" OPTIMIZE="$(TARGET_CFLAGS)"
endef

define Package/microperl/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/microperl $(1)/usr/bin/
endef

$(eval $(call BuildPackage,microperl))

