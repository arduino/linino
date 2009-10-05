#
# Copyright (C) 2009 David Cooper <dave@kupesoft.com>
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=msmtp
PKG_VERSION:=1.4.18
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/msmtp
PKG_MD5SUM:=74f80b41c058a0ee34819d6bf5ff3b1a

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/msmtp/Default
  SECTION:=mail
  CATEGORY:=Mail
  TITLE:=Simple sendmail SMTP forwarding
  URL:=http://msmtp.sourceforge.net/
endef

define Package/msmtp/Default/conffiles
/etc/msmtprc
endef

define Package/msmtp/Default/description
 msmtp is an SMTP client. In the default mode, it transmits a mail to
 an SMTP server (for example at a free mail provider) which does the
 delivery. To use this program with your mail user agent (MUA), create
 a configuration file with your mail account(s) and tell your MUA to
 call msmtp instead of /usr/sbin/sendmail.
endef

define Package/msmtp
$(call Package/msmtp/Default)
  DEPENDS+= +libopenssl
  TITLE+= (with SSL support)
endef

define Package/msmtp/conffiles
$(call Package/msmtp/Default/conffiles)
endef

define Package/msmtp/description
$(call Package/msmtp/Default/description)
 This package is built with SSL support.
endef

define Package/msmtp-nossl
$(call Package/msmtp/Default)
  TITLE+= (without SSL support)
endef

define Package/msmtp-nossl/conffiles
$(call Package/msmtp/Default/conffiles)
endef

define Package/msmtp-nossl/description
$(call Package/msmtp/Default/description)
 This package is built without SSL support.
endef

define Build/Template

$(STAMP_BUILT)-$(2): $(STAMP_PREPARED)
	-$(MAKE) -C $(PKG_BUILD_DIR) clean
	$(call Build/Configure/Default,$(3))
	$(MAKE) -C $(PKG_BUILD_DIR)
	( cd $(PKG_BUILD_DIR)/src; mv -f msmtp msmtp-$(2) )
	touch $$@

$(STAMP_BUILT): $(STAMP_BUILT)-$(2)

define Package/$(1)/install
	$(INSTALL_DIR) $$(1)/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/doc/msmtprc-system.example \
		$$(1)/etc/msmtprc
	$(INSTALL_DIR) $$(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/msmtp-$(2) $$(1)/usr/bin/msmtp
	$(INSTALL_DIR) $$(1)/usr/sbin
	ln -sf /usr/bin/msmtp $$(1)/usr/sbin/sendmail
endef

endef

CONFIGURE_ARGS += \
	--disable-rpath \
	--without-libssl32 \
	--without-libintl \
	--without-libgsasl \
	--without-libidn

ifneq ($(SDK)$(CONFIG_PACKAGE_msmtp),)
  define Build/with-ssl
	$(call Build/Template,msmtp,with-ssl, \
		--with-ssl=openssl \
		--with-libssl-prefix="$(STAGING_DIR)/usr/include" \
	)
  endef
endif
$(eval $(Build/with-ssl))

ifneq ($(SDK)$(CONFIG_PACKAGE_msmtp-nossl),)
  define Build/without-ssl
	$(call Build/Template,msmtp-nossl,without-ssl, \
		--with-ssl=no \
	)
  endef
endif
$(eval $(Build/without-ssl))

$(eval $(call BuildPackage,msmtp))
$(eval $(call BuildPackage,msmtp-nossl))

