# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 4091 2006-06-27 00:35:46Z mbm $
#
include $(TOPDIR)/rules.mk

PKG_NAME:=lilo
PKG_VERSION:=22.7.2
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).src.tar.gz
PKG_SOURCE_URL:=ftp://metalab.unc.edu/pub/Linux/system/boot/lilo/
PKG_MD5SUM:=
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/lilo
SECTION:=base
CATEGORY:=X86 Boot Images
TITLE:=lilo
DESCRIPTION:=lilo
URL:=ftp://metalab.unc.edu/pub/Linux/system/boot/lilo/
DEPENDS:=@LINUX_2_6_X86||LINUX_2_4_X86
endef




define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) alles
	$(STRIP) $(PKG_BUILD_DIR)/lilo.static
endef

define Package/lilo/install
	mkdir -p $(1)/sbin
	mkdir -p $(1)/etc/init.d
	mkdir -p $(1)/boot
	$(CP) $(PKG_BUILD_DIR)/lilo.static $(1)/sbin/lilo
	$(CP) lilo.conf $(1)/etc
	$(CP) boot.msg $(1)/etc
	$(CP) S11Pivot $(1)/etc/init.d
endef

$(eval $(call BuildPackage,lilo))
