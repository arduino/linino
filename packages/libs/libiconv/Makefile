#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libiconv
PKG_VERSION:=1.11
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/libiconv
PKG_MD5SUM:=b77a17e4a5a817100ad4b2613935055e

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/libiconv/Default
  URL:=http://www.gnu.org/software/libiconv/
  TITLE:=Character set conversion
endef

define Package/libiconv
  $(call Package/libiconv/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= library
endef

define Package/libcharset
  $(call Package/libiconv/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= library
endef

define Package/iconv
  $(call Package/libiconv/Default)
  DEPENDS:=+libiconv +libcharset
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+= utility
endef

TARGET_CFLAGS += $(FPIC) -DUSE_DOS

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-rpath \
	--enable-relocatable

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/libiconv/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/iconv.h $(1)/usr/lib/libiconv/include/
	$(INSTALL_DIR) $(1)/usr/lib/libiconv/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcharset.{a,so*} $(1)/usr/lib/libiconv/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libiconv.{a,so*} $(1)/usr/lib/libiconv/lib/
endef

define Package/libcharset/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcharset.so* $(1)/usr/lib/
endef

define Package/libiconv/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libiconv.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libcharset))
$(eval $(call BuildPackage,libiconv))
$(eval $(call BuildPackage,iconv))
