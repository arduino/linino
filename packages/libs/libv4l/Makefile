# 
# Copyright (C) 2009 David Cooper <dave@kupesoft.com>
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libv4l
PKG_VERSION:=0.6.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://people.atrpms.net/~hdegoede/
PKG_MD5SUM:=db389fdf02cabd57f289f0faa37f4060

include $(INCLUDE_DIR)/package.mk

define Package/libv4l
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Video 4 Linux wrapper libraries
  URL:=http://people.atrpms.net/~hdegoede/
  DEPENDS:=+libpthread
endef

define Package/libv4l/description
  libv4l is a collection of libraries which adds a thin abstraction layer on
  top of video4linux2 devices. The purpose of this (thin) layer is to make it
  easy for application writers to support a wide variety of devices without
  having to write separate code for different devices in the same class. libv4l
  consists of 3 different libraries: libv4lconvert, libv4l1 and libv4l2.
  
  libv4l1 offers the (deprecated) v4l1 API on top of v4l2 devices, independent
  of the drivers for those devices supporting v4l1 compatibility (which many
  v4l2 drivers do not).

  libv4l2 offers the v4l2 API on top of v4l2 devices, while adding for the
  application transparent libv4lconvert conversion where necessary.
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" PREFIX="/usr" \
		$(CONFIGURE_VARS) \
		all install
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" PREFIX="/usr" \
		$(CONFIGURE_VARS) \
		LINKTYPE="static" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libv4l{1,2,convert}.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libv4l{1,2,convert}.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libv4l{1,2,convert}.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libv4l/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libv4l{1,2,convert}.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/libv4l
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libv4l/v4l{1compat,2convert}.so $(1)/usr/lib/libv4l
endef

$(eval $(call BuildPackage,libv4l))

