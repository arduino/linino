#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lttng-ust
PKG_VERSION:=2.1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://lttng.org/files/$(PKG_NAME)
PKG_MD5SUM:=2032e66f3438949c51ec9922c6f8542b

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/lttng-ust
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+liburcu +libuuid +librt
  TITLE:=LTTng Userspace Tracing Library
  URL:=https://lttng.org/
endef

define Package/lttng-ust/description
   LTTng Userspace Tracing Library
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/lttng* $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblttng-ust*.{a,so*} $(1)/usr/lib/
endef

define Package/lttng-ust/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblttng-ust*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,lttng-ust))
