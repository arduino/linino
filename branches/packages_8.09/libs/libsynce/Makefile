# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=libsynce
PKG_VERSION:=0.12
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/synce
PKG_MD5SUM:=fd473d3deceda7912af4427dede1736f

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

PKG_BUILD_DEPENDS:=libiconv

define Package/libsynce
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=SynCE library
  URL:=http://libsynce.sourceforge.net/
endef

define Package/libsynce/description
The purpose of the SynCE project is to provide a means of communication with a
Windows CE or Pocket PC device from a computer running Linux, *BSD or other unices.
endef

MAKE_FLAGS += \
	OPTIM="$(TARGET_CFLAGS)" \
	CFLAGS="$(TARGET_CFLAGS)" \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	all install 

CONFIGURE_ARGS += \
	--enable-hal-support=no \
	--enable-odccm-support=no

CONFIGURE_VARS+= \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/lib/libiconv/include" \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/lib/libintl/include" \
	LDFLAGS="$$$$LDFLAGS -L$(STAGING_DIR)/usr/lib/libiconv/lib" \
	LDFLAGS="$$$$LDFLAGS -L$(STAGING_DIR)/usr/lib/libintl/lib" \

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/*.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsynce.so* $(1)/usr/lib/
endef

define Package/libsynce/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsynce.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsynce))
