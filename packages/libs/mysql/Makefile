# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mysql
PKG_VERSION:=5.0.18
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=\
	http://mysql.planetmirror.com/Downloads/MySQL-5.0/ \
	http://mysql.he.net/Downloads/MySQL-5.0/ \
	http://www.linorg.usp.br/mysql/Downloads/MySQL-5.0/ \
	http://mysql.holywar.net/Downloads/MySQL-5.0/
PKG_MD5SUM:=f18153b0239aaa03fc5a751f2d82cb71

PKG_BUILD_DEPENDS:=libncurses libreadline

include $(INCLUDE_DIR)/package.mk

define Package/libmysqlclient
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+zlib
  TITLE:=MySQL client library
  URL:=http://dev.mysql.com/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); touch \
		configure.in \
		aclocal.m4 \
		Makefile.in \
		config.h.in \
		configure \
	);
	$(call Build/Configure/Default, \
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
		--with-named-thread-libs=-lpthread \
		, \
		mysql_cv_compress=yes \
		mysql_cv_gethostname_style=glibc2 \
	);
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
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

define Build/InstallDev
	$(INSTALL_DIR) $(2)/bin $(1)/usr/bin $(1)/usr/include $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mysql_config $(1)/usr/bin/
	ln -sf $(STAGING_DIR)/usr/bin/mysql_config $(2)/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/mysql $(1)/usr/include/
	# NOTE: needed for MySQL-Python
	$(CP) $(PKG_BUILD_DIR)/include/mysqld_error.h $(1)/usr/include/mysql/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/mysql $(1)/usr/lib/
	rm -f $(1)/usr/lib/mysql/libmysqlclient.la
endef

define Package/libmysqlclient/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/mysql/libmysqlclient.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libmysqlclient))
