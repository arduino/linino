# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lilo
PKG_VERSION:=22.7.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).src.tar.gz
PKG_SOURCE_URL:=ftp://metalab.unc.edu/pub/Linux/system/boot/lilo/
PKG_MD5SUM:=
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/lilo
  SECTION:=base
  CATEGORY:=Boot Loaders
  DEPENDS:=@LINUX_2_6_X86||LINUX_2_4_X86
  TITLE:=lilo
  URL:=ftp://metalab.unc.edu/pub/Linux/system/boot/lilo/
endef

define Package/lilo/conffiles
/etc/lilo.conf
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) alles
endef

define Package/lilo/install
	install -d -m0755 $(1)/sbin
	$(CP) $(PKG_BUILD_DIR)/lilo.static $(1)/sbin/lilo
	install -d -m0755 $(1)/etc
	$(CP) ./files/lilo.conf $(1)/etc/
	$(CP) ./files/boot.msg $(1)/etc/
endef

$(eval $(call BuildPackage,lilo))

$(foreach command, as86 ld86, \
  $(eval $(call RequireCommand,$(command), \
   $(PKG_NAME) requires $(command). \
  )) \
)
