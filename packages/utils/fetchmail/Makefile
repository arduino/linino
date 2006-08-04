#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=fetchmail
PKG_VERSION:=6.2.5
PKG_RELEASE:=1
PKG_MD5SUM:=9956b30139edaa4f5f77c4d0dbd80225

PKG_SOURCE_URL:=http://www.catb.org/~esr/fetchmail/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/fetchmail
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Remote mail retriever
  DESCRIPTION:=Retrieves remote mail via POP/IMAP\\\
	Very useful in conjunction with mutt.
  URL:=http://www.catb.org/~esr/fetchmail/
endef

define Build/Configure
$(call Build/Configure/Default,--enable-fallback=procmail --without-hesiod,ac_cv_c_bigendian=no \
ac_cv_sizeof_off_t=8 \
ac_cv_sizeof_int=4 \
ac_cv_sizeof_long=4 \
ac_cv_path_procmail=/usr/sbin/procmail \
)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/fetchmail/install
	mkdir -p $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,fetchmail))
