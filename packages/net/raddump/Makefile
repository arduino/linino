#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=raddump
PKG_VERSION:=0.3.1
PKG_RELEASE:=1
PKG_MD5SUM:=f8c29c67141ea78bb6ae8b97d5149480
PKG_SOURCE_URL:=@SF/raddump
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/raddump
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap +libopenssl
  TITLE:=raddump interprets captured RADIUS packets.
  DESCRIPTION:=raddump interprets captured RADIUS packets to print a\\\
	timestamp, packet length, RADIUS packet type, source and\\\
	destination hosts and ports, and included attribute names and\\\
	values for each packet.\\\
  URL:=http://sourceforge.net/projects/raddump
endef

define Build/Configure	
$(call Build/Configure/Default,,ac_cv_c_bigendian=no \
                ac_cv_func_malloc_0_nonnull=yes \
                ac_cv_func_realloc_0_nonnull=yes)
endef

define Build/Compile	
	$(MAKE) DESTDIR=$(PKG_INSTALL_DIR) -C $(PKG_BUILD_DIR) install
endef

define Package/raddump/install	
	mkdir -p $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,raddump))
