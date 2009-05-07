#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=ink
PKG_VERSION:=0.5.0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/ink
PKG_MD5SUM:=ddbbc4164384fc7185bc07b7602e4a8d

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

PKG_BUILD_DEPENDS:=libinklevel

include $(INCLUDE_DIR)/package.mk

define Package/ink
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A utility for reading ink levels
  DEPENDS:=+libinklevel
  URL:=http://ink.sourceforge.net/
endef

TARGET_CFLAGS += -linklevel


define Build/Compile
        $(MAKE) -C $(PKG_BUILD_DIR) \
                CC="$(TARGET_CC)" \
                CFLAGS="$(TARGET_CFLAGS)" \
                CPPFLAGS="$(TARGET_CPPFLAGS)" \
                LDFLAGS="$(TARGET_LDFLAGS)" \
                LIBS="$(TARGET_LIBS)" \
                DESTDIR="$(PKG_INSTALL_DIR)" \
                all install
endef


define Package/ink/install
       $(INSTALL_DIR) $(1)/bin
       $(CP) $(PKG_INSTALL_DIR)/usr/local/bin/ink $(1)/bin/
endef

$(eval $(call BuildPackage,ink))
