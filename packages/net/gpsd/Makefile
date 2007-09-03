#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=gpsd
PKG_VERSION:=2.29
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.berlios.de/gpsd/
PKG_MD5SUM:=3ff80db0e7d906457e5a7a1b04fcb4ec

PKG_BUILD_DEPENDS=libncurses libnotimpl

include $(INCLUDE_DIR)/package.mk

define Package/gpsd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +uclibcxx
  TITLE:=An interface daemon for GPS receivers
  URL:=http://gpsd.berlios.de/
endef

CONFIGURE_ARGS += \
	--without-x \

CONFIGURE_VARS += \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/uClic++" \
	CXXFLAGS="$$$$CXXFLAGS -fno-builtin -fno-rtti -nostdinc++"  \
	LIBS="-nodefaultlibs -luClibc++ -lnotimpl" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CXXLINK="\$$$$(LINK)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gps{,d}.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libgpsmm.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgps.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/include/gps{,d}.h \
		$(STAGING_DIR)/usr/include/libgpsmm.h \
		$(STAGING_DIR)/usr/lib/libgps.{a,so*} 
endef

define Package/gpsd/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/libgps.so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/gpsd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,gpsd))
