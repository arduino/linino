#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bzip2
PKG_VERSION:=1.0.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.bzip.org/$(PKG_VERSION)
PKG_MD5SUM:=3c15a0c8d1d3ee1c46a1634d00617b1a

include $(INCLUDE_DIR)/package.mk

define Package/bzip2
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=
  TITLE:=bzip2 is a compression utility.
  URL:=http://www.bzip.org/
endef

define Package/bzip2/description
	bzip2 is a freely available, patent free, high-quality
	data compressor.
endef

TARGET_CFLAGS += $(FPIC)
CONFIGURE_ARGS += --prefix=/usr

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)" \
	LDFLAGS="$(TARGET_LDLAGS)" \
	bzip2 \

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/bzlib.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libbz2.a $(1)/usr/lib/
endef

define Package/bzip2/install
	mkdir -p $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,bzip2))
