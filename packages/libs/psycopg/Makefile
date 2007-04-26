include $(TOPDIR)/rules.mk

PKG_NAME:=psycopg
PKG_VERSION:=1.1.21
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.initd.org/pub/software/psycopg/
PKG_MD5SUM:=a31f79f68d6d32898d6f24e11369a106
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/psycopg
 SECTION:=libs
 CATEGORY:=Libraries
 DEPENDS:=+libpq +python +egenix-mx
 TITLE:=Psycopg
 MAINTAINER:=jjones@pavlovmedia.com
 DESCRIPTION:=\
  psycopg is a PostgreSQL database adapter for the Python programming language.
 URL=http://www.initd.org/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-python=$(STAGING_DIR)/usr/bin/hostpython \
		--with-postgres-libraries=$(STAGING_DIR)/usr/lib \
		--with-postgres-includes=$(STAGING_DIR)/usr/include \
		--with-mxdatetime-includes=$(STAGING_DIR)/usr/lib/python2.5/site-packages/mx/DateTime/mxDateTime )
endef

define Package/psycopg/install
	$(INSTALL_DIR) $(1)/usr/lib/python2.5/site-packages
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/psycopgmodule.so $(1)/usr/lib/python2.5/site-packages
endef

$(eval $(call BuildPackage,psycopg))
