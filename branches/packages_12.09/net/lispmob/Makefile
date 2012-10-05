#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=lispmob
PKG_REV:=50eeffe971a07e06b2f1b73b0b7a6bc4167e0ab5
PKG_VERSION:=20120417
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/LISPmob/lispmob.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/lisp
  SUBMENU:=Network Support
  TITLE:=LISP Protocol Support
  DEPENDS:=+kmod-lisp-int +kmod-ipv6
  URL:=http://lisp.cisco.com/
  FILES:=$(PKG_BUILD_DIR)/lisp_mod/lisp.ko
  AUTOLOAD:=$(call AutoLoad,51,lisp)
endef

define KernelPackage/lisp/description
  Kernel module for Locator/ID Separation Protocol
endef

define KernelPackage/lisp-int
  SUBMENU:=Network Support
  TITLE:=Logical Interface for LISP
  URL:=http://lisp.cisco.com/
  FILES:=$(PKG_BUILD_DIR)/lisp_int/lisp_int.ko
  AUTOLOAD:=$(call AutoLoad,50,lisp_int)
endef

define KernelPackage/lisp-int/description
  Kernel module for LISP logical interface
endef

define Package/lispd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Locator/ID separation protocol daemon
  URL:=http://lisp.cisco.com/
  DEPENDS:= +librt +libopenssl +confuse +kmod-lisp
endef

define Package/lispd/description
  lispd is the Locator/ID separation protocol daemon
endef

define Package/lispconf
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Tool to query the LISP kernel module
  URL:=http://lisp.cisco.com/
endef

define Package/lispconf/description
  lispconf can be used to query the kernel module for
  information such as map-cache or database contents
endef

include $(INCLUDE_DIR)/kernel-defaults.mk

ifdef CONFIG_PACKAGE_kmod-lisp
  define Build/Compile/lisp
	$(MAKE) $(KERNEL_MAKEOPTS) \
		SUBDIRS="$(PKG_BUILD_DIR)/lisp_mod" \
		modules
  endef
endif

ifdef CONFIG_PACKAGE_kmod-lisp-int
  define Build/Compile/lisp-int
	$(MAKE) $(KERNEL_MAKEOPTS) \
		SUBDIRS="$(PKG_BUILD_DIR)/lisp_int" \
		modules
  endef
endif

ifdef CONFIG_PACKAGE_lispd
  define Build/Compile/lispd
	+$(MAKE_VARS) \
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)/lispd \
		$(MAKE_FLAGS)
  endef
endif

ifdef CONFIG_PACKAGE_lispconf
  define Build/Compile/lispconf
	+$(MAKE_VARS) \
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)/lispconf \
		$(MAKE_FLAGS)
  endef
endif

define Build/Compile
	$(Build/Compile/lisp)
	$(Build/Compile/lisp-int)
	$(Build/Compile/lispd)
	$(Build/Compile/lispconf)
endef

define Package/lispconf/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lispconf/lispconf $(1)/usr/sbin/
endef

define Package/lispd/install
	$(INSTALL_DIR) $(1)/etc $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lispd/lispd $(1)/usr/sbin/
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/lispd/lispd.conf.example $(1)/etc/lispd.conf
endef

$(eval $(call KernelPackage,lisp))
$(eval $(call KernelPackage,lisp-int))
$(eval $(call BuildPackage,lispd))
$(eval $(call BuildPackage,lispconf))
