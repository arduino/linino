# 
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=upx
PKG_VERSION:=3.04
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.bz2
PKG_SOURCE_URL:=http://upx.sourceforge.net/download/
PKG_MD5SUM:=68d662b1f831335460f9bfdbf632c6ce

TAR_OPTIONS+=--transform='s,$(PKG_NAME)-$(PKG_VERSION)-src,$(PKG_NAME)-$(PKG_VERSION),'

include $(INCLUDE_DIR)/package.mk

define Package/upx
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libucl
  TITLE:=The Ultimate Packer for eXecutables
  URL:=http://upx.sourceforge.net/
endef

define Package/upx/description
UPX is a free, portable, extendable, high-performance executable packer for
several different executable formats. It achieves an excellent compression ratio
and offers very fast decompression. Your executables suffer no memory overhead
or other drawbacks for most of the formats supported, because of in-place
decompression.
endef

MAKE_VARS += \
	UPX_UCLDIR="$(STAGING_DIR)/usr/include/ucl" \
	exeext=""

define Build/Compile
	$(call Build/Compile/Default, \
		all \
	)
endef

define Package/upx/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/upx $(1)/usr/bin/
endef

$(eval $(call BuildPackage,upx))
