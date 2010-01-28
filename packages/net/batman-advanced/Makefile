#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=batman-adv
PKG_REV:=1568
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_SUBDIR:=$(PKG_NAME)

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_TOOL_VERSION=$(PKG_REV)

ifneq ($(CONFIG_BATMAN_ADV_DEV),)
	PKG_KMOD_VERSION=060c4d34077550d57cd57c5375dd5f8758391eb5
	PKG_KMOD_FNAME=batman-adv-dev-$(PKG_REV).tar.gz
	PKG_TOOL_URL=http://downloads.open-mesh.org/svn/batman/trunk/batctl
	PKG_TOOL_FNAME:=batctl-dev-$(PKG_TOOL_VERSION).tar.gz
else
	PKG_KMOD_VERSION=1b58d49b4342caabb9624243bc76e037eaac2673
	PKG_KMOD_FNAME=batman-adv-maint-$(PKG_REV).tar.gz
	PKG_TOOL_URL=http://downloads.open-mesh.org/svn/batman/branches/batctl-0.2.x/
	PKG_TOOL_FNAME:=batctl-maint-$(PKG_TOOL_VERSION).tar.gz
endif

PKG_KMOD_BUILD_DIR:=$(PKG_BUILD_DIR)/batman-adv-kernelland
PKG_TOOL_BUILD_DIR:=$(PKG_BUILD_DIR)/batctl

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define Package/batman-adv/Default
  URL:=http://www.open-mesh.org/
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

define KernelPackage/batman-adv-kernelland/config
	source "$(SOURCE)/Config.in"
endef

define KernelPackage/batman-adv-kernelland/description
B.A.T.M.A.N. layer 2
endef

define Download/batman-adv-kernelland
  FILE:=$(PKG_KMOD_FNAME)
  URL:=http://git.open-mesh.org/snapshot/$(PKG_KMOD_VERSION)/
endef
$(eval $(call Download,batman-adv-kernelland))

ifneq ($(DEVELOPER)$(CONFIG_KMOD_BATMAN_ADV_BATCTL),)
define Download/batctl
  FILE:=$(PKG_TOOL_FNAME)
  URL:=$(PKG_TOOL_URL)
  PROTO:=svn
  VERSION:=$(PKG_TOOL_VERSION)
  SUBDIR:=$(PKG_SOURCE_SUBDIR)/batctl
endef
$(eval $(call Download,batctl))
endif

ifneq ($(DEVELOPER)$(CONFIG_KMOD_BATMAN_ADV_BATCTL),)
ifneq ($(DEVELOPER)$(CONFIG_BATMAN_ADV_DEV),)
define Download/batman
  FILE:=batman-$(PKG_REV).tar.gz
  URL:=http://downloads.open-mesh.org/svn/batman/trunk/batman
  PROTO:=svn
  VERSION:=$(PKG_REV)
  SUBDIR:=$(PKG_SOURCE_SUBDIR)/batman
endef
$(eval $(call Download,batman))
endif
endif

define Build/Prepare
	tar xzf "$(DL_DIR)/$(PKG_KMOD_FNAME)" -C "$(PKG_BUILD_DIR)"
ifneq ($(DEVELOPER)$(CONFIG_KMOD_BATMAN_ADV_BATCTL),)
	tar xzf "$(DL_DIR)/$(PKG_TOOL_FNAME)" -C "$(BUILD_DIR)"
ifneq ($(DEVELOPER)$(CONFIG_BATMAN_ADV_DEV),)
	tar xzf "$(DL_DIR)/batman-$(PKG_REV).tar.gz" -C "$(BUILD_DIR)"
endif
endif
	mv "$(PKG_BUILD_DIR)/batman-adv" "$(PKG_KMOD_BUILD_DIR)"
	cp $(PKG_KMOD_BUILD_DIR)/Makefile.kbuild $(PKG_KMOD_BUILD_DIR)/Makefile
	$(call PatchDir,$(PKG_BUILD_DIR),$(PATCH_DIR),)
ifneq ($(CONFIG_BATMAN_ADV_DEV),)
	$(call PatchDir,$(PKG_BUILD_DIR),$(PATCH_DIR)/dev,)
else
	$(call PatchDir,$(PKG_BUILD_DIR),$(PATCH_DIR)/maint,)
endif
endef

MAKE_BATADV_KERNELLAND_ARGS += \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	ARCH="$(LINUX_KARCH)" \
	PATH="$(TARGET_PATH)" \
	$(if $(CONFIG_KMOD_BATMAN_ADV_DEBUG_LOG),EXTRA_CFLAGS="-DCONFIG_BATMAN_ADV_DEBUG") \
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
        BUILD_BATCTL = $(MAKE) -C $(PKG_TOOL_BUILD_DIR) $(MAKE_BATCTL_ARGS)
endif

define Build/Compile
	$(BUILD_KMOD_ADV)
ifneq ($(DEVELOPER)$(CONFIG_KMOD_BATMAN_ADV_BATCTL),)
	$(BUILD_BATCTL)
endif
endef

define Build/Clean
        rm -rf $(PKG_KMOD_BUILD_DIR)
endef

define KernelPackage/batman-adv-kernelland/install
	$(INSTALL_DIR) $(1)/etc/config $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/batman-adv-kernelland $(1)/etc/init.d
	$(INSTALL_DATA) ./files/etc/config/batman-adv-kernelland $(1)/etc/config
ifneq ($(DEVELOPER)$(CONFIG_KMOD_BATMAN_ADV_BATCTL),)
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/batctl $(1)/usr/sbin/
endif
endef

$(eval $(call KernelPackage,batman-adv-kernelland))
