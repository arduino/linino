#
# Copyright (C) 2009-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libdbi-drivers
PKG_VERSION:=0.8.3-1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/libdbi-drivers
PKG_MD5SUM:=4de79b323162a5a7652b65b608eca6cd

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/libdbi-drivers/default
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libdbi-drivers
  URL:=http://libdbi-drivers.sourceforge.net/
endef

define Package/libdbi-drivers/default/description
       libdbi-drivers project provides the database-specific drivers 
for the libdbi framework
endef

define Package/libdbi-drivers-mysql
$(call Package/libdbi-drivers/default)
  DEPENDS:=libdbi +libmysqlclient
  TITLE:= libdbi-drivers-mysql
endef

define Package/libdbi-drivers-mysql2/description
       libdbi-driver for mysql
endef

define Package/libdbi-drivers-pgsql
$(call Package/libdbi-drivers/default)
  DEPENDS:=libdbi +libpq
  TITLE:= libdbi-drivers-pgsql
endef

define Package/libdbi-drivers-pgsql/description
       libdbi-driver for pgsql
endef

define Package/libdbi-drivers-sqlite2
$(call Package/libdbi-drivers/default)
  DEPENDS:=libdbi +libsqlite2
  TITLE:= libdbi-drivers-sqlite2
endef

define Package/libdbi-drivers-sqlite2/description
       libdbi-driver for sqlite2
endef

define Package/libdbi-drivers-sqlite3
$(call Package/libdbi-drivers/default)
  DEPENDS:=libdbi +libsqlite3
  TITLE:= libdbi-drivers-sqlite3
endef

define Package/libdbi-drivers-sqlite3/description
       libdbi-driver for sqlite3
endef

CONFIGURE_ARGS += \
		  --enable-shared \
		  --disable-static \
		  --disable-rpath \
		  --disable-docs \
		  --with-dbi-incdir=$(STAGING_DIR_HOST)/usr/include \
		  --with-dbi-libdir=$(STAGING_DIR_HOST)/usr/lib

ifneq ($(CONFIG_PACKAGE_libdbi-drivers-mysql),)
CONFIGURE_ARGS += \
		  --with-mysql \
		  --with-mysql-incdir=$(STAGING_DIR_HOST)/usr/include \
		  --with-mysql-libdir=$(STAGING_DIR_HOST)/usr/lib/mysql
TARGET_LDFLAGS += \
		  -L$(STAGING_DIR)/usr/lib/mysql/
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_libdbi-drivers-pgsql),)
CONFIGURE_ARGS += \
		  --with-pgsql \
		  --with-pgsql-incdir=$(STAGING_DIR_HOST)/usr/include \
		  --with-pgsql-libdir=$(STAGING_DIR_HOST)/usr/lib
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_libdbi-drivers-sqlite2),)
CONFIGURE_ARGS += \
		  --with-sqlite \
		  --with-sqlite-incdir=$(STAGING_DIR_HOST)/usr/include \
		  --with-sqlite-libdir=$(STAGING_DIR_HOST)/usr/lib
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_libdbi-drivers-sqlite3),)
CONFIGURE_ARGS += \
		  --with-sqlite3 \
		  --with-sqlite3-incdir=$(STAGING_DIR_HOST)/usr/include \
		  --with-sqlite3-libdir=$(STAGING_DIR_HOST)/usr/lib
endif

define Package/libdbi-drivers-mysql/install
	$(INSTALL_DIR) $(1)/usr/lib/dbd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/drivers/mysql/.libs/libdbdmysql.so $(1)/usr/lib/dbd
endef

define Package/libdbi-drivers-pgsql/install
	$(INSTALL_DIR) $(1)/usr/lib/dbd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/drivers/pgsql/.libs/libdbdpgsql.so $(1)/usr/lib/dbd
endef

define Package/libdbi-drivers-sqlite2/install
	$(INSTALL_DIR) $(1)/usr/lib/dbd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/drivers/sqlite/.libs/libdbdsqlite.so $(1)/usr/lib/dbd
endef

define Package/libdbi-drivers-sqlite3/install
	$(INSTALL_DIR) $(1)/usr/lib/dbd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/drivers/sqlite3/.libs/libdbdsqlite3.so $(1)/usr/lib/dbd
endef


#$(eval $(call BuildPackage,libdbi-drivers))
$(eval $(call BuildPackage,libdbi-drivers-mysql))
$(eval $(call BuildPackage,libdbi-drivers-pgsql))
$(eval $(call BuildPackage,libdbi-drivers-sqlite2))
$(eval $(call BuildPackage,libdbi-drivers-sqlite3))
