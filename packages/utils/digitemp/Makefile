#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$


include $(TOPDIR)/rules.mk

PKG_NAME:=digitemp
PKG_VERSION:=3.6.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.digitemp.com/software/linux
PKG_MD5SUM:=9be2e48db37920f21925ae6e88f83b84

include $(INCLUDE_DIR)/package.mk

define Package/digitemp
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=DigiTemp is a simple to use program for reading values from 1-wire devices.
  DEPENDS:=+libusb
  URL:=http://www.digitemp.com
endef

define Package/digitemp/description
	DigiTemp is a simple to use program for reading values from 1-wire devices.
	Its main use is for reading temperature sensors, but it also reads counters,
	and understands the 1-wire hubs with devices on different branches of the network.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -DLINUX -I$(STAGING_DIR)/usr/include \
			-I./src -I./userial -DOWUSB" \
		LIBS="-L$(STAGING_DIR)/usr/lib -lusb -lm" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		ds2490
endef

define Package/digitemp/install	
	mkdir -p $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/digitemp_DS2490 $(1)/usr/bin/
endef

$(eval $(call BuildPackage,digitemp))
