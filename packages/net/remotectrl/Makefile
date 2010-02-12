# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=chillisocket
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define Package/chillisocket
  SECTION:=Testing
  CATEGORY:=Testing
#  DEPENDS:=
  TITLE:=Socket library server client
endef

TARGET_CPPFLAGS := \
	-I$(STAGING_DIR)/usr/include/ \
	-I$(LINUX_DIR)/include \
	-I$(PKG_BUILD_DIR) \
	$(TARGET_CPPFLAGS)

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	CFLAGS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS)" \
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		LIBS="$(TARGET_LDFLAGS) -lm"
endef

define Package/chillisocket/install
	$(INSTALL_DIR) $(1)/bin
#	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libChSocket.a $(1)/bin/libChSocket.a
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/servselect $(1)/bin/servselect
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/clientselect $(1)/bin/clientselect
endef

$(eval $(call BuildPackage,chillisocket))
