#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=bzip2
PKG_VERSION:=1.0.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.bzip.org/$(PKG_VERSION)/
PKG_MD5SUM:=fc310b254f6ba5fbb5da018f04533688

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/bzip2
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=
  TITLE:=bzip2 is a compression utility.
  URL:=http://www.bzip.org/
endef

define Package/bzip2/description
	bzip2 is a freely available, patent free, high-quality \
	data compressor.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--prefix=/usr \
	);
endef

define Build/Compile
	$(call Build/Compile/Default, \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDLAGS)" \
		bzip2 \
        )
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/bzlib.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libbz2.a $(1)/usr/lib/
endef

define Package/bzip2/install
	mkdir -p $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bzip2 $(1)/usr/bin/
endef

$(eval $(call BuildPackage,bzip2))

