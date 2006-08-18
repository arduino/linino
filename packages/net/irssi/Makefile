# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=irssi
PKG_VERSION:=0.8.10
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://irssi.org/files/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)a.tar.bz2
PKG_MD5SUM:=38e616bccb6a34ff6d91690317c2fa19
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/irssi
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+glib1 +libncurses
  TITLE:=console irc client
  DESCRIPTION:=IRC client for the text console
  URL:=http://irssi.org
endef

define Build/Configure
$(call Build/Configure/Default,--with-perl=no \
--with-glib1 \
--with-gnu-ld \
--with-textui \
--without-terminfo \
--without-bot \
--without-file-offset-size \
--without-ssl \
--disable-ssl \
--disable-ipv6 \
--disable-proxy \
--with-glib-prefix=$(STAGING_DIR)/usr,ac_cv_c_bigendian=no \
ac_cv_sizeof_off_t=8)
endef

define Package/irssi/install	
	mkdir -p $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/src/fe-text/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,irssi))
