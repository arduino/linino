#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mini-sendmail
PKG_VERSION:=1.3.5
PKG_RELEASE:=1
PKG_MD5SUM:=fff344184e98cff0ea4d817da9d29383

PKG_SOURCE_URL:=http://www.acme.com/software/mini_sendmail/
PKG_SOURCE:=mini_sendmail-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/mini_sendmail-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/mini-sendmail
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A small sendmail-compatible mail forwarder
  DESCRIPTION:=mini_sendmail reads its standard input up to an end-of-file and sends a\\\
copy of the message found there to all of the addresses listed.\\\
The message is sent by connecting to a local SMTP server. This means\\\
mini_sendmail can be used to send email from inside a chroot(2) area.\\\
  URL:=http://www.acme.com/software/mini_sendmail/
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC=$(TARGET_CC) \
		OFLAGS="$(TARGET_CFLAGS)" \
		all
endef

define Package/mini-sendmail/install	
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/mini_sendmail $(1)/usr/sbin/
	ln -sf mini_sendmail $(1)/usr/sbin/sendmail
endef

$(eval $(call BuildPackage,mini-sendmail))
