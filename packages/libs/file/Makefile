#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=file
PKG_VERSION:=4.26
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.astron.com/pub/file/
PKG_MD5SUM:=74cd5466416136da30a4e69f74dbc7a0

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/file/Default
  TITLE:=File type determination
  URL:=ftp://ftp.astron.com/pub/file/
endef

define Package/file
$(call package/file/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+= utility
  DEPENDS:=+libmagic
endef

define Package/libmagic
$(call package/file/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= library
  DEPENDS:=+zlib
endef

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \

MAKE_PATH := src

TARGET_CFLAGS += $(FPIC)

define Build/Compile/magic
	( cd $(PKG_BUILD_DIR)/magic/Magdir; \
		for f in `ls`; do \
			cat $$$${f}; \
		done \
	) > $(PKG_BUILD_DIR)/magic/magic
endef
Hooks/Compile/Post += Build/Compile/magic

define Build/Install/magic
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/usr/share/file
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/magic/magic $(PKG_INSTALL_DIR)/usr/share/file/
endef
Hooks/Install/Post += Build/Install/magic

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/magic.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmagic.{a,so*} $(1)/usr/lib/
endef

define Package/file/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/file $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/file
	$(CP) $(PKG_INSTALL_DIR)/usr/share/file/magic $(1)/usr/share/file/
endef

define Package/libmagic/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmagic.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,file))
$(eval $(call BuildPackage,libmagic))
