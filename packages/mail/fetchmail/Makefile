#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=fetchmail
PKG_VERSION:=6.3.9-rc2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://download.berlios.de/fetchmail
PKG_MD5SUM:=29f338f6a0dbef027b420344fda34580

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

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-fallback=procmail \
		--without-hesiod \
		, \
		ac_cv_path_procmail=/usr/sbin/procmail \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/fetchmail/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/fetchmail $(1)/usr/bin/
endef

$(eval $(call BuildPackage,fetchmail))
