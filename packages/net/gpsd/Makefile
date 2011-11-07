#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gpsd
PKG_VERSION:=2.94
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.berlios.de/gpsd/
PKG_MD5SUM:=ce70bcd707ac1df861d4c72f503c09d1

PKG_INSTALL:=1
PKG_FIXUP:=libtool
PKG_REMOVE_FILES:=aclocal.m4 ltmain.sh

PKG_BUILD_DEPENDS:=libncurses

include $(INCLUDE_DIR)/package.mk

define Package/gpsd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +librt +libusb-1.0
  TITLE:=An interface daemon for GPS receivers
  URL:=http://gpsd.berlios.de/
endef

CONFIGURE_CMD =./autogen.sh

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
	--disable-libgpsmm \
        --without-x \

EXTRA_CFLAGS:=-I$(STAGING_DIR)/usr/include/libusb-1.0

EXTRA_LDFLAGS:=-lusb-1.0

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gps.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgps*.{a,so*} $(1)/usr/lib/
endef

define Package/gpsd/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/gpsd.config $(1)/etc/config/gpsd
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/gpsd.init $(1)/etc/init.d/gpsd
	$(INSTALL_DIR) $(1)/etc/hotplug.d/usb
	$(INSTALL_DATA) ./files/gpsd.hotplug $(1)/etc/hotplug.d/usb/20-gpsd
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgps*.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/gpsd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,gpsd))
