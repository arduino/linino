#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rsync
PKG_VERSION:=3.0.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://rsync.samba.org/ftp/rsync
PKG_MD5SUM:=16d41aab9ece435198af222c5415a304

include $(INCLUDE_DIR)/package.mk

define Package/rsync
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Fast remote file copy program (like rcp)
  DEPENDS:=+libpopt
  URL:=http://rsync.samba.org/
endef

define Package/rsync/description
	sync is a program that allows files to be copied to
	and from remote machines in much the same way as rcp.
	It has many more options than rcp, and uses the rsync
	remote-update protocol to greatly speed up file
	transfers when the destination file already exists.

	The rsync remote-update protocol allows rsync to
	transfer just the differences between two sets of files
	across the network link.
endef

CONFIGURE_ARGS += \
	--with-included-popt=no \
	--disable-debug \
	--disable-ipv6 \
	--disable-locale \
	--disable-xattr-support \
	--disable-acl-support \

define Package/rsync/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,rsync))
