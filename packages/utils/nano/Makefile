#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=nano
PKG_VERSION:=1.3.8
PKG_RELEASE:=1
PKG_MD5SUM:=20633397bf5d462255f37dfcc7cad4e7

PKG_SOURCE_URL:=http://www.ewtoo.org/~astyanax/nano/dist/v1.3 \
	http://www.nano-editor.org/dist/v1.3
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/nano
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses
  TITLE:=An enhanced clone of the Pico text editor
  DESCRIPTION:=GNU nano (Nano's ANOther editor, or Not ANOther editor) is an enhanced clone of the Pico text editor..
  URL:=http://www.nano-editor.org/
endef

define Build/Configure
$(call Build/Configure/Default,--enable-shared \
                        --disable-static \
                        --with-gnu-ld \
                        --disable-rpath \
                        --enable-tiny \
                        --disable-glibtest \
                        --disable-utf8 \
                        --without-slang,ac_cv_header_regex_h=no)
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/nano/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/nano $(1)/usr/bin/
endef

$(eval $(call BuildPackage,nano))
