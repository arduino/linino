#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=tmsnc
PKG_VERSION:=0.3.1
PKG_RELEASE:=1
PKG_MD5SUM:=3b30e5dab0b1b679d2b945c3a5713636
PKG_SOURCE_URL:=@SF/tmsnc
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/tmsnc
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libiconv +libncurses +libopenssl
  TITLE:=text-based MSN client
  DESCRIPTION:=TMSNC is a textbased (console) MSN client written in C.
  URL:=http://tmsnc.sourceforge.net
endef

define Build/Configure
$(call Build/Configure/Default,--with-libiconv-prefix=$(STAGING_DIR)/usr \
                  --with-openssl="$(STAGING_DIR)/usr" \
                  --with-ncurses="$(STAGING_DIR)/usr" \
                  --with-gnu-ld, ac_cv_func_malloc_0_nonnull=yes \
		  ac_cv_func_realloc_0_nonnull=yes)
endef

define Build/Compile
$(call Build/Compile/Default,DESTDIR="$(PKG_INSTALL_DIR)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		install)
	rm -rf $(PKG_INSTALL_DIR)/usr/man
endef

define Package/tmsnc/install	
	mkdir -p $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,tmsnc))
