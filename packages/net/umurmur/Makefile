#
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=umurmur
PKG_VERSION:=0.2.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://umurmur.googlecode.com/files/
PKG_MD5SUM:=e3471fb925dadc60e3b307efe2a1cc80


include $(INCLUDE_DIR)/package.mk

define Package/umurmur/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=uMurmur
  DEPENDS:=+libconfig
  URL:=http://code.google.com/p/umurmur
  MAINTAINER:=Martin Johansson <martin@fatbob.nu>
endef

define Package/umurmur/Default/description
  Minimalistic Mumble server daemon.
endef

define Package/umurmur-openssl
  $(call Package/umurmur/Default)
  TITLE+= (with OpenSSL support)
  DEPENDS+= +libopenssl
endef

define Package/umurmur-openssl/description
  $(call Package/umurmur/Default/description)
  Uses OpenSSL library for SSL and crypto.
endef

define Package/umurmur-polarssl
  $(call Package/umurmur/Default)
  TITLE+= (with PolarSSL support)
  DEPENDS+= +libpolarssl
endef

define Package/umurmur-polarssl/description
  $(call Package/umurmur/Default/description)
  Uses the PolarSSL library for SSL and crypto.
endef

define Build/Compile
endef

define Build/Template

$(STAMP_BUILT)-$(2): $(STAMP_PREPARED)
	-$(MAKE) -C $(PKG_BUILD_DIR)/src clean
	CC="$(TARGET_CC)" \
	CFLAGS="$(3) -DWRT_TARGET -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
	LDFLAGS="$(4) $(TARGET_LDFLAGS)" \
	$(MAKE) -C $(PKG_BUILD_DIR)/src all
	( cd $(PKG_BUILD_DIR)/src; mv -f umurmurd umurmurd-$(2))
	touch $$@

$(STAMP_BUILT): $(STAMP_BUILT)-$(2)

define Package/$(1)/conffiles
/etc/umurmur.conf
endef

define Package/$(1)/install
	$(INSTALL_DIR) $$(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/umurmurd-$(2) $$(1)/usr/bin/umurmurd
	$(INSTALL_DIR) $$(1)/etc
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/openwrt/files/umurmur.conf $$(1)/etc/
	$(INSTALL_DIR) $$(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openwrt/files/umurmur.init $$(1)/etc/init.d/umurmur
	$(INSTALL_DIR) $$(1)/etc/umurmur
endef
endef

ifneq ($(SDK)$(CONFIG_PACKAGE_umurmur-openssl),)
  define Build/with-openssl
    $(call Build/Template,umurmur-openssl,openssl,,-lcrypto -lssl)
  endef
endif
$(eval $(Build/with-openssl))

ifneq ($(SDK)$(CONFIG_PACKAGE_umurmur-polarssl),)
  define Build/with-polarssl
    $(call Build/Template,umurmur-polarssl,polarssl,-DUSE_POLARSSL,-lpolarssl)
  endef
endif
$(eval $(Build/with-polarssl))


$(eval $(call BuildPackage,umurmur-openssl))
$(eval $(call BuildPackage,umurmur-polarssl))
