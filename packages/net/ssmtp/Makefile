#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ssmtp
PKG_VERSION:=2.61
PKG_RELEASE:=1
PKG_MD5SUM:=957e6fff08625fe34f4fc33d0925bbc9

PKG_SOURCE_URL:=http://ftp.debian.org/debian/pool/main/s/ssmtp/
PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/ssmtp
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A minimal and secure mail sender
  DESCRIPTION:=A secure, effective and simple way of getting mail off a system to your\\\
	mail hub. It contains no suid-binaries or other dangerous things - no\\\
	mail spool to poke around in, and no daemons running in the background.\\\
	mail is simply forwarded to the configured mailhost. Extremely easy\\\
	configuration.
  URL:=http://packages.debian.org/stable/mail/ssmtp
endef

define Build/Configure
$(call Build/Configure/Default)
endef
	
define Build/Compile
$(call Build/Compile/Default,all)
endef

define Package/ssmtp/install	
	install -m0755 -d $(1)/etc/ssmtp
	install -m0644 $(PKG_BUILD_DIR)/ssmtp.conf $(1)/etc/ssmtp/
	install -m0644 $(PKG_BUILD_DIR)/revaliases $(1)/etc/ssmtp/
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/ssmtp $(1)/usr/sbin/
	ln -sf ssmtp $(1)/usr/sbin/sendmail
endef

$(eval $(call BuildPackage,ssmtp))
