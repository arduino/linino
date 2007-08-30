# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id :$ 

include $(TOPDIR)/rules.mk

PKG_NAME:=taglib
PKG_VERSION:=1.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://developer.kde.org/~wheeler/files/src/
PKG_MD5SUM:=dcd50ddb2544faeae77f194804559404
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/taglib
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+zlib +uclibcxx
  TITLE:=Audio output library
  DESCRIPTION:=\
  	the audio output library
  URL:=http://developer.kde.org/~wheeler/taglib.html
endef

CONFIGURE_VARS += \
        CXXFLAGS="$(TARGET_CFLAGS) -fno-builtin -fno-rtti -nostdinc++ -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include"

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-final \
		,\
		LDFLAGS="-nodefaultlibs -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
                LIBS="-luClibc++ -lc -lm -lgcc -lz" \
	)
endef

define Build/Compile
	$(call Build/Compile/Default,\
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install \
	)
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtag* $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/include/taglib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/taglib/* $(STAGING_DIR)/usr/include/taglib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/taglib-config \
		$(STAGING_DIR)/usr/lib/libtag* \
		$(STAGING_DIR)/usr/include/taglib/
endef

define Package/taglib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtag* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,taglib))
