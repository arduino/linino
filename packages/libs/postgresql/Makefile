# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=postgresql
PKG_VERSION:=7.4.9
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=\
	ftp://ftp3.us.postgresql.org/pub/postgresql/source/v$(PKG_VERSION)/ \
	ftp://ftp.br.postgresql.org/pub/PostgreSQL/source/v$(PKG_VERSION)/ \
	ftp://ftp.au.postgresql.org/pub/postgresql/source/v$(PKG_VERSION)/ \
	ftp://ftp.tw.postgresql.org/pub/postgresql/source/v$(PKG_VERSION)/
PKG_MD5SUM:=d7cf0f0a0e1dda19268f55cb1e124c77
PKG_CAT:=bzcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libpq
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+zlib
  TITLE:=PostgreSQL client library
  DESCRIPTION:=PostgreSQL client library.
  URL:=http://www.postgresql.org/
endef

define Package/pgsql-cli
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libpq
  TITLE:=Command Line Interface (CLI) to PostgreSQL databases
  DESCRIPTION:=Command Line Interface (CLI) to PostgreSQL databases.
  URL:=http://www.postgresql.org/
endef

#	./configure advertise "--infodir", but does not support it, replaced with "--docdir"
define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
		CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
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
			--docdir=/usr/share/info \
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_NLS) \
			$(DISABLE_LARGEFILE) \
			--enable-shared \
			--enable-static \
			--disable-integer-datetimes \
			--disable-rpath \
			--without-java \
			--without-krb4 \
			--without-krb5 \
			--without-openssl \
			--without-pam \
			--without-perl \
			--without-python \
			--without-readline \
			--without-rendezvous \
			--without-tcl \
			--without-tk \
			--with-zlib="yes" \
	);
endef

define Build/Compile
	$(MAKE) -C "$(PKG_BUILD_DIR)/src/include" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
	$(MAKE) -C "$(PKG_BUILD_DIR)/src/interfaces/libpq" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
	$(MAKE) -C "$(PKG_BUILD_DIR)/src/bin/pg_config" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		includedir="$(STAGING_DIR)/usr/include" \
		libdir="$(STAGING_DIR)/usr/lib" \
		all install
	$(MAKE) -C "$(PKG_BUILD_DIR)/src/bin/psql" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libpq/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpq.so.* $(1)/usr/lib/
endef

define Package/pgsql-cli/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/psql $(1)/usr/bin/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/pg_config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libpq $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libpq-fe.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/pg_config.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/postgres_ext.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/postgresql $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpq.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/pg_config \
		$(STAGING_DIR)/usr/include/libpq \
		$(STAGING_DIR)/usr/include/libpq-fe.h \
		$(STAGING_DIR)/usr/include/pg_config.h \
		$(STAGING_DIR)/usr/include/postgres_ext.h \
		$(STAGING_DIR)/usr/include/postgresql \
		$(STAGING_DIR)/usr/lib/libpq.{a,so*}
endef

$(eval $(call BuildPackage,libpq))
$(eval $(call BuildPackage,pgsql-cli))
