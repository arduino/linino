#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=lsof
PKG_VERSION:=4.81
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).dfsg.1.orig.tar.gz
PKG_SOURCE_URL:=http://ftp2.de.debian.org/debian/pool/main/l/lsof
PKG_MD5SUM:=138b628cb1b6a3b16b32b792f77abcce

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION).dfsg.1

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include

define Package/lsof
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=LiSt Open Files - a diagnostic tool
  URL:=http://people.freebsd.org/~abe/
endef

define Build/Configure
	cd $(PKG_BUILD_DIR); \
		LINUX_CLIB="-DGLIBCV=2" \
		LSOF_CC="$(TARGET_CC)" \
		LSOF_VSTR="$(LINUX_VERSION)" \
		./Configure -n linux
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		AR="$(TARGET_CROSS)ar cr" \
		RANLIB="$(TARGET_CROSS)ranlib" \
		DEBUG="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" 
endef

define Package/lsof/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lsof $(1)/usr/bin
endef

$(eval $(call BuildPackage,lsof))
