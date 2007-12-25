#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=gpsd
PKG_VERSION:=2.35
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.berlios.de/gpsd/
PKG_MD5SUM:=fdd16502f68b997858edd5a9f2fcf9dc

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
	--disable-python \
	--disable-sirf \
	--disable-tsip \
	--disable-fv18 \
	--disable-tripmate \
	--disable-earthmate \
	--disable-itrax \
	--disable-navcom \
	--disable-garmin \
	--disable-ubx \
	--disable-evermore \
	--disable-rtcm104 \
	--disable-ntrip \
	--disable-ntpshm \
	--disable-pps \
	--disable-reconfigure \
	--without-x 

CONFIGURE_VARS += \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/uClic++" \
	CXXFLAGS="$$$$CXXFLAGS -fno-builtin -fno-rtti -nostdinc++"  \
	LIBS="-nodefaultlibs -luClibc++ -lnotimpl" \

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -rf config.{cache,status}; \
		./autogen.sh \
	);
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/gps{,d}.h $(1)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/libgpsmm.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/.libs/libgps.{a,so*} $(1)/usr/lib/
endef

define Package/gpsd/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/.libs/libgps.so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/.libs/gpsd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,gpsd))
