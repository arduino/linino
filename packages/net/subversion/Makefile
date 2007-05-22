#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $ 

include $(TOPDIR)/rules.mk

PKG_NAME:=subversion
PKG_VERSION:=1.4.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://subversion.tigris.org/downloads/
PKG_MD5SUM:=de0e792c9804c7bce397d267af5eb30d
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/subversion/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A compelling replacement for CVS
  DEPENDS:=+zlib +neon +libintl +apr +apr-util
  URL:=http://subversion.tigris.org/
  SUBMENU:=subversion
endef

define Package/subversion-libs
  $(call Package/subversion/Default)
  TITLE:=subversion libs
endef

define Package/subversion-client
  $(call Package/subversion/Default)
  DEPENDS+=subversion-libs
  TITLE:=subversion client tools
endef

define Package/subversion-server
  $(call Package/subversion/Default)
  DEPENDS+=subversion-libs @BROKEN
  TITLE:=subversion server
endef

define Build/Configure	
	$(call Build/Configure/Default, \
		--with-apr="$(STAGING_DIR)/usr/bin/apr-config" \
		--with-apr-util="$(STAGING_DIR)/usr/bin/apu-config" \
		--with-neon="$(STAGING_DIR)/usr" \
		--disable-mod-activation \
		--without-ruby-sitedir \
		--without-swig \
		--with-jikes=no \
		--without-junit \
		--without-berkeley-db \
		--with-ssl \
		--disable-neon-version-check \
		--with-apxs=no \
		--with-apache=no \
		, \
		svn_lib_neon=yes \
		LDFLAGS="-lcrypt -lnsl -lm -lintl -L$(STAGING_DIR)/usr/lib/libintl/lib/ \
			 -lz -L$(STAGING_DIR)/usr/lib/ \
			 -lpthread -L$(STAGING_DIR)/lib" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include/ \
			  -I$(STAGING_DIR)/usr/lib/libintl/include \
			  -I$(STAGING_DIR)/include/" \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all local-install
endef

define Package/subversion-libs/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsvn_* $(1)/usr/lib/
endef

define Package/subversion-client/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/{svn,svnversion,svnsync} $(1)/usr/bin/
endef

define Package/subversion-server/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/svn{look,admin,dumpfilter,serve} $(1)/usr/bin/
endef

$(eval $(call BuildPackage,subversion-libs))
$(eval $(call BuildPackage,subversion-client))
$(eval $(call BuildPackage,subversion-server))

$(eval $(call RequireCommand,/usr/bin/ruby, \
	$(PKG_NAME) requires ruby installed on the host-system. \
))
