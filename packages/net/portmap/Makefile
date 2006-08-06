#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=portmap
PKG_VERSION:=5beta
PKG_RELEASE:=2
PKG_MD5SUM:=781e16ed4487c4caa082c6fef09ead4f

PKG_SOURCE_URL:=ftp://ftp.porcupine.org/pub/security
PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)_$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/portmap
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libwrap
  TITLE:=RPC Portmapper
  DESCRIPTION:=The RPC Portmapper (used by the NFS Server)
  URL:=ftp://ftp.porcupine.org/pub/security
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -DHOSTS_ACCESS -DFACILITY=LOG_DAEMON -DIGNORE_SIGCHLD" \
		WRAP_LIB="-L$(STAGING_DIR)/usr/lib -lwrap" \
		all
endef

define Package/portmap/install	
	install -d -m0755 $(1)/etc/init.d 
	install -m0755 ./files/portmap.init $(1)/etc/init.d/portmap
	ln -sf portmap $(1)/etc/init.d/S59portmap
	install -d -m0755 $(1)/usr/sbin 
	install -m0755 $(PKG_BUILD_DIR)/portmap $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,portmap))
