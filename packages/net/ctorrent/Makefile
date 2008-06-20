#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ctorrent
PKG_VERSION:=dnh3.3.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/dtorrent \
	http://www.rahul.net/dholmes/ctorrent/
PKG_MD5SUM:=59b23dd05ff70791cd6449effa7fc3b6

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/ctorrent/Default
  SUBMENU:=BitTorrent
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+uclibcxx
  TITLE:=console-based BitTorrent client
  URL:=http://www.rahul.net/dholmes/ctorrent/
endef

define Package/ctorrent/Default/description
	CTorrent is a BitTorrent client written in the C programming language,
	known to be a very robust and mature programming language, which produces
	fast and optimized application.
endef

define Package/ctorrent
$(call Package/ctorrent/Default)
  TITLE+= (with builtin SHA-1 support)
endef

define Package/ctorrent/description
$(call Package/ctorrent/Default/description)
 This package is built with builtin (Steve Reid's public-domain) SHA-1 support
endef

define Package/ctorrent-openssl
$(call Package/ctorrent/Default)
  DEPENDS+= +libopenssl
  TITLE+= (with OpenSSL support)
endef

define Package/ctorrent-openssl/description
$(call Package/ctorrent/Default/description)
 This package is built with OpenSSL support.
endef

define Build/Template

$(STAMP_BUILT)-$(2): $(STAMP_PREPARED)
	-$(MAKE) -C $(PKG_BUILD_DIR) clean
	$(call Build/Configure/Default,$(3))
	$(MAKE) -C $(PKG_BUILD_DIR)
	( cd $(PKG_BUILD_DIR); mv -f $(PKG_NAME) $(PKG_NAME)-$(2) )
	touch $$@

$(STAMP_BUILT): $(STAMP_BUILT)-$(2)

define Package/$(1)/install
	$(INSTALL_DIR) $$(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME)-$(2) $$(1)/usr/bin/$(PKG_NAME)
endef

endef

CONFIGURE_VARS += \
	CXX="g++-uc" \
	CXXFLAGS="$$$$CXXFLAGS -fno-rtti" \

ifneq ($(SDK)$(CONFIG_PACKAGE_ctorrent),)
  define Build/with-ssl
    $(call Build/Template,ctorrent,with-ssl, \
	--with-ssl=no \
    )
  endef
endif
$(eval $(Build/with-ssl))

ifneq ($(SDK)$(CONFIG_PACKAGE_ctorrent-openssl),)
  define Build/with-openssl
    $(call Build/Template,ctorrent-openssl,with-openssl, \
	--with-ssl="$(STAGING_DIR)/usr" \
    )  
  endef
endif
$(eval $(Build/with-openssl))

$(eval $(call BuildPackage,ctorrent))
$(eval $(call BuildPackage,ctorrent-openssl))
