# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=stress
PKG_VERSION:=0.18.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://weather.ou.edu/~apw/projects/stress/
PKG_MD5SUM:=e6fba31fbac8d0a1b359c7e25cba8e3f

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/stress
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=@LINUX_2_6
  TITLE:=stress is a simple stress utility
  URL:=http://weather.ou.edu/~apw/projects/stress/
endef

define Package/stress/description
	stress is a simple tool that imposes certain types of compute \	stress on UNIX-like operating systems.
endef

CONFIGURE_ARGS += \
	--prefix="/usr"

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)"

define Package/stress/install
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/src/stress $(1)/usr/bin
endef

$(eval $(call BuildPackage,stress))
