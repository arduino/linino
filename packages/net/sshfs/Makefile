# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=sshfs
PKG_VERSION:=1.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-fuse-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/fuse
PKG_MD5SUM:=e91a2fed1da952a375798408dc6e41a0
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-fuse-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

PKG_BUILD_DEPENDS:=libfuse glib2

include $(INCLUDE_DIR)/package.mk

define Package/sshfs
  TITLE:=SSHFS
  DEPENDS:=+libfuse +fuse-utils +glib2
  SECTION:=net
  CATEGORY:=Network
  DESCRIPTION:=\
	Mount remote system over sftp.
  URL:=http://fuse.sourceforge.net/
endef

CONFIGURE_VARS += \
	SSHFS_CFLAGS=" \
		-D_FILE_OFFSET_BITS=64 \
		-I$(STAGING_DIR)/usr/lib/libintl/include \
		-I$(STAGING_DIR)/usr/lib/libiconv/include \
		-I$(STAGING_DIR)/usr/include/glib-2.0 \
		-I$(STAGING_DIR)/usr/include/glib-2.0/glib" \
	SSHFS_LIBS=" \
		-lglib-2.0 -lintl -liconv -lfuse -pthread \
		-L$(STAGING_DIR)/usr/lib/libintl/lib \
		-L$(STAGING_DIR)/usr/lib/libiconv/lib"
		
define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/sshfs/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/sshfs $(1)/usr/bin/
endef

$(eval $(call BuildPackage,sshfs))
