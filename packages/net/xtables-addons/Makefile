#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=xtables-addons
PKG_VERSION:=1.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=578176c969a70858bfc06d9ee3b5dbda
PKG_SOURCE_URL:= \
	http://dev.medozas.de/files/xtables/ \
	http://dev.medozas.de/files/xtables/old

PKG_BUILD_DEPENDS:=iptables

include $(INCLUDE_DIR)/package.mk

define Package/xtables-addons
  SECTION:=net
  CATEGORY:=Base system
  TITLE:=Extensions not distributed in the main Xtables
  URL:=http://jengelh.medozas.de/projects/xtables/
endef


# uses GNU configure

CONFIGURE_ARGS+= \
	--with-kbuild="$(LINUX_DIR)" \
	--with-xtables="$(STAGING_DIR)/usr" \
	--with-xtlibdir="/usr/lib/iptables" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

# 1: extension/module suffix used in package name
# 2: extension/module display name used in package title/description
# 3: list of extensions/modules to package
# 4: module load priority
# 5: module depends
define BuildTemplate

  define Package/iptables-mod-$(1)
    $$(call Package/xtables-addons)
    TITLE:=$(2) iptables extension
    DEPENDS:=iptables +kmod-ipt-$(1)
  endef

  define Package/iptables-mod-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/iptables
	for m in $(3); do \
		$(CP) \
			$(PKG_INSTALL_DIR)/usr/lib/iptables/lib$$$$$$$${m}.so \
			$$(1)/usr/lib/iptables/ ; \
	done
  endef

  $$(eval $$(call BuildPackage,iptables-mod-$(1)))

  define KernelPackage/ipt-$(1)
    SUBMENU:=Netfilter Extensions
    TITLE:=$(2) netfilter module
    DEPENDS:=@LINUX_2_6 kmod-ipt-core $(5)
    FILES:=$(PKG_BUILD_DIR)/extensions/$(3).$(LINUX_KMOD_SUFFIX)
    AUTOLOAD:=$(call AutoLoad,$(4),$(3))
  endef

  $$(eval $$(call KernelPackage,ipt-$(1)))

endef

define KernelPackage/compat-xtables
  SUBMENU:=Netfilter Extensions
  TITLE:=API compatibilty layer module
  DEPENDS:=@LINUX_2_6
  FILES:=$(PKG_BUILD_DIR)/extensions/compat_xtables.$(LINUX_KMOD_SUFFIX)
  AUTOLOAD:=$(call AutoLoad,45,compat_xtables)
endef

$(eval $(call KernelPackage,compat-xtables))

$(eval $(call BuildTemplate,chaos,CHAOS,xt_CHAOS,47,+kmod-compat-xtables +kmod-ipt-delude +kmod-ipt-tarpit))
$(eval $(call BuildTemplate,condition,condition,xt_condition,46))
$(eval $(call BuildTemplate,delude,DELUDE,xt_DELUDE,46,+kmod-compat-xtables))
$(eval $(call BuildTemplate,portscan,portscan,xt_portscan,46))
$(eval $(call BuildTemplate,tarpit,TARPIT,xt_TARPIT,46,+kmod-compat-xtables))
$(eval $(call BuildTemplate,ipp2p,ipp2p,xt_ipp2p,46))
