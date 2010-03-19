#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=elfutils
PKG_VERSION:=0.143
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://fedorahosted.org/releases/e/l/elfutils/

include $(INCLUDE_DIR)/package.mk

define Package/elfutils
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libintl
  TITLE:=ELF utilities
  URL:=https://fedorahosted.org/releases/e/l/elfutils/
endef

CONFIGURE_OPTS += --disable-generic

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/libelf \
		CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) -I$(STAGING_DIR)/usr/lib/libintl/include" \
		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib/libintl/lib -lintl" \
		DESTDIR="$(PKG_INSTALL_DIR)"
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/libelf/libelf.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libelf/libelf.{a,so*} $(1)/usr/lib/
endef

define Package/elfutils/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libelf/libelf.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,elfutils))
