# $Id: Makefile 3843 2006-05-30 18:55:52Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=cgilib
PKG_VERSION:=0.5
PKG_RELEASE:=1
PKG_MD5SUM:=5187ba11b2ec165b6c5b6629087733b0

PKG_SOURCE_URL:=http://www.infodrom.org/projects/cgilib/download
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/cgilib
SECTION:=libs
CATEGORY:=Libraries
TITLE:=Simple CGI Library
DESCRIPTION:=Simple CGI Library.
URL:=http://www.infodrom.org/projects/cgilib/
endef

define Build/Configure
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
                OFLAGS="$(TARGET_CFLAGS)" \
                all
endef

define Package/cgilib/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libcgi.so.* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_BUILD_DIR)/cgi.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libcgi.{a,so*} $(STAGING_DIR)/usr/lib/
	touch $(STAGING_DIR)/usr/lib/libcgi.so
endef
	
define Build/UninstallDev
	rm -rf \
	  $(STAGING_DIR)/usr/include/cgi.h \
	  $(STAGING_DIR)/usr/lib/libcgi.{a,so*}
endef

$(eval $(call BuildPackage,cgilib))
