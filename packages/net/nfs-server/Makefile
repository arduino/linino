#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=nfs-server
PKG_VERSION:=2.2beta47
PKG_RELEASE:=1
PKG_MD5SUM:=79a29fe9f79b2f3241d4915767b8c511

PKG_SOURCE_URL:=http://ftp.debian.org/debian/pool/main/n/nfs-user-server
PKG_SOURCE:=nfs-user-server_$(PKG_VERSION).orig.tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/nfs-server
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+portmap
  TITLE:=User Space NFS server
  DESCRIPTION:=User Space NFS server
endef

define Build/Configure
$(call Build/Configure/Default)
endef  

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/nfs-server/install	
	install -d -m0755 $(1)/etc
	install -m0644 ./files/nfsd.exports $(1)/etc/exports
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/nfsd.init $(1)/etc/init.d/S60nfsd
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/rpc.* $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,nfs-server))
