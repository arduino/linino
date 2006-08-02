# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mysql
PKG_VERSION:=5.0.18
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=\
	http://mysql.planetmirror.com/Downloads/MySQL-5.0/ \
	http://mysql.he.net/Downloads/MySQL-5.0/ \
	http://www.linorg.usp.br/mysql/Downloads/MySQL-5.0/ \
	http://mysql.holywar.net/Downloads/MySQL-5.0/
PKG_MD5SUM:=f18153b0239aaa03fc5a751f2d82cb71
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install
PKG_BUILDDEP:=libncurses libreadline

include $(INCLUDE_DIR)/package.mk

define Package/libmysqlclient
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=zlib
  TITLE:=MySQL client library
  DESCRIPTION:=MySQL client library.
  URL:=http://dev.mysql.com/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		touch configure.in; \
		touch aclocal.m4; \
		touch Makefile.in; \
		touch config.h.in; \
		touch configure; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CXXFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		ac_atomic_add=yes \
		ac_atomic_sub=yes \
		ac_cv_sys_restartable_syscalls=yes \
		ac_cv_conv_longlong_to_float=yes \
		mysql_cv_compress=yes \
		mysql_cv_gethostname_style=glibc2 \
		./configure \
			--target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--program-prefix="" \
			--program-suffix="" \
			--prefix=/usr \
			--exec-prefix=/usr \
			--bindir=/usr/bin \
			--datadir=/usr/share \
			--includedir=/usr/include \
			--infodir=/usr/share/info \
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			--enable-shared \
			--enable-static \
			--disable-assembler \
			--with-pthread \
			--without-raid \
			--with-unix-socket-path=/tmp \
			--without-libwrap \
			--without-pstack \
			--with-low-memory \
			--without-server \
			--without-embedded-server \
			--without-query-cache \
			--without-mysqlfs \
			--without-vio \
			--without-openssl \
			--without-docs \
			--without-bench \
			--without-readline \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		SUBDIRS="include" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
	$(MAKE) -C "$(PKG_BUILD_DIR)/libmysql" \
		CC="$(HOSTCC)" \
		LINK="$(HOSTCC) -o conf_to_src -lc" \
		CFLAGS="" \
		CPPFLAGS="" \
		conf_to_src
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		SUBDIRS="libmysql" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		SUBDIRS="scripts" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		bin_SCRIPTS="mysql_config" \
		install
endef

define Package/libmysqlclient/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/mysql/libmysqlclient.so.* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mysql_config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/mysql $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/mysql $(STAGING_DIR)/usr/lib/
	rm -f $(STAGING_DIR)/usr/lib/mysql/libmysqlclient.la
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/mysql_config \
		$(STAGING_DIR)/usr/include/mysql \
		$(STAGING_DIR)/usr/lib/mysql
endef

$(eval $(call BuildPackage,libmysqlclient))
