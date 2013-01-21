#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libugpio
PKG_VERSION:=0.0.1
PKG_RELEASE=$(PKG_SOURCE_VERSION)-1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/mhei/libugpio.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=8235d04096bfa9db594d5df75c5cd634a3bbc39a
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libugpio
  SECTION:=libs
  CATEGORY:=Libraries
  URL:=https://github.com/mhei/libugpio
  TITLE:=Library for using sysfs gpio interface from C programs
  DEPENDS:=@GPIO_SUPPORT
endef

define Package/libugpio/description
  libugpio is a library to ease the use of linux kernel's sysfs
  gpio interface from C programs and/or other libraries.
endef

define Package/gpioctl-sysfs
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Tool for controlling gpio pins
  DEPENDS:=+libugpio
endef

define Package/gpioctl-sysfs/description
  Tool for controlling gpio pins using the sysfs api provided by the kernel.
endef

define Build/Configure
	( cd "$(PKG_BUILD_DIR)"; ./autogen.sh )
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/ugpio $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libugpio.{so*,a} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libugpio.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libugpio/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libugpio.so* $(1)/usr/lib/
endef

define Package/gpioctl-sysfs/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/gpioctl $(1)/usr/bin/
endef

$(eval $(call BuildPackage,libugpio))
$(eval $(call BuildPackage,gpioctl-sysfs))
