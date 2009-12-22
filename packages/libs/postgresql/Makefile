#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=postgresql
PKG_VERSION:=8.3.3
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=\
	http://ftp7.us.postgresql.org/pub/postgresql/source/v$(PKG_VERSION) \
	http://ftp8.us.postgresql.org/pub/postgresql/source/v$(PKG_VERSION) \
	http://ftp9.us.postgresql.org/pub/postgresql/source/v$(PKG_VERSION) \
	http://ftp.be.postgresql.org/postgresql/source/v$(PKG_VERSION) \
	ftp://ftp-archives.postgresql.org/pub/source/v$(PKG_VERSION)
PKG_MD5SUM:=0ae4bd9620e84d3e08dcf923808d14d0

include $(INCLUDE_DIR)/package.mk

define Package/libpq
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+zlib +libreadline +libncurses
  TITLE:=PostgreSQL client library
  URL:=http://www.postgresql.org/
  SUBMENU:=database
endef

define Package/libpq/description
PostgreSQL client library.
endef

define Package/pgsql-cli
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libpq
  TITLE:=Command Line Interface (CLI) to PostgreSQL databases
  URL:=http://www.postgresql.org/
  SUBMENU:=database
endef

define Package/pgsql-cli/description
Command Line Interface (CLI) to PostgreSQL databases.
endef

define Package/pgsql-server
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libpq
  TITLE:=PostgreSQL databases Server
  URL:=http://www.postgresql.org/
  SUBMENU:=database
endef

define Package/pgsql-server/description
PostgreSQL databases Server.
endef

# Need a native ecpg ,pg_config, and zic for build
define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		./configure \
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
			--enable-depend \
	);
	$(MAKE) -C $(PKG_BUILD_DIR)/src/interfaces/ecpg/preproc CC="$(HOSTCC)" CFLAGS+="-I../../libpq"
	mv $(PKG_BUILD_DIR)/src/interfaces/ecpg/preproc/ecpg \
		$(PKG_BUILD_DIR)/src/interfaces/ecpg/preproc/ecpg.host
	$(MAKE) -C $(PKG_BUILD_DIR)/src/timezone CC="$(HOSTCC)"
	mv $(PKG_BUILD_DIR)/src/timezone/zic $(PKG_BUILD_DIR)/src/timezone/zic.host
	$(MAKE) -C $(PKG_BUILD_DIR)/src/bin/pg_config CC="$(HOSTCC)"
	mv $(PKG_BUILD_DIR)/src/bin/pg_config/pg_config \
		$(PKG_BUILD_DIR)/src/bin/pg_config/pg_config.host
	$(MAKE) -C $(PKG_BUILD_DIR) distclean

	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="$$$$CPPFLAGS $(TARGET_CPPFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
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
			--without-rendezvous \
			--without-tcl \
			--without-tk \
			--with-zlib="yes" \
			--enable-depend \
			$(if $(CONFIG_TARGET_avr32),--disable-spinlocks) \
	);
	$(SED) 's@ECPG = ../../preproc/ecpg@ECPG = ../../preproc/ecpg.host@' $(PKG_BUILD_DIR)/src/interfaces/ecpg/test/Makefile.regress
	$(SED) 's@\./zic -d@./zic.host -d@' $(PKG_BUILD_DIR)/src/timezone/Makefile
	# note: unclear if this is needed yet, commenting out for the moment
	#$(SED) 's@US/Eastern@America/New_York@' $(PKG_BUILD_DIR)/src/timezone/Makefile
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libpq/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpq.so.* $(1)/usr/lib/
endef

define Package/pgsql-cli/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/psql $(1)/usr/bin/
endef

define Package/pgsql-server/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/share/postgresql
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/postgres \
		$(PKG_INSTALL_DIR)/usr/bin/dropdb \
		$(PKG_INSTALL_DIR)/usr/bin/clusterdb \
		$(PKG_INSTALL_DIR)/usr/bin/createdb \
		$(PKG_INSTALL_DIR)/usr/bin/createlang \
		$(PKG_INSTALL_DIR)/usr/bin/createuser \
		$(PKG_INSTALL_DIR)/usr/bin/droplang \
		$(PKG_INSTALL_DIR)/usr/bin/dropuser \
		$(PKG_INSTALL_DIR)/usr/bin/initdb \
		$(PKG_INSTALL_DIR)/usr/bin/ipcclean \
		$(PKG_INSTALL_DIR)/usr/bin/pg_config \
		$(PKG_INSTALL_DIR)/usr/bin/pg_controldata \
		$(PKG_INSTALL_DIR)/usr/bin/pg_ctl \
		$(PKG_INSTALL_DIR)/usr/bin/pg_dump \
		$(PKG_INSTALL_DIR)/usr/bin/pg_dumpall \
		$(PKG_INSTALL_DIR)/usr/bin/pg_restore \
		$(PKG_INSTALL_DIR)/usr/bin/pg_resetxlog \
		$(PKG_INSTALL_DIR)/usr/bin/reindexdb \
		$(PKG_INSTALL_DIR)/usr/bin/vacuumdb \
		$(1)/usr/bin
	ln -sf postgres $(1)/usr/bin/postmaster

	$(INSTALL_BIN) ./files/postgresql.init $(1)/etc/init.d/postgresql

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/postgresql/postgres.bki \
		$(PKG_INSTALL_DIR)/usr/share/postgresql/postgres.description \
		$(PKG_INSTALL_DIR)/usr/share/postgresql/conversion_create.sql \
		$(PKG_INSTALL_DIR)/usr/share/postgresql/information_schema.sql \
		$(PKG_INSTALL_DIR)/usr/share/postgresql/pg_hba.conf.sample \
		$(PKG_INSTALL_DIR)/usr/share/postgresql/pg_ident.conf.sample \
		$(PKG_INSTALL_DIR)/usr/share/postgresql/pg_service.conf.sample \
		$(PKG_INSTALL_DIR)/usr/share/postgresql/postgresql.conf.sample \
		$(PKG_INSTALL_DIR)/usr/share/postgresql/sql_features.txt \
		$(PKG_INSTALL_DIR)/usr/share/postgresql/postgres.shdescription \
		$(PKG_INSTALL_DIR)/usr/share/postgresql/psqlrc.sample \
		$(PKG_INSTALL_DIR)/usr/share/postgresql/recovery.conf.sample \
		$(PKG_INSTALL_DIR)/usr/share/postgresql/system_views.sql \
		$(PKG_INSTALL_DIR)/usr/share/postgresql/snowball_create.sql \
		$(1)/usr/share/postgresql

		$(INSTALL_DATA) ./files/postgresql.config $(1)/etc/config/postgresql

		$(CP) -r \
			$(PKG_INSTALL_DIR)/usr/share/postgresql/timezone \
			$(PKG_INSTALL_DIR)/usr/share/postgresql/timezonesets \
			$(1)/usr/share/postgresql

		$(CP) -r \
			$(PKG_INSTALL_DIR)/usr/lib/postgresql \
			$(1)/usr/lib
endef

define Package/pgsql-server/postinst
#!/bin/sh
grep -q '^postgres:' /etc/passwd && exit 0

if [ -e /bin/addgroup ]; then
  /bin/addgroup postgres
  RG=$$?

  if [ -e /bin/adduser ]; then
    /bin/adduser -h /tmp -H -g 'PostgreSQL administrator' -s /bin/ash -D -H -G postgres postgres
	RU=$$?
  fi
fi

if [ -z "$${RG}" -o -z "$${RU}" ]; then
  echo "Could not find user utils, you will need to create the postgres user by hand"
  exit
fi

if [ "$${RG}" != "0" -o "$${RU}" != "0" ]; then
  echo "Failed to created postgres user"
  exit 1
fi
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/bin/pg_config/pg_config.host $(1)/usr/bin/pg_config
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libpq $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libpq-fe.h $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/pg_config.h $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/pg_config_manual.h $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/postgres_ext.h $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/postgresql $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpq.{a,so*} $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/src/interfaces/ecpg/preproc/ecpg.host $(1)/usr/bin/ecpg
	$(CP) $(PKG_BUILD_DIR)/src/timezone/zic.host $(1)/usr/bin/zic
endef

$(eval $(call BuildPackage,libpq))
$(eval $(call BuildPackage,pgsql-cli))
$(eval $(call BuildPackage,pgsql-server))
