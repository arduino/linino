
include $(TOPDIR)/rules.mk

PKG_NAME:=nfs-kernel-server
PKG_VERSION:=1.1.5
PKG_RELEASE:=2
PKG_MD5SUM:=2848072a5e53840b9bc520fbb6782b57

PKG_SOURCE_URL:=@SF/nfs
PKG_SOURCE:=nfs-utils-$(PKG_VERSION).tar.bz2

PKG_BUILD_DIR:=$(BUILD_DIR)/nfs-utils-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/nfs-kernel-server/Default
  SECTION:=net
  CATEGORY:=Network
  URL:=http://nfs.sourceforge.net/
endef

define Package/nfs-kernel-server
  TITLE:=Kernel NFS server support
  DEPENDS:=+kmod-fs-nfsd +kmod-fs-nfs +portmap +libwrap +libblkid
endef

define Package/nfs-kernel-server/description
  Kernel NFS server support
endef

define Package/nfs-kernel-server-utils
  TITLE:=NFS server utils
  DEPENDS:=+nfs-kernel-server
endef

define Package/nfs-kernel-server-utils/description
  NFS server utils
endef

define Package/nfs-kernel-server/conffiles
/etc/exports
endef

CONFIGURE_ARGS += \
	--disable-gss \
	--disable-nfsv4 \
	--enable-static \
	--enable-shared

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

define Package/nfs-kernel-server/install
	$(INSTALL_DIR) $(1)/etc/init.d $(1)/usr/sbin
	$(INSTALL_DATA) ./files/nfsd.exports $(1)/etc/exports
	$(INSTALL_BIN) ./files/nfsd.init $(1)/etc/init.d/nfsd
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
