# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 6582 2007-03-16 20:21:39Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=nfs-utils
PKG_VERSION:=1.1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.sourceforge.net/nfs/
PKG_MD5SUM:=df88c6fe88a26f9797e74cb2d3291a2a

PKG_BUILD_DEPENDS:=libgssapi librpcsecgss libnfsidmap libwrap

include $(INCLUDE_DIR)/package.mk

define Package/nfs-utils/Default
  SECTION:=net
  CATEGORY:=Network
  URL:=http://sourceforge.net/projects/nfs/
endef

define Package/nfs-utils
  $(call Package/nfs-utils/Default)
  DEPENDS:=+libwrap +libevent +libblkid
  TITLE:=updated mount utility (includes nfs4)
  DESCRIPTION:=Updated mount.nfs command - allows mounting nfs4 volumes
endef

CONFIGURE_ARGS += --disable-gss
TARGET_CFLAGS += -I$(PKG_BUILD_DIR)/lib
define Build/Compile
	$(call Build/Compile/Default, \
		OPT="$(TARGET_CFLAGS)" \
		INSTALLSUID="install -m 4755" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install \
	)
endef

define Package/Template
	@if [ \! -f "$(PKG_INSTALL_DIR)/$(1)" ]; then \
		rm -f $(PKG_BUILD_DIR)/.built; \
		$(MAKE) $(PKG_BUILD_DIR)/.built; \
	fi
	$(INSTALL_DIR) $(2)
	$(CP) $(PKG_INSTALL_DIR)/$(1) $(2)/
endef

define Package/nfs-utils/install
        $(call Package/Template,sbin/mount*,$(1)/sbin)
endef

$(eval $(call BuildPackage,nfs-utils))
