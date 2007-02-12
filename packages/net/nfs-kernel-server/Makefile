# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=nfs-kernel-server
PKG_VERSION:=1.0.7
PKG_RELEASE:=1
PKG_MD5SUM:=8f863120261cd572ad320a9152581e11

PKG_SOURCE_URL:=@SF/nfs
PKG_SOURCE:=nfs-utils-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/nfs-utils-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/nfs-kernel-server
SECTION:=net
CATEGORY:=Network
TITLE:=Kernel NFS server support
DESCRIPTION:=Kernel NFS server support
URL:=http://nfs.sourceforge.net/
endef

define Package/nfs-kernel-server-utils
SECTION:=net
CATEGORY:=Network
TITLE:=NFS server utils
DESCRIPTION:=NFS server utils
URL:=http://nfs.sourceforge.net
DEPENDS:=nfs-kernel-server
endef

define Package/nfs-kernel-server/conffiles
/etc/exports
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-static \
		--enable-shared \
		--disable-nfsv4 \
		--disable-gss \
	)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/nfs-kernel-server/install
	$(INSTALL_DIR) $(1)/etc/init.d $(1)/usr/sbin
	$(INSTALL_DATA) ./files/nfsd.exports $(1)/etc/exports
	$(INSTALL_BIN) ./files/nfsd.init $(1)/etc/init.d/nfsd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/utils/lockd/lockd $(1)/usr/sbin/rpc.lockd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/utils/statd/statd $(1)/usr/sbin/rpc.statd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/utils/nfsd/nfsd $(1)/usr/sbin/rpc.nfsd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/utils/mountd/mountd $(1)/usr/sbin/rpc.mountd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/utils/exportfs/exportfs $(1)/usr/sbin/
endef

define Package/nfs-kernel-server-utils/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/utils/showmount/showmount $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/utils/nfsstat/nfsstat $(1)/usr/sbin
endef

$(eval $(call BuildPackage,nfs-kernel-server))
$(eval $(call BuildPackage,nfs-kernel-server-utils))
