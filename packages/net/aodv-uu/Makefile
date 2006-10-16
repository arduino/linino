# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 4091 2006-06-27 00:35:46Z mbm $

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=aodv-uu
PKG_VERSION:=0.9.3
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://core.it.uu.se/core/files/
PKG_MD5SUM:=05460543054449cb4b170252a7168c65
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/aodv-uu
  SECTION:=base
  CATEGORY:=Network
  TITLE:=Ad-hoc On-demand Distance Vector Routing
  DESCRIPTION:=\
  	Ad-hoc On-demand Distance Vector Routing
  URL:=http://core.it.uu.se/adhoc/AodvUUImpl
endef

define Package/kmod-aodv-uu
  SECTION:=kernel
  CATEGORY=Kernel drivers
  DEPENDS:=@LINUX_2_6
  TITLE:=kernel module for Ad-hoc On-demand Distance Vector Routing
  DESCRIPTION:=\
  	Ad-hoc On-demand Distance Vector Routing
  URL:=http://core.it.uu.se/adhoc/AodvUUImpl
endef

define Build/Compile
	$(MAKE) -C $(LINUX_DIR) \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		PATCHLEVEL="$(LINUX_VERSION)" \
		KERNDIR="$(LINUX_DIR)" \
		SUBDIRS="$(PKG_BUILD_DIR)/lnx" \
                modules
	$(call Build/Compile/Default, \
		KERNEL_DIR="$(LINUX_DIR)/" \
		KCC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" aodvd \
	)
endef

define Package/aodv-uu/install
	install -m0755 -d $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/aodvd $(1)/usr/sbin
endef

define Package/kmod-aodv-uu/install
	mkdir -p $(1)/etc/modules.d
	install -m0644 ./files/aodv-uu.modules $(1)/etc/modules.d/80-aodv-uu
	install -m0755 -d $(1)/lib/modules/$(LINUX_VERSION)
	$(CP) $(PKG_BUILD_DIR)/lnx/kaodv.$(LINUX_KMOD_SUFFIX) $(1)/lib/modules/$(LINUX_VERSION)/
endef

$(eval $(call BuildPackage,aodv-uu))
$(eval $(call BuildPackage,kmod-aodv-uu))
