# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=phidget21
PKG_VERSION:=2.1.4.20080924
PKG_RELEASE:=1

PKG_SOURCE:=Phidgetlinux_$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/Phidgetlinux
PKG_SOURCE_URL:=http://www.phidgets.com/downloads/libraries/
PKG_MD5SUM:=635bfbd701b3b7c32e262bcc5130380e

include $(INCLUDE_DIR)/package.mk

define Package/phidget21
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Phidget API
  URL:=http://www.phidgets.com/
endef

define Package/phidget21/description
 The Phidget API library.
endef

define Package/phidget-service
  SECTION:=misc
  CATEGORY:=Network
  TITLE:=Phidget Web Service
  URL:=http://www.phidgets.com/
  DEPENDS:=phidget21
endef

define Package/phidget-service/description
 The Phidget Web Service.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/phidget21 \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -static -D_LINUX -I. -Iutils" \
		all
	$(MAKE) -C $(PKG_BUILD_DIR)/webservice \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -D_LINUX -I. -Iutils" \
		phidget21internal.h
	$(MAKE) -C $(PKG_BUILD_DIR)/webservice \
		$(TARGET_CONFIGURE_OPTS) \
		LIBS="-lphidget21 -L../phidget21" \
		CFLAGS="$(TARGET_CFLAGS) -static -D_LINUX -I. -I../phidget21 -I../phidget21/utils" \
		webservice21
endef

define Package/phidget21/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/phidget21/libphidget21.so $(1)/usr/lib/
endef

define Package/phidget-service/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/webservice/phidgetwebservice21 $(1)/usr/bin/
endef


$(eval $(call BuildPackage,phidget21))
$(eval $(call BuildPackage,phidget-service))
