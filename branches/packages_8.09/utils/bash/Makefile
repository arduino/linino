#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=bash
PKG_VERSION:=3.2
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.gnu.org/gnu/bash/
PKG_MD5SUM:=00bfa16d58e034e3c2aa27f390390d30

include $(INCLUDE_DIR)/package.mk

define Package/bash
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=The GNU Bourne Again SHell
  DEPENDS:=+libncurses
  URL:=http://www.gnu.org/software/bash/
endef

define Package/bash/description
	Bash is an sh-compatible command language interpreter that executes 
	commands read from the standard input or from a file. Bash also 
	incorporates useful features from the Korn and C shells (ksh and csh).
endef


define Build/Configure
	$(call Build/Configure/Default, \
		--disable-restricted \
		--without-bash-malloc \
                --bindir=/bin \
	)
endef


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/builtins LDFLAGS_FOR_BUILD= mkbuiltins
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		SHELL="/bin/bash" \
		all install
endef

define Package/bash/postinst
#!/bin/sh
grep bash $${IPKG_INSTROOT}/etc/shells || \
	echo "/bin/bash" >> $${IPKG_INSTROOT}/etc/shells
endef

define Package/bash/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/bash $(1)/bin/
endef

$(eval $(call BuildPackage,bash))

