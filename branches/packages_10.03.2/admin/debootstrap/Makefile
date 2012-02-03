#
# Copyright (C) 2010 Gianluigi Tiesi <sherpya@netfarm.it>
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=debootstrap
PKG_VERSION:=1.0.30
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-udeb_$(PKG_VERSION)_all.udeb
PKG_SOURCE_URL:=http://ftp.debian.org/debian/pool/main/d/debootstrap
PKG_MD5SUM:=d87b35670aa735ae5b7d3f8bf1b76245

UNPACK_CMD=ar -p "$(DL_DIR)/$(PKG_SOURCE)" data.tar.gz | ( cd $(1) && tar -xzf - )

include $(INCLUDE_DIR)/package.mk

define Package/debootstrap
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=Bootstrap a basic Debian system
  URL:=http://wiki.debian.org/Debootstrap
  DEPENDS:=+coreutils-chroot +coreutils-sha1sum
  MAINTAINER:=Luka Perkov <openwrt@lukaperkov.net>
endef

define Package/debootstrap/description
 debootstrap is used to create a Debian base system from scratch, without
 requiring the availability of dpkg or apt. It does this by downloading .deb
 files from a mirror site, and carefully unpacking them into a directory which
 can eventually be chrooted into. 
endef

define Build/Compile
# file pkgdetails.c was imported from debian package base-installer version 1.119
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) ./files/pkgdetails.c -o $(PKG_BUILD_DIR)/usr/share/debootstrap/pkgdetails
endef

define Package/debootstrap/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/sbin/$(PKG_NAME) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/usr/share/debootstrap
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/share/debootstrap/pkgdetails $(1)/usr/share/debootstrap
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/usr/share/debootstrap/functions $(1)/usr/share/debootstrap
	$(INSTALL_DIR) $(1)/usr/share/debootstrap/scripts
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/usr/share/debootstrap/scripts/* $(1)/usr/share/debootstrap/scripts
endef

$(eval $(call BuildPackage,debootstrap))
