#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# crazy_imp

include $(TOPDIR)/rules.mk

PKG_NAME:=apr
PKG_VERSION:=0.9.13
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://apache.d-s-s-p.de/apr/
PKG_MD5SUM:=233894af598d8347fd68cf836e7dee91
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/apr
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libpthread
  TITLE:=Apache Portable Runtime Library
  DESCRIPTION:=\
  	Apache Portable Runtime Library
  URL:=http://apr.apache.org/
endef

define Build/Configure	
	$(call Build/Configure/Default, \
		--with-devrandom=/dev/urandom \
		--disable-dso \
		--disable-ipv6 \
		, \
		ac_cv_file__dev_zero=yes \
		ac_cv_sizeof_ssize_t=4 \
		ac_cv_define_PTHREAD_PROCESS_SHARED=no \
		apr_cv_mutex_robust_shared=no \
		LDFLAGS="-lpthread -L$(STAGING_DIR)/lib" \
		CFLAGS="-I$(STAGING_DIR)/include" \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP)   $(PKG_INSTALL_DIR)/usr/bin/apr-config \
		$(STAGING_DIR)/usr/bin
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP)   $(PKG_INSTALL_DIR)/usr/include/apr-0/ \
		$(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP)   $(PKG_INSTALL_DIR)/usr/lib/*apr* \
		$(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/share/
	$(CP)   $(PKG_INSTALL_DIR)/usr/share/build/ \
		$(STAGING_DIR)/usr/share/
	$(SED) "s,/usr/share/build,$(STAGING_DIR)/usr/share/build," $(STAGING_DIR)/usr/share/build/apr_rules.mk
	$(SED)  "s,\"/usr\",$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/apr-config
	$(SED)  "s,"libdir\=\'/usr/lib\'",libdir='$(STAGING_DIR)/usr/lib\'," $(STAGING_DIR)/usr/lib/libapr-0.la
endef

define Build/UninstallDev
	rm	$(STAGING_DIR)/usr/bin/apr-config \
		$(STAGING_DIR)/usr/include/apr-0/{apr_allocator.h,apr_atomic.h,apr_compat.h,apr_dso.h,apr_env.h,apr_errno.h,apr_file_info.h,apr_file_io.h,apr_fnmatch.h,apr_general.h,apr_getopt.h,apr_global_mutex.h,apr.h,apr_hash.h,apr_inherit.h,apr_lib.h,apr_mmap.h,apr_network_io.h,apr_poll.h,apr_pools.h,apr_portable.h,\apr_proc_mutex.h,\apr_ring.h,apr_shm.h,apr_signal.h,apr_strings.h,apr_support.h,apr_tables.h,apr_thread_cond.h,apr_thread_mutex.h,apr_thread_proc.h,apr_thread_rwlock.h,apr_time.h,apr_user.h,apr_version.h,apr_want.h} \
		$(STAGING_DIR)/usr/lib/libapr-0* \
		$(STAGING_DIR)/usr/share/build/{apr_rules.mk,libtool,make_exports.awk,make_var_export.awk,mkdir.sh}
endef

define Package/apr/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/apr-config $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,apr))
