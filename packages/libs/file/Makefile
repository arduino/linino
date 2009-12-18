# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=file
PKG_VERSION:=4.26
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.astron.com/pub/file/
PKG_MD5SUM:=74cd5466416136da30a4e69f74dbc7a0

include $(INCLUDE_DIR)/package.mk

define Package/libmagic
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+zlib
  TITLE:=Determines file type using 'magic' numbers
  URL:=ftp://ftp.astron.com/pub/file/
endef

define Package/file
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libmagic
  TITLE:=Determines file type using 'magic' numbers
  URL:=ftp://ftp.astron.com/pub/file/
endef

define Package/file/description
 File tests each argument in an attempt to classify it. There
 are three sets of tests, performed in this order: filesystem
 tests, magic number tests, and language tests. The first test
 that succeeds causes the file type to be printed.

 Starting with version 4, the file command is not much more than
 a wrapper around the "magic" library. 
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-rpath \
	--without-libiconv-prefix \
	--without-libintl-prefix \

MAKE_FLAGS += \
	-C $(PKG_BUILD_DIR)/src \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	all install \

define Build/Prepare
	$(call Build/Prepare/Default)
	chmod -R u+w $(PKG_BUILD_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/magic.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmagic.{a,so*} $(1)/usr/lib/
endef

define Package/libmagic/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmagic.so.* $(1)/usr/lib/
endef

define Package/file/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/share/file
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/file $(1)/usr/bin
	(cd $(PKG_BUILD_DIR)/magic/Magdir; rm -f magic.mime; for file in `ls`; do cat $$$${file} >> magic.mime; done)
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/magic/Magdir/magic.mime $(1)/usr/share/file/magic
endef

$(eval $(call BuildPackage,libmagic))
$(eval $(call BuildPackage,file))
