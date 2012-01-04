#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=xtables-addons
PKG_VERSION:=1.31
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_MD5SUM:=97ac895a67df67c28def98763023d51b
PKG_SOURCE_URL:=@SF/xtables-addons
PKG_BUILD_DEPENDS:=iptables
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/xtables-addons
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Firewall
  TITLE:=Extensions not distributed in the main Xtables
  URL:=http://xtables-addons.sourceforge.net/
endef

# uses GNU configure

CONFIGURE_ARGS+= \
	--with-kbuild="$(LINUX_DIR)" \
	--with-xtables="$(STAGING_DIR)/usr" \
	--with-xtlibdir="/usr/lib/iptables" \

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		DEPMOD="/bin/true" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		all
endef

define Build/Install
	$(MAKE) -C $(PKG_BUILD_DIR) \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		DEPMOD="/bin/true" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		install
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
    CATEGORY:=Network
    TITLE:=$(2) iptables extension
    DEPENDS:=iptables $(if $(4),+kmod-ipt-$(1))
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
    DEPENDS:=kmod-ipt-core $(6)
    FILES:=$(foreach mod,$(4),$(PKG_BUILD_DIR)/extensions/$(mod).$(LINUX_KMOD_SUFFIX))
    AUTOLOAD:=$(call AutoLoad,$(5),$(notdir $(4)))
  endef

  $$(eval $$(call KernelPackage,ipt-$(1)))
 endif

endef

#$(eval $(call BuildTemplate,SUFFIX,DESCRIPTION,EXTENSION,MODULE,PRIORITY,DEPENDS))
$(eval $(call BuildTemplate,compat-xtables,API compatibilty layer,,compat_xtables,45,))
$(eval $(call BuildTemplate,chaos,CHAOS,xt_CHAOS,xt_CHAOS,47,+kmod-ipt-compat-xtables +kmod-ipt-delude +kmod-ipt-tarpit))
$(eval $(call BuildTemplate,condition,Condition,xt_condition,xt_condition,46,))
$(eval $(call BuildTemplate,delude,DELUDE,xt_DELUDE,xt_DELUDE,46,+kmod-ipt-compat-xtables))
$(eval $(call BuildTemplate,tarpit,TARPIT,xt_TARPIT,xt_TARPIT,46,+kmod-ipt-compat-xtables))
#$(eval $(call BuildTemplate,tee,TEE,xt_TEE,xt_TEE,46,+kmod-ipt-compat-xtables))
$(eval $(call BuildTemplate,ipp2p,IPP2P,xt_ipp2p,xt_ipp2p,46,))
$(eval $(call BuildTemplate,rawpost,RAWPOST,,iptable_rawpost $(if $(CONFIG_IPV6),ip6table_rawpost),50,+kmod-ipt-compat-xtables))
$(eval $(call BuildTemplate,rawnat,RAWNAT,xt_RAWDNAT xt_RAWSNAT,xt_RAWNAT,46,+kmod-ipt-compat-xtables))
$(eval $(call BuildTemplate,nathelper-rtsp,RTSP Conntrack and NAT,,rtsp/nf_conntrack_rtsp rtsp/nf_nat_rtsp,46,+kmod-ipt-conntrack-extra))
