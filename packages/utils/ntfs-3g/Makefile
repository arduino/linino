#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ntfs-3g
PKG_VERSION:=2010.1.16
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://www.tuxera.com/opensource/
PKG_MD5SUM:=e104c914e8d7d29ee83e63d46afbba25

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/ntfs-3g/common
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=http://www.ntfs-3g.org
  SUBMENU:=Filesystem
  TITLE:=Stable Read/Write NTFS Driver (build options)
endef

define Package/ntfs-3g/description
  ntfs-3g is an NTFS driver, which can create, remove, rename, 
  move files, directories, hard links, and streams; it can read 
  and write files, including streams and sparse files; it can 
  handle special files like symbolic links, devices, and FIFOs; 
  moreover it can also read transparently compressed files. 
endef

define Package/ntfs-3g
  $(call Package/ntfs-3g/common)
  DEPENDS+= +LINUX_2_4:kmod-fuse24 +libpthread +LINUX_2_6:kmod-fuse
  MENU:=1
endef

define Package/externalFUSE
  $(call Package/ntfs-3g/common)
  TITLE:=use external FUSE library (package libfuse)
  DEFAULT:=n
  DEPENDS+=ntfs-3g +libfuse
endef

define Package/externalFUSE/description
  Ntfs-3g by default uses a lite version of FUSE for the ease 
  of use and some special features. If you'd rather like to use 
  the systemwide standard FUSE library activate this option [M|*].
endef

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \

# insert config with external libfuse
ifdef CONFIG_PACKAGE_externalFUSE    
    CONFIGURE_ARGS += --with-fuse=external \
                      CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
                      LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib"
    PKG_RELEASE:=$(PKG_RELEASE)-fuseext
else
    CONFIGURE_ARGS += --with-fuse=internal
    PKG_RELEASE:=$(PKG_RELEASE)-fuseint
endif

CONFIGURE_VARS+= \
        CFLAGS="$(TARGET_CFLAGS)" \
        $(TARGET_CONFIGURE_OPTS) CPPFLAGS='' LDFLAGS=''


define Build/Configure
        (cd $(PKG_BUILD_DIR) ;  \
                $(TARGET_CONFIGURE_OPTS) \
                CFLAGS="$(TARGET_CFLAGS)" \
                ./configure \
                        $(CONFIGURE_ARGS) \
        )
endef

MAKE_ARGS += ARCH="$(LINUX_KARCH)" \
	     CROSS_COMPILE="$(TARGET_CROSS)"

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP)	$(PKG_INSTALL_DIR)/usr/include/ntfs-3g $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP)	$(PKG_INSTALL_DIR)/usr/lib/libntfs-3g.{a,so*} $(1)/usr/lib/
endef

define Package/ntfs-3g/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ntfs-3g $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libntfs-3g.so.* $(1)/usr/lib/
endef

# order matters!!! else a probably missing fuse lib might not be build beforehand
$(eval $(call BuildPackage,externalFUSE))
$(eval $(call BuildPackage,ntfs-3g))

