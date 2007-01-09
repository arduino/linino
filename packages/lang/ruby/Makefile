# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ruby
PKG_VERSION:=1.8.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.ruby-lang.org/pub/ruby/1.8/
PKG_MD5SUM:=bd8c2e593e1fa4b01fd98eaf016329bb
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/ruby
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Ruby object-oriented scripting language interpreter
  DESCRIPTION:=\
	Ruby is the interpreted scripting language for quick and \\\
	easy object-oriented programming.  It has many features to \\\
	process text files and to do system management tasks (as in \\\
	perl).  It is simple, straight-forward, and extensible.
  URL:=http://www.ruby-lang.org/
endef

#use Build/Configure/Default

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/ruby/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ruby $(1)/usr/bin/
endef

$(eval $(call BuildPackage,ruby))

$(eval $(call RequireCommand,/usr/bin/ruby, \
        Ruby requires ruby installed on the host-system. \
))
