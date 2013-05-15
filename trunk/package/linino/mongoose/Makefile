# 
# Copyright (C) 2006-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mongoose
PKG_VERSION:=3.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://mongoose.googlecode.com/files/

#PKG_MD5SUM:=9c0cae5a0379228e7b55e5b29528df8e

PKG_LICENSE:=MIT


include $(INCLUDE_DIR)/package.mk

define Package/mongoose
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Mongoose
  DEPENDS:=+libc +libpthread
endef

define Package/mongoose/description
 Mongoose
endef

define Build/Prepare
	# PREPARE
	$(Build/Prepare/Default)
	echo $(PKG_SOURCE)
	$(CP) $(PKG_BUILD_DIR)/../mongoose/* $(PKG_BUILD_DIR)/
endef

define Build/Configure
	# NOOP
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
		ARCH="$(ARCH)" \
		CONFIG_PREFIX="$(PKG_INSTALL_DIR)" \
		LDLIBS="$(LDLIBS)" \
		$(BB_MAKE_VERBOSE) \
		linux
endef

define Package/mongoose/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mongoose $(1)/usr/bin/
endef

$(eval $(call BuildPackage,mongoose))
