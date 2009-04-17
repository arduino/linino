#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=batman-adv
PKG_REV:=1220
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1
PKG_BRANCH:=batman-adv-userspace

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=batman-adv-$(PKG_VERSION)
PKG_SOURCE_URL:=http://downloads.open-mesh.net/svn/batman/trunk/
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_KMOD_BUILD_DIR:=$(PKG_BUILD_DIR)/batman-adv-kernelland

PKG_TOOL_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-battool-install
PKG_TOOL_BUILD_DIR:=$(PKG_BUILD_DIR)/battool

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define Package/batman-adv/Default
  URL:=http://www.open-mesh.net/
  MAINTAINER:=Marek Lindner <lindner_marek@yahoo.de>
endef

define Package/batman-adv-userspace
$(call Package/batman-adv/Default)
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +kmod-tun
  TITLE:=B.A.T.M.A.N. layer 2 routing daemon
endef

define Package/batman-adv-userspace/description
B.A.T.M.A.N. layer 2 routing daemon
endef

define Package/battool
$(call Package/batman-adv/Default)
  SECTION:=net
  CATEGORY:=Network
  TITLE:=B.A.T.M.A.N. layer 2 debug tools
endef

define Package/battool/description
B.A.T.M.A.N. layer 2 debug tools
endef

define KernelPackage/batman-adv-kernelland
$(call Package/batman-adv/Default)
  SUBMENU:=Network Support
  DEPENDS:=@LINUX_2_6
  TITLE:=Kernel routing module for B.A.T.M.A.N. layer 2
  FILES:=$(PKG_KMOD_BUILD_DIR)/batman-adv.$(LINUX_KMOD_SUFFIX)
  AUTOLOAD:=$(call AutoLoad,50,batman-adv)
endef


define KernelPackage/batman-adv-kernelland/description
Kernel routing module for B.A.T.M.A.N. layer 2
endef

MAKE_ARGS += \
	CFLAGS="$(TARGET_CFLAGS)" \
	CCFLAGS="$(TARGET_CFLAGS)" \
	OFLAGS="$(TARGET_CFLAGS)" \
	REVISION="$(PKG_REV)" \
	CC="$(TARGET_CC)" \
	NODEBUG=1 \
	UNAME="Linux" \
	INSTALL_PREFIX="$(PKG_INSTALL_DIR)" \
	STRIP="/bin/true" \
	batmand-adv install
	
MAKE_KMOD_ARGS += \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	ARCH="$(LINUX_KARCH)" \
	PATH="$(TARGET_PATH)" \
	SUBDIRS="$(PKG_KMOD_BUILD_DIR)" \
	LINUX_VERSION="$(LINUX_VERSION)" \
	REVISION="$(PKG_REV)" modules

MAKE_TOOL_ARGS += \
	CFLAGS="$(TARGET_CFLAGS)" \
	CCFLAGS="$(TARGET_CFLAGS)" \
	OFLAGS="$(TARGET_CFLAGS)" \
	REVISION="$(PKG_REV)" \
	CC="$(TARGET_CC)" \
	NODEBUG=1 \
	UNAME="Linux" \
	INSTALL_PREFIX="$(PKG_INSTALL_DIR)" \
	STRIP="/bin/true" \
	battool install

define Build/Configure
endef

ifneq ($(CONFIG_PACKAGE_batman-adv-userspace),n)
	BUILD_ADV = $(MAKE) -C $(PKG_BUILD_DIR)/batman-adv-userspace $(MAKE_ARGS)
endif

ifneq ($(CONFIG_PACKAGE_kmod-batman-adv-kernelland),n)
        BUILD_KMOD_ADV = $(MAKE) -C "$(LINUX_DIR)" $(MAKE_KMOD_ARGS)
endif

ifneq ($(CONFIG_PACKAGE_battool),n)
        BUILD_BATTOOL = $(MAKE) -C $(PKG_TOOL_BUILD_DIR) $(MAKE_TOOL_ARGS)
endif

define Build/Compile
	$(BUILD_ADV)
	cp $(PKG_KMOD_BUILD_DIR)/Makefile.kbuild $(PKG_KMOD_BUILD_DIR)/Makefile
	$(BUILD_KMOD_ADV)
	$(BUILD_BATTOOL)
endef

define Package/batman-adv-userspace/install
	$(INSTALL_DIR) $(1)/usr/sbin $(1)/etc/config $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/batmand-adv $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/etc/init.d/batman-adv-userspace $(1)/etc/init.d
	$(INSTALL_DATA) ./files/etc/config/batman-adv-userspace $(1)/etc/config
endef

define KernelPackage/batman-adv-kernelland/install
	$(INSTALL_DIR) $(1)/etc/config $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/batman-adv-kernelland $(1)/etc/init.d
	$(INSTALL_DATA) ./files/etc/config/batman-adv-kernelland $(1)/etc/config
endef

define Package/battool/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/battool $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,batman-adv-userspace))
$(eval $(call BuildPackage,battool))
$(eval $(call KernelPackage,batman-adv-kernelland))
