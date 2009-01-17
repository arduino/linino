#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$ 

include $(TOPDIR)/rules.mk

PKG_NAME:=subversion
PKG_VERSION:=1.5.2
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://subversion.tigris.org/downloads/
PKG_MD5SUM:=8321d0e1964846090f0174cb6bb18838

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/subversion/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A compelling replacement for CVS
  DEPENDS:=+zlib +libneon +libintl +libapr +libaprutil +libpthread
  URL:=http://subversion.tigris.org/
  SUBMENU:=subversion
endef

define Package/subversion/Default/description
	Subversion is a free/open-source version control system. That is,
	Subversion manages files and directories, and the changes made to them,
	over time. This allows you to recover older versions of your data, or
	examine the history of how your data changed. In this regard, many
	people think of a version control system as a sort of time machine.
endef

define Package/subversion-libs
  $(call Package/subversion/Default)
  TITLE:=subversion libs
endef

define Package/subversion-libs/description
  $(call Package/subversion/Default/description)
  This package contains the subversion libraries.
endef

define Package/subversion-client
  $(call Package/subversion/Default)
  DEPENDS+=subversion-libs
  TITLE:=subversion client tools
endef

define Package/subversion-client/description
  $(call Package/subversion/Default/description)
  This package contains the subversion client tools.
endef

define Package/subversion-server
  $(call Package/subversion/Default)
  DEPENDS+=subversion-libs
  TITLE:=subversion server
endef

define Package/subversion-server/description
  $(call Package/subversion/Default/description)
  This package contains the subversion server.
endef

CONFIGURE_ARGS += \
	--with-apr="$(STAGING_DIR)/usr/bin/apr-1-config" \
	--with-apr-util="$(STAGING_DIR)/usr/bin/apu-1-config" \
	--with-neon="$(STAGING_DIR)/usr/include/neon" \
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
	--without-sasl \

CONFIGURE_VARS += \
	svn_lib_neon=yes \
	LDFLAGS="-lcrypt -lm -lintl -L$(STAGING_DIR)/usr/lib/libintl/lib/ \
		-lz -L$(STAGING_DIR)/usr/lib/ -lpthread -L$(TOOLCHAIN_DIR)/usr/lib -L$(TOOLCHAIN_DIR)/lib \
		-L$(TOOLCHAIN_DIR)/lib" \
	CPPFLAGS="-I$(STAGING_DIR)/usr/include/ -I$(STAGING_DIR)/usr/lib/libintl/include \
		-I$(STAGING_DIR)/include/" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" all local-install
endef

define Package/subversion-libs/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsvn_* $(1)/usr/lib/
endef

define Package/subversion-client/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/{svn,svnversion,svnsync} $(1)/usr/bin/
endef

define Package/subversion-server/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/svn{look,admin,dumpfilter,serve} $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/subversion.config $(1)/etc/config/subversion
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/subversion.init $(1)/etc/init.d/subversion
endef

$(eval $(call BuildPackage,subversion-libs))
$(eval $(call BuildPackage,subversion-client))
$(eval $(call BuildPackage,subversion-server))
