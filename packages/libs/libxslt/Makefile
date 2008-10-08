#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libxslt
PKG_VERSION:=1.1.24
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://xmlsoft.org/sources/ \
	ftp://fr.rpmfind.net/pub/libxml/
PKG_MD5SUM:=e83ec5d27fc4c10c6f612879bea9a153

include $(INCLUDE_DIR)/package.mk

define Package/libxslt
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libxml2
  TITLE:=Gnome XSLT library
  URL:=http://xmlsoft.org/XSLT/
endef

define Package/libxslt/description
	A library for XML transformation using XSLT.
endef

define Package/xsltproc
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libxml2 +libxslt
  TITLE:=Gnome XSLT xsltproc Utility
  URL:=http://xmlsoft.org/XSLT/
endef

define Package/xsltproc/description
	XSLT XML transformation utility
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--without-python \
		--without-crypto \
		--without-debug \
		--without-mem-debug \
		--without-debugger \
	)
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/include $(1)/usr/lib $(1)/usr/lib/pkgconfig
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/xslt-config $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/xsltproc $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libxslt $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libxslt.{a,so*} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libxslt.pc $(1)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir},,g' $(1)/usr/bin/xslt-config
	$(SED) 's,-L$$$${libdir},,g' $(1)/usr/bin/xslt-config
	$(SED) 's,-I$(STAGING_DIR)/usr/include,,g' $(1)/usr/bin/xslt-config
	$(SED) 's,-L$(STAGING_DIR)/usr/lib,,g' $(1)/usr/bin/xslt-config
endef

define Package/libxslt/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libxslt.so.* $(1)/usr/lib/
endef

define Package/xsltproc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/xsltproc $(1)/usr/bin/
endef

$(eval $(call BuildPackage,libxslt))
$(eval $(call BuildPackage,xsltproc))
