# 
# Copyright (C) 2006,2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libsigc++
PKG_VERSION:=2.0.17
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.0/
PKG_MD5SUM:=fde0ee69e3125e982746d9fe005763e1

PKG_BUILD_DEPENDS:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/libsigcxx
  NAME:=libsigc++
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=typesafe callback system for standard C++
  URL:=http://libsigc++.sourceforge.net/
  DEPENDS:=+uclibcxx
endef

define Package/libsigcxx/description
 It allows you to define signals and to connect those signals to any 
 callback function, either global or a member function, regardless of 
 whether it is static or virtual.
endef

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \

CONFIGURE_VARS += \
	CXX="g++-uc+std" \
	CXXFLAGS="$$$$CXXFLAGS -fno-rtti"  \

define Build/Configure
	$(call Build/Configure/Default,)
	$(call libtool_disable_rpath)
	$(SED) 's|^sys_lib_dlsearch_path_spec=.*|sys_lib_dlsearch_path_spec="$(STAGING_DIR)/usr/lib"|g' \
		$(PKG_BUILD_DIR)/libtool
	$(SED) 's|^postdeps=.*|postdeps=|g' $(PKG_BUILD_DIR)/libtool
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) all
	$(call libtool_fixup_libdir,$(PKG_INSTALL_DIR))
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/sigc++-2.0 $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsigc-2.0.{a,so*} $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/sigc++-2.0 $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/sigc++-2.0.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,$(TARGET_LDFLAGS),,g' $(STAGING_DIR)/usr/lib/pkgconfig/sigc++-2.0.pc
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/include/sigc++-2.0 \
		$(STAGING_DIR)/usr/lib/libsigc-2.0.{a,so*} \
		$(STAGING_DIR)/usr/lib/sigc++-2.0 \
		$(STAGING_DIR)/usr/lib/pkgconfig/sigc++-2.0.pc
		
endef

define Package/libsigcxx/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsigc-2.0.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsigcxx))

