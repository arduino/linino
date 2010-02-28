#
# Copyright (C) 2009 David Cooper <dave@kupesoft.com>
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=msmtp
PKG_VERSION:=1.4.19
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/msmtp
PKG_MD5SUM:=f0afdc943bf7c8a3a3bf3fe1a73072c4

PKG_FIXUP:=libtool

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

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
  VARIANT:=ssl
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
  VARIANT:=nossl
endef

define Package/msmtp-nossl/conffiles
$(call Package/msmtp/Default/conffiles)
endef

define Package/msmtp-nossl/description
$(call Package/msmtp/Default/description)
 This package is built without SSL support.
endef

CONFIGURE_ARGS += \
	--disable-rpath \
	--without-libssl32 \
	--without-libintl \
	--without-libgsasl \
	--without-libidn

MAKE_FLAGS :=

ifeq ($(BUILD_VARIANT),ssl)
	CONFIGURE_ARGS += \
		--with-ssl=openssl \
		--with-libssl-prefix="$(STAGING_DIR)/usr/include"
endif

ifeq ($(BUILD_VARIANT),nossl)
	CONFIGURE_ARGS += \
		--with-ssl=no
endif

define Package/msmtp/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/doc/msmtprc-system.example \
		$(1)/etc/msmtprc
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/msmtp $(1)/usr/bin/msmtp
	$(INSTALL_DIR) $(1)/usr/sbin
	ln -sf /usr/bin/msmtp $(1)/usr/sbin/sendmail
endef

Package/msmtp-nossl/install = $(Package/msmtp/install)

$(eval $(call BuildPackage,msmtp))
$(eval $(call BuildPackage,msmtp-nossl))

