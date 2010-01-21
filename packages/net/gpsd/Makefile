#
# Copyright (C) 2006,2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gpsd
PKG_VERSION:=2.90
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.berlios.de/gpsd/
PKG_MD5SUM:=a23c728b8734c542d559c485857238d2

PKG_FIXUP:=libtool-ucxx

PKG_BUILD_DEPENDS=libncurses

include $(INCLUDE_DIR)/package.mk

define Package/gpsd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +uclibcxx
  TITLE:=An interface daemon for GPS receivers
  URL:=http://gpsd.berlios.de/
endef

CONFIGURE_ARGS += \
        --disable-dbus \
        --disable-tsip \
        --disable-fv18 \
        --disable-tripmate \
        --disable-earthmate \
        --disable-itrax \
        --disable-navcom \
        --disable-ubx \
        --disable-evermore \
        --disable-ntrip \
        --without-x \

CONFIGURE_VARS += \
	CXXFLAGS="$$$$CXXFLAGS -fno-builtin -fno-rtti -nostdinc++"  \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/uClibc++ -I$(LINUX_DIR)/include" \
	LDFLAGS="$$$$LDFLAGS -L$(STAGING_DIR)/usr/lib" \
	LIBS="-nodefaultlibs -luClibc++ -lm -lgcc" \
	CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gps.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgps.{a,so*} $(1)/usr/lib/
endef

define Package/gpsd/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgps.so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/gpsd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,gpsd))
