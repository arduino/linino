#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=irssi
PKG_VERSION:=0.8.14
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://irssi.org/files/
PKG_MD5SUM:=00efe7638dd596d5930dfa2aeae87b3a

include $(INCLUDE_DIR)/package.mk

define Package/irssi/Default
  SUBMENU:=Instant Messaging
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+glib2 +libncurses
  TITLE:=console irc client
  URL:=http://irssi.org/
endef

define Package/irssi/Default/description
	Irssi is a terminal based IRC client for UNIX systems.
endef

define Package/irssi
$(call Package/irssi/Default)
  TITLE+= (without OpenSSL support)
endef

define Package/irssi/description
$(call Package/irssi/Default/description)
 This package is built without OpenSSL support.
endef

define Package/irssi-openssl
$(call Package/irssi/Default)
  TITLE+= (with OpenSSL support)
  DEPENDS+= +libopenssl
endef

define Package/irssi-openssl/description
$(call Package/irssi/Default/description)
 This package is built with OpenSSL support.
endef

define Build/Template

$(STAMP_BUILT)-$(2): $(STAMP_PREPARED)
	-$(MAKE) -C $(PKG_BUILD_DIR) clean
	$(call Build/Configure/Default, \
		--with-perl=no \
		--with-glib-prefix="$(STAGING_DIR)/usr" \
		--with-textui \
		--without-terminfo \
		--without-bot \
		--disable-proxy \
		$(3))
	$(MAKE) -C $(PKG_BUILD_DIR)
	( cd $(PKG_BUILD_DIR); mv -f src/fe-text/irssi $(PKG_NAME)-$(2) )
	touch $$@

$(STAMP_BUILT): $(STAMP_BUILT)-$(2)

define Package/$(1)/install
	$(INSTALL_DIR) $$(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME)-$(2)  $$(1)/usr/bin/$(PKG_NAME)
endef
endef

EXTRA_CFLAGS+=$(TARGET_CPPFLAGS) -I$(STAGING_DIR)/usr/lib/libiconv/include -I$(STAGING_DIR)/usr/lib/libintl/include
EXTRA_LDFLAGS+=-L$(STAGING_DIR)/usr/lib/libiconv/lib -L$(STAGING_DIR)/usr/lib/libintl/lib -lncurses

ifneq ($(SDK)$(CONFIG_PACKAGE_irssi),)
  define Build/without-ssl
    $(call Build/Template,irssi,without-ssl, \
		--without-ssl \
		--disable-ssl \
    )
  endef
endif
$(eval $(Build/without-ssl))

ifneq ($(SDK)$(CONFIG_PACKAGE_irssi-openssl),)
  define Build/with-openssl
    $(call Build/Template,irssi-openssl,with-openssl, \
        --with-ssl="$(STAGING_DIR)/usr" \
    )
  endef
endif
$(eval $(Build/with-openssl))

$(eval $(call BuildPackage,irssi))
$(eval $(call BuildPackage,irssi-openssl))

