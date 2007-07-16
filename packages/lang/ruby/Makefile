#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ruby
PKG_VERSION:=1.8.6
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.ruby-lang.org/pub/ruby/1.8/
PKG_MD5SUM:=e558a0e00ae318d43bf6ff9af452bad2

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/ruby
  SECTION:=lang
  CATEGORY:=Languages
  DEPENDS:=+libruby
  TITLE:=Ruby object-oriented scripting language interpreter
  DESCRIPTION:=\
	Ruby is the interpreted scripting language for quick and \\\
	easy object-oriented programming.  It has many features to \\\
	process text files and to do system management tasks (as in \\\
	perl).  It is simple, straight-forward, and extensible.
  URL:=http://www.ruby-lang.org/
endef

define Package/libruby
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Libraries necessary to run Ruby
  URL:=http://www.ruby-lang.org/
endef

CONFIGURE_ARGS += \
	--enable-shared \
	--disable-ipv6 \
	, \
	ac_cv_func_setpgrp_void=yes

MAKE_FLAGS += \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	SHELL="/bin/bash" \
	all install

define Package/ruby/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ruby $(1)/usr/bin/
endef

define Package/libruby/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libruby.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,ruby))
$(eval $(call BuildPackage,libruby))

$(eval $(call RequireCommand,ruby, \
        $(PKG_NAME) requires ruby installed on the host-system. \
))
