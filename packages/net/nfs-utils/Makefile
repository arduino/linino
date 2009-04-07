#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=nfs-utils
PKG_VERSION:=1.1.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/nfs
PKG_MD5SUM:=2848072a5e53840b9bc520fbb6782b57

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
endef

define Package/nfs-utils/description
Updated mount.nfs command - allows mounting nfs4 volumes
endef

CONFIGURE_ARGS += --disable-gss
TARGET_CFLAGS += -I$(PKG_BUILD_DIR)/lib
TARGET_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/Compile
	$(call Build/Compile/Default, \
		OPT="$(TARGET_CFLAGS)" \
		INSTALLSUID="install -m 4755" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install \
	)
endef

define Package/nfs-utils/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/sbin/mount.nfs $(1)/sbin/
	(cd $(1)/sbin; ln -sf mount.nfs mount.nfs4; ln -sf mount.nfs umount.nfs; ln -sf mount.nfs umount.nfs4)
endef

$(eval $(call BuildPackage,nfs-utils))
