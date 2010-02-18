#
# Copyright (C) 2008-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
PKG_NAME:=owfs
PKG_VERSION:=2.7p21
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=8aea6f3bb0dc9fdb52ed3f0e9d84fa79

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

#
# templates
#

define Package/$(PKG_NAME)/Default
  TITLE:=OWFS (1-Wire File System)
  URL:=http://owfs.sourceforge.net/
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Filesystem
endef

define Package/$(PKG_NAME)/Default/description
  OWFS is a suite of programs that designed to make the 1-wire bus and its 
  devices easily accessible. The underlying priciple is to create a virtual 
  filesystem, with the unique ID being the directory, and the individual 
  properties of the device are represented as simple files that can be read 
  and written.

  Details of the individual slave or master design are hidden behind a 
  consistent interface. The goal is to provide an easy set of tools for a 
  software designer to create monitoring or control applications. There are 
  some performance enhancements in the implementation, including data caching, 
  parallel access to bus masters, and aggregation of device communication. 
  Still the fundemental goal has been ease of use, flexibility and correctness 
  rather than speed.
endef

define Package/owfs-server
  $(call Package/$(PKG_NAME)/Default)
  DEPENDS:=+libow +libpthread
endef

define Package/owfs/Library
  $(call Package/owfs/Default)
  SECTION:=libs
  CATEGORY:=Libraries
endef

define Package/owfs/Utility
  $(call Package/owfs/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libow
endef

define Package/owfs-server/Install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/$(2) $(1)/usr/bin/
endef


#
# shared libraries
#

define Package/libow
  $(call Package/owfs/Library)
  DEPENDS:=+libusb +libpthread
  TITLE:=OWFS - common shared library
endef

define Package/libow/description
  $(call Package/$(PKG_NAME)/Default/description)
  
  This package contains the OWFS library.
endef

define Package/libow-capi
  $(call Package/owfs/Library)
  DEPENDS:=+libow
  TITLE:=OWFS - C-API library
endef

define Package/libow-capi/description
  $(call Package/$(PKG_NAME)/Default/description)
  
  This package contains the OWFS C-API library.
endef

#
# utilities
#

define Package/owshell
  $(call Package/owfs/Utility)
  TITLE:=OWFS - shell utilities
endef

define Package/owshell/description
  $(call Package/$(PKG_NAME)/Default/description)
  
  This package contains the OWFS shell utilities.
endef

define Package/owfs
  $(call Package/owfs/Utility)
  # libfuse depends on kmod-fuse, no need to declare dependency
  DEPENDS+= +libfuse +fuse-utils
  TITLE:=OWFS - fuse file system
endef

define Package/owfs/description
  $(call Package/$(PKG_NAME)/Default/description)
  
  This package contains the OWFS fuse filesystem.
endef

#
# network daemons
#

define Package/owhttpd
  $(call Package/owfs-server)
  TITLE:=OWFS - http server
endef

define Package/owhttpd/description
  $(call Package/$(PKG_NAME)/Default/description)
  
  This package contains the OWFS http server.
endef

define Package/owftpd
  $(call Package/owfs-server)
  TITLE:=OWFS - ftp server
endef

define Package/owftpd/description
  $(call Package/$(PKG_NAME)/Default/description)
  
  This package contains the OWFS ftp server.
endef

define Package/owserver
  $(call Package/owfs-server)
  TITLE:=OWFS - network server
endef

define Package/owserver/description
  $(call Package/$(PKG_NAME)/Default/description)
  
  This package contains the OWFS network server.
endef

PKG_CONFIGURE_OPTS:= \
		--enable-zero \
		--disable-parport \
		--disable-ownfsd \
		--disable-ownet \
		--disable-owpython \
		--disable-libow-perl \
		--disable-owphp \
		--disable-owtcl \
		--disable-owside \
		--disable-swig

CONFIGURE_ARGS += \
	--prefix=/usr \
	--exec-prefix=/usr \
	--enable-owftpd \
	--enable-owserver \
	--enable-owhttpd \
	--enable-owfs \
	--with-fuseinclude="$(STAGING_DIR)/usr/include" \
	--with-fuselib="$(STAGING_DIR)/usr/lib" \
	$(PKG_CONFIGURE_OPTS) \
	--enable-shared \
	--disable-rpath

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		rm -rf config.{status,cache} ; \
		./bootstrap ; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="$(TARGET_CPPFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS) -Wl,-rpath-link=$(STAGING_DIR)/usr/lib -Wl,-rpath-link=$(TOOLCHAIN_DIR)/usr/lib" \
		lt_cv_sys_lib_dlsearch_path_spec="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
		lt_cv_sys_lib_search_path_spec="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
		shrext_cmds=".so" \
		./configure \
			$(CONFIGURE_ARGS) \
	);
endef

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR)/usr/include
	$(CP)	$(PKG_INSTALL_DIR)/usr/include/{owcapi,owfs_config}.h $(STAGING_DIR)/usr/include/
	$(INSTALL_DIR) $(STAGING_DIR)/usr/lib
	$(CP)	$(PKG_INSTALL_DIR)/usr/lib/libow-*.so* $(PKG_INSTALL_DIR)/usr/lib/libowcapi-*.so* $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/include/{libow-capi,owfs_config}.h \
		$(STAGING_DIR)/usr/lib/libow-capi-*.so* \
		$(STAGING_DIR)/usr/lib/libow-*.so*
endef


define Package/owfs/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/owfs $(1)/usr/bin/
endef

define Package/owshell/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/owread $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/owwrite $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/owdir $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/owpresent $(1)/usr/bin/
endef


define Package/owserver/install
	$(call Package/owfs-server/Install,$(1),owserver,70)
endef

define Package/owhttpd/install
	$(call Package/owfs-server/Install,$(1),owhttpd,80)
endef

define Package/owftpd/install
	$(call Package/owfs-server/Install,$(1),owftpd,80)
endef


define Package/libow/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libow-*.so.* $(1)/usr/lib/
endef

define Package/libow-capi/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libowcapi-*.so.* $(1)/usr/lib/
	#$(INSTALL_DIR) $(1)/usr/include
	#$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/include/{owcapi,owfs_config}.h $(1)/usr/include/
endef


$(eval $(call BuildPackage,owfs))
$(eval $(call BuildPackage,owshell))

$(eval $(call BuildPackage,owserver))
$(eval $(call BuildPackage,owhttpd))
$(eval $(call BuildPackage,owftpd))

$(eval $(call BuildPackage,libow))
$(eval $(call BuildPackage,libow-capi))
