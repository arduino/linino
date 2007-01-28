# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=wget
PKG_VERSION:=1.10.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/$(PKG_NAME)
PKG_MD5SUM:=795fefbb7099f93e2d346b026785c4b8
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/wget
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl
  TITLE:=Non-interactive network downloader
  DESCRIPTION:=\
	Wget is a network utility to retrieve files from the Web \\\
	using http and ftp, the two most widely used Internet \\\
	protocols. It works non-interactively, so it will work in \\\
	the background, after having logged off. The program supports \\\
	recursive retrieval of web-authoring pages as well as ftp \\\
	sites -- you can use wget to make mirrors of archives and \\\
	home pages or to travel the Web like a WWW robot.
  URL:=http://www.gnu.org/software/wget/index.html
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-rpath \
		--with-ssl \
		--with-libssl-prefix="$(STAGING_DIR)/usr" \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/wget/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/wget $(1)/usr/bin/
endef

# FIXME: check if busybox really provides a wget applet
define Package/wget/postrm
!/bin/sh
ln -sf ../../bin/busybox $${IPKG_INSTROOT}/usr/bin/wget
endef

$(eval $(call BuildPackage,wget))
