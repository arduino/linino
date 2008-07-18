#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=monit
PKG_VERSION:=4.10.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.tildeslash.com/monit/dist/
PKG_MD5SUM:=d3143b0bbd79b53f1b019d2fc1dae656

include $(INCLUDE_DIR)/package.mk

define Package/monit/Default
  SECTION:=admin
  CATEGORY:=Administration
  DEPENDS:= +libpthread
  TITLE:=System services monitoring utility
  URL:=http://www.tildeslash.com/monit
endef

define Package/monit/Default/description
	An utility for monitoring services on a Unix system
endef

define Package/monit
$(call Package/monit/Default)
  DEPENDS+= +libopenssl
  TITLE+= (with SSL support)
endef

define Package/monit/description
$(call Package/monit/Default/description)
	This package is built with SSL support.
endef

define Package/monit-nossl
$(call Package/monit/Default)
  TITLE+= (without SSL support)
endef

define Package/monit-nossl/description
$(call Package/monit/Default/description)
	This package is built without SSL support.
endef

define Build/Template

$(STAMP_BUILT)-$(2): $(STAMP_PREPARED)
	-$(MAKE) -C $(PKG_BUILD_DIR) clean
	$(call Build/Configure/Default,$(3))
	$(MAKE) -C $(PKG_BUILD_DIR)
	( cd $(PKG_BUILD_DIR); mv -f monit monit-$(2) )
	touch $$@

$(STAMP_BUILT): $(STAMP_BUILT)-$(2)

define Package/$(1)/conffiles
/etc/monitrc
endef

define Package/$(1)/install
	$(INSTALL_DIR) $$(1)/etc
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/monitrc $$(1)/etc/
	$(INSTALL_DIR) $$(1)/etc/init.d
	$(INSTALL_BIN) ./files/monit.init $$(1)/etc/init.d/monit
	$(INSTALL_DIR) $$(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/monit-$(2) $$(1)/usr/sbin/monit
endef

endef

define Build/Configure
endef

define Build/Compile
endef

ifneq ($(SDK)$(CONFIG_PACKAGE_monit),)
  define Build/with-ssl
    $(call Build/Template,monit,with-ssl, \
	--with-ssl \
	--with-ssl-dir="$(STAGING_DIR)/usr" \
    )
  endef
endif
$(eval $(Build/with-ssl))

ifneq ($(SDK)$(CONFIG_PACKAGE_monit-nossl),)
  define Build/without-ssl
    $(call Build/Template,monit-nossl,without-ssl, \
	--without-ssl \
    )  
  endef
endif
$(eval $(Build/without-ssl))

$(eval $(call BuildPackage,monit))
$(eval $(call BuildPackage,monit-nossl))
