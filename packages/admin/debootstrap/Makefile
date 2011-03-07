#
# Copyright (C) 2010 Gianluigi Tiesi <sherpya@netfarm.it>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=debootstrap
PKG_VERSION:=1.0.28
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-udeb_$(PKG_VERSION)_all.udeb
PKG_SOURCE_URL:=http://ftp.debian.org/debian/pool/main/d/debootstrap
PKG_MD5SUM:=dee0dc77573d88af80b225d8810ab7a1

#UNPACK_CMD=dpkg-deb --fsys-tarfile $(DL_DIR)/$(PKG_SOURCE) | ( cd $(1) && tar -xf - )
UNPACK_CMD=ar -p "$(DL_DIR)/$(PKG_SOURCE)" data.tar.gz | ( cd $(1) && tar -xzf - )

include $(INCLUDE_DIR)/package.mk

define Package/debootstrap
	SECTION:=admin
	CATEGORY:=Administration
	TITLE:=Bootstrap a basic Debian system
	URL:=http://wiki.debian.org/Debootstrap
	DEPENDS:=+coreutils-chroot
	MAINTAINER:=Gianluigi Tiesi <sherpya@netfarm.it>
endef

define Package/debootstrap/description
 debootstrap is used to create a Debian base system from scratch,
 without requiring the availability of dpkg or apt. It does this by
 downloading .deb files from a mirror site, and carefully unpacking them
 into a directory which can eventually be chrooted into.
endef

define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) ./files/pkgdetails.c -o $(PKG_BUILD_DIR)/usr/share/debootstrap/pkgdetails
endef

define Package/debootstrap/install
	cd $(PKG_BUILD_DIR) && ( $(FIND) usr | cpio -pd $(1) )
endef

$(eval $(call BuildPackage,debootstrap))
