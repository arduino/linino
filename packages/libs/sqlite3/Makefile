# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=sqlite
PKG_VERSION:=3.3.3
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.sqlite.org/
PKG_MD5SUM:=eb5d9d7e7853b3af78e767d709b7fced
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install
PKG_BUILDDEP:=libncurses libreadline

include $(INCLUDE_DIR)/package.mk

define Package/libsqlite3
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Self-contained SQL database engine
  DESCRIPTION:=Self-contained, embeddable, zero-configuration SQL database engine.\\\
    SQLite is a small C library that implements a self-contained, embeddable, \\\
    zero-configuration SQL database engine.\\\
    \\\
    This package contains the shared library, needed by other programs.
  URL:=http://www.sqlite.org/
endef

define Package/sqlite3-cli
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libsqlite3 +libncurses +libreadline
  TITLE:=Command line interface for SQLite
  DESCRIPTION:=Command line interface for SQLite.\\\
    SQLite is a small C library that implements a self-contained, embeddable, \\\
    zero-configuration SQL database engine.\\\
    \\\
    This package contains a terminal-based front-end to the SQLite library \\\
    that can evaluate queries interactively and display the results in \\\
    multiple formats.
  URL:=http://www.sqlite.org/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		config_BUILD_CC="$(HOSTCC)" \
		config_BUILD_CFLAGS="-O2" \
		config_TARGET_CC="$(TARGET_CC)" \
		config_TARGET_CFLAGS="$(TARGET_CFLAGS)" \
		config_TARGET_READLINE_INC="-I$(STAGING_DIR)/usr/include" \
		config_TARGET_READLINE_LIBS="-L$(STAGING_DIR)/usr/lib -lreadline -lncurses" \
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
			--disable-tcl \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libsqlite3/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsqlite3.so.* $(1)/usr/lib/
endef

define Package/sqlite3-cli/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/sqlite3 $(1)/usr/bin/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/sqlite3.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsqlite3.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/sqlite3.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/sqlite3.pc
	$(SED) 's,-L$$$${libdir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/sqlite3.pc
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/sqlite3.h \
		$(STAGING_DIR)/usr/lib/libsqlite3.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/sqlite3.pc
endef

$(eval $(call BuildPackage,libsqlite3))
$(eval $(call BuildPackage,sqlite3-cli))
