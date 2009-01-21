#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
PKG_NAME:=owfs
PKG_VERSION:=2.7p13
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=285483508f7fa42af3500b04f792058c

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk


#
# templates
#

define Package/owfs/Default
  TITLE:=OWFS (1-Wire File System)
  URL:=http://owfs.sourceforge.net/
endef

define Package/owfs/Server
  $(call Package/owfs/Default)
  DEPENDS:=+libow +libpthread
  SECTION:=net
  CATEGORY:=Network
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

define Package/owfs/ServerInstall
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

define Package/libow-capi
  $(call Package/owfs/Library)
  DEPENDS:=+libow
  TITLE:=OWFS - C-API library
endef


#
# utilities
#

define Package/owshell
  $(call Package/owfs/Utility)
  TITLE:=OWFS - shell utilities
endef

define Package/owfs
  $(call Package/owfs/Utility)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS+=+kmod-fuse +libfuse +fuse-utils
  TITLE:=OWFS - fuse file system
endef


#
# network daemons
#

define Package/owhttpd
  $(call Package/owfs/Server)
  TITLE:=OWFS - http server
endef

define Package/owftpd
  $(call Package/owfs/Server)
  TITLE:=OWFS - ftp server
endef

define Package/owserver
  $(call Package/owfs/Server)
  TITLE:=OWFS - network server
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
		CFLAGS="$(TARGET_CFLAGS) $(CFLAGS_LARGEFILE)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(TOOLCHAIN_DIR)/usr/lib -L$(TOOLCHAIN_DIR)/lib" \
		lt_sys_lib_dlsearch_path_spec="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
		lt_sys_lib_search_path_spec="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
		shrext_cmds=".so" \
		./configure \
			$(CONFIGURE_ARGS) \
	);
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP)	$(PKG_INSTALL_DIR)/usr/include/{owcapi,owfs_config}.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP)	$(PKG_INSTALL_DIR)/usr/lib/libow.{a,so} $(PKG_INSTALL_DIR)/usr/lib/libowcapi.{a,so} $(STAGING_DIR)/usr/lib/
	$(CP)	$(PKG_INSTALL_DIR)/usr/lib/libow-*.so.* $(PKG_INSTALL_DIR)/usr/lib/libowcapi-*.so.* $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/include/{libow-capi,owfs_config}.h \
		$(STAGING_DIR)/usr/lib/libow-capi-*.so.* \
		$(STAGING_DIR)/usr/lib/libow-*.so.* \
		$(STAGING_DIR)/usr/lib/libow-capi.{a,so} \
		$(STAGING_DIR)/usr/lib/libow.{a,so}
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
	$(call Package/owfs/ServerInstall,$(1),owserver,70)
endef

define Package/owhttpd/install
	$(call Package/owfs/ServerInstall,$(1),owhttpd,80)
endef

define Package/owftpd/install
	$(call Package/owfs/ServerInstall,$(1),owftpd,80)
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
