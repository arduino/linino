#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=sablevm
PKG_VERSION:=1.13
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://sablevm.org/download/release/$(PKG_VERSION)/
PKG_MD5SUM:=d5828200032bfe921dd43e450931e38c
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/sablevm
  SECTION:=lang
  CATEGORY:=Languages
  DEPENDS:=+libffi-sable +libltdl +libpopt +libpthread +zlib
  TITLE:=A Java Virtual Machine (JVM) implementation
  DESCRIPTION:=SableVM is a robust, extremely portable, efficient, and specifications-\\\
    -compliant Java virtual machine that aims to be easy to maintain and to \\\
    extend. It features a state-of-the-art and efficient interpreter engine.\\\
    Its source code is very accessible and easy to understand. It also has \\\
    many robustness features that have been the object of careful design.
  URL:=http://sablevm.org/
endef


define Build/Configure
  $(call Build/Configure/Default, \
	--enable-shared \
	--disable-static, \
	LIBS="-lffi -lltdl -lpopt -lz" \
  )
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/sablevm/install
	install -m0755 -d $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/{java-,}sablevm $(1)/usr/bin/
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsablevm-*.so $(1)/usr/lib/
endef

$(eval $(call BuildPackage,sablevm))
