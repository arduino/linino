#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fetchmail
PKG_VERSION:=6.3.13
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://download.berlios.de/fetchmail
PKG_MD5SUM:=db792fb311bc358e95ed0437389269ac
PKG_INSTALL=1

include $(INCLUDE_DIR)/package.mk

define Package/fetchmail
  SECTION:=mail
  CATEGORY:=Mail
  TITLE:=Remote mail retriever
  URL:=http://fetchmail.berlios.de/
endef

define Package/fetchmail/description
 Retrieves remote mail via POP/IMAP.
 Very useful in conjunction with mutt.
endef

CONFIGURE_ARGS += \
	--enable-fallback=procmail \
	--without-hesiod

CONFIGURE_VARS += \
	ac_cv_path_procmail=/usr/sbin/procmail

define Package/fetchmail/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/fetchmail $(1)/usr/bin/
endef

$(eval $(call BuildPackage,fetchmail))
