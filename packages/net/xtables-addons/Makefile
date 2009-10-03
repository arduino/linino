#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=xtables-addons
PKG_VERSION:=1.17
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=eca2e3f4f4904814e3a301539876fae6
PKG_SOURCE_URL:=@SF/xtables-addons
PKG_BUILD_DEPENDS:=iptables

include $(INCLUDE_DIR)/package.mk

define Package/xtables-addons
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Extensions not distributed in the main Xtables
  URL:=http://jengelh.medozas.de/projects/xtables/
endef

define Package/ipset
$(call Package/xtables-addons)
  TITLE:=IPset administration utility
  DEPENDS:= @LINUX_2_6 +iptables-mod-ipset
endef

# uses GNU configure

CONFIGURE_ARGS+= \
	--with-kbuild="$(LINUX_DIR)" \
	--with-xtables="$(STAGING_DIR)/usr" \
	--with-xtlibdir="/usr/lib/iptables" \

IPSET_EXT:= \
	ipset_iphash \
	ipset_ipmap \
	ipset_ipporthash \
	ipset_ipportnethash \
	ipset_iptree \
	ipset_iptreemap \
	ipset_macipmap \
	ipset_nethash \
	ipset_portmap \
	ipset_setlist \

IPSET_MOD:= \
	ipset/ip_set \
	ipset/ip_set_iphash \
	ipset/ip_set_ipmap \
	ipset/ip_set_ipporthash \
	ipset/ip_set_iptree \
	ipset/ip_set_iptreemap \
	ipset/ip_set_macipmap \
	ipset/ip_set_nethash \
	ipset/ip_set_portmap \
	ipset/ipt_set \
	ipset/ipt_SET \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		DEPMOD="/bin/true" \
		all install
endef

# 1: extension/module suffix used in package name
# 2: extension/module display name used in package title/description
# 3: list of extensions to package
# 4: list of modules to package
# 5: module load priority
# 6: module depends
define BuildTemplate

 ifneq ($(3),)
  define Package/iptables-mod-$(1)
    $$(call Package/xtables-addons)
    CATEGORY:=Base system
    TITLE:=$(2) iptables extension
    DEPENDS:= @LINUX_2_6 iptables $(if $(4),+kmod-ipt-$(1))
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
 endif

 ifneq ($(4),)
  define KernelPackage/ipt-$(1)
    SUBMENU:=Netfilter Extensions
    TITLE:=$(2) netfilter module
    DEPENDS:= @LINUX_2_6 kmod-ipt-core $(6)
    FILES:=$(foreach mod,$(4),$(PKG_BUILD_DIR)/extensions/$(mod).$(LINUX_KMOD_SUFFIX))
    AUTOLOAD:=$(call AutoLoad,$(5),$(notdir $(4)))
  endef

  $$(eval $$(call KernelPackage,ipt-$(1)))
 endif

endef

define Package/ipset/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/ipset $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,ipset))

#$(eval $(call BuildTemplate,SUFFIX,DESCRIPTION,EXTENSION,MODULE,PRIORITY,DEPENDS))
$(eval $(call BuildTemplate,compat-xtables,API compatibilty layer,,compat_xtables,45,))
$(eval $(call BuildTemplate,chaos,CHAOS,xt_CHAOS,xt_CHAOS,47,+kmod-ipt-compat-xtables +kmod-ipt-delude +kmod-ipt-tarpit))
$(eval $(call BuildTemplate,condition,Condition,xt_condition,xt_condition,46,))
$(eval $(call BuildTemplate,delude,DELUDE,xt_DELUDE,xt_DELUDE,46,+kmod-ipt-compat-xtables))
$(eval $(call BuildTemplate,tarpit,TARPIT,xt_TARPIT,xt_TARPIT,46,+kmod-ipt-compat-xtables))
$(eval $(call BuildTemplate,ipp2p,IPP2P,xt_ipp2p,xt_ipp2p,46,))
$(eval $(call BuildTemplate,ipset,IPset,$(IPSET_EXT),$(IPSET_MOD),46,))
