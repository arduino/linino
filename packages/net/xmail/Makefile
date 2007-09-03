#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=xmail
PKG_VERSION:=1.24
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.xmailserver.org/
PKG_MD5SUM:=106730bdbaa4fda9e90a7c22df024114

include $(INCLUDE_DIR)/package.mk

define Package/xmail
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+uclibcxx +libopenssl
  TITLE:=advanced, fast and reliable ESMTP/POP3 mail server
  URL:=http://www.xmailserver.org/
endef

define Package/xmail/description
 XMail is an Internet mail server featuring an SMTP, POP3 and finger server. 
 It's incredibly easy to set up and has lots of features including : 
 multiple domains, virtual users and spam protection.
endef

define Build/Configure
	$(CP) ./files/SysMachine.h $(PKG_BUILD_DIR)/
endef

define Build/Compile
	CFLAGS="$(TARGET_CFLAGS)" \
	$(MAKE) -C $(PKG_BUILD_DIR) -f Makefile.lnx \
		$(TARGET_CONFIGURE_OPTS) \
		LD="\$$$$(CC)" \
		CPPFLAGS="$(TARGET_CPPFLAGS) -I$(STAGING_DIR)/usr/include/uClibc++ -fno-builtin -fno-rtti -nostdinc++" \
		LDFLAGS="$(TARGET_LDFLAGS) -nodefaultlibs -lcrypto -lssl -luClibc++ -ldl -lm -lpthread" \
		all
endef

define Package/xmail/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/var/MailRoot/
	$(CP) $(PKG_BUILD_DIR)/MailRoot $(1)/var/
endef

$(eval $(call BuildPackage,xmail))
