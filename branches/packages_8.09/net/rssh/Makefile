# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=rssh
PKG_VERSION:=2.3.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/rssh
PKG_MD5SUM:=65712f2c06ff5fc6fc783bc8c2e4e1ba

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/rssh
  SECTION:=net
  CATEGORY:=Network
  TITLE:=restricted shell for use with OpenSSH
  URL:=http://www.pizzashack.org/rssh/index.shtml
endef

define Package/rssh/description
	rssh is a restricted shell for use with OpenSSH, allowing only scp and/or sftp.
	It now also includes support for rdist, rsync, and cvs. For example, if you have
	a server which you only want to allow users to copy files off of via scp, without
	providing shell access, you can use rssh to do that.
endef

define Package/rssh/conffiles
/etc/rssh.conf
endef

define Build/Configure
	$(call Build/Configure/Default,\
		--with-sftp-server="/usr/libexec/sftp-server" \
		,\
		ac_cv_func_malloc_0_nonnull=yes \
	)
endef

define Build/Compile
	$(call Build/Compile/Default,\
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all \
	)
endef

define Package/rssh/install
	$(INSTALL_DIR) $(1)/etc/
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/$(PKG_NAME).conf $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/rssh_chroot_helper $(1)/usr/lib/
endef

$(eval $(call BuildPackage,rssh))
