#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=batman-adv
PKG_REV:=1439
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=batman-adv-$(PKG_VERSION)
PKG_SOURCE_URL:=http://downloads.open-mesh.net/svn/batman/trunk/
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_KMOD_BUILD_DIR:=$(PKG_BUILD_DIR)/batman-adv-kernelland

PKG_TOOL_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-batctl-install
PKG_TOOL_BUILD_DIR:=$(PKG_BUILD_DIR)/batctl

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define Package/batman-adv/Default
  URL:=http://www.open-mesh.net/
  MAINTAINER:=Marek Lindner <lindner_marek@yahoo.de>
endef

define KernelPackage/batman-adv-kernelland
$(call Package/batman-adv/Default)
  SUBMENU:=Network Support
  DEPENDS:=@LINUX_2_6
  TITLE:=B.A.T.M.A.N. layer 2
  FILES:=$(PKG_KMOD_BUILD_DIR)/batman-adv.$(LINUX_KMOD_SUFFIX)
  AUTOLOAD:=$(call AutoLoad,50,batman-adv)
endef


define KernelPackage/batman-adv-kernelland/description
B.A.T.M.A.N. layer 2
endef

MAKE_BATADV_KERNELLAND_ARGS += \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	ARCH="$(LINUX_KARCH)" \
	PATH="$(TARGET_PATH)" \
	SUBDIRS="$(PKG_KMOD_BUILD_DIR)" \
	LINUX_VERSION="$(LINUX_VERSION)" \
	REVISION="$(PKG_REV)" modules

MAKE_BATCTL_ARGS += \
	CFLAGS="$(TARGET_CFLAGS)" \
	CCFLAGS="$(TARGET_CFLAGS)" \
	OFLAGS="$(TARGET_CFLAGS)" \
	REVISION="$(PKG_REV)" \
	CC="$(TARGET_CC)" \
	NODEBUG=1 \
	UNAME="Linux" \
	INSTALL_PREFIX="$(PKG_INSTALL_DIR)" \
	STRIP="/bin/true" \
	batctl install

define Build/Configure
endef

ifneq ($(DEVELOPER)$(CONFIG_PACKAGE_kmod-batman-adv-kernelland),)
        BUILD_KMOD_ADV = $(MAKE) -C "$(LINUX_DIR)" $(MAKE_BATADV_KERNELLAND_ARGS)
endif

ifneq ($(DEVELOPER)$(CONFIG_PACKAGE_kmod-batman-adv-kernelland),)
        BUILD_BATCTL = $(MAKE) -C $(PKG_TOOL_BUILD_DIR) $(MAKE_BATCTL_ARGS)
endif

define Build/Compile
	cp $(PKG_KMOD_BUILD_DIR)/Makefile.kbuild $(PKG_KMOD_BUILD_DIR)/Makefile
	$(BUILD_KMOD_ADV)
	$(BUILD_BATCTL)
endef

define KernelPackage/batman-adv-kernelland/install
	$(INSTALL_DIR) $(1)/etc/config $(1)/etc/init.d $(1)/usr/sbin
	$(INSTALL_BIN) ./files/etc/init.d/batman-adv-kernelland $(1)/etc/init.d
	$(INSTALL_DATA) ./files/etc/config/batman-adv-kernelland $(1)/etc/config
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/batctl $(1)/usr/sbin/
endef

$(eval $(call KernelPackage,batman-adv-kernelland))
