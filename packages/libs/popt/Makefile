# $Id: Makefile 3843 2006-05-30 18:55:52Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=popt
PKG_VERSION:=1.7
PKG_RELEASE:=4
PKG_MD5SUM:=5988e7aeb0ae4dac8d83561265984cc9

PKG_SOURCE_URL:=ftp://ftp.rpm.org/pub/rpm/dist/rpm-4.1.x/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libpopt
SECTION:=libs
CATEGORY:=Libraries
TITLE:=A command line option parsing library
DESCRIPTION:=A command line option parsing library
URL:=ftp://ftp.rpm.org/pub/rpm/dist/rpm-4.1.x/
endef

define Build/Configure
$(call Build/Configure/Default,--enable-shared --enable-static)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libpopt/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpopt.so.* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/popt.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpopt.{a,so*} $(STAGING_DIR)/usr/lib/
	touch $(STAGING_DIR)/usr/lib/libpopt.so
endef
	
define Build/UninstallDev
	rm -rf \
	  $(STAGING_DIR)/usr/include/popt.h \
	  $(STAGING_DIR)/usr/lib/libpopt.{a,so*}
endef

$(eval $(call BuildPackage,libpopt))

$(eval $(call RequireCommand,xgettext, \
	popt requires GNU gettext to build. \
))
