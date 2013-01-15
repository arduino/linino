#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lttng-tools
PKG_VERSION:=2.1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://lttng.org/files/$(PKG_NAME)
PKG_MD5SUM:=

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/lttng-tools
  SECTION:=devel
  CATEGORY:=Development
  DEPENDS:=+lttng-ust +libpopt
  TITLE:=LTTng tracing tools
  URL:=https://lttng.org/
endef

TARGET_LDFLAGS += -lurcu-bp

define Package/lttng-tools/description
   LTTng Userspace Tracing Library
endef

define Package/lttng-tools/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblttng-ctl.so.* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lttng $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/lttng* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,lttng-tools))
