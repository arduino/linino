#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=xmail
PKG_VERSION:=1.24
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=http://www.xmailserver.org/
PKG_MD5SUM:=106730bdbaa4fda9e90a7c22df024114
PKG_CAT:=zcat

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/xmail
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+uclibcxx +libopenssl
  TITLE:=advanced, fast and reliable ESMTP/POP3 mail server
  DESCRIPTION:=\
	XMail is an Internet mail server featuring an SMTP, POP3 and finger server. \\\
	It's incredibly easy to set up and has lots of features including : \\\
	multiple domains, virtual users and spam protection.
  URL:=http://www.xmailserver.org/
endef

define Build/Configure
	$(CP) ./files/SysMachine.h $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) -f Makefile.lnx \
		$(TARGET_CONFIGURE_OPTS) \
		LDFLAGS="$(EXTRA_LDFLAGS) -luClibc++ -lssl -lm -lpthread -lcrypto -ldl" \
		WITH_SSL_INCLUDE="$(STAGING_DIR)/usr/include" \
		WITH_SSL_LIB="$(STAGING_DIR)/usr/lib" \
		CPPFLAGS="$(TARGET_CFLAGS)" \
		CXX="$(TARGET_CROSS)g++"
endef

define Package/xmail/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/var/MailRoot/
	$(CP) $(PKG_BUILD_DIR)/MailRoot $(1)/var/
endef

$(eval $(call BuildPackage,xmail))
