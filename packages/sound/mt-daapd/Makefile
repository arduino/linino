#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mt-daapd
PKG_VERSION:=0.2.4
PKG_RELEASE:=1
PKG_MD5SUM:=2e1cdbe6b94ef153e915806f80a28dca

PKG_SOURCE_URL:=@SF/mt-daapd
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/mt-daapd
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libgdbm +libhowl +libid3tag
  TITLE:=A multi-threaded DAAP (Digital Audio Access Protocol) daemon
  DESCRIPTION:=mt-daapd is a program which acts as an iTunes (DAAP) server for Linux.
  URL:=http://www.mt-daapd.org
endef

define Package/mt-daapd/conffiles
/etc/mt-daapd.conf
/etc/mt-daapd.playlist
endef

define Build/Configure
$(call Build/Configure/Default,--enable-shared \
                        --disable-static \
                        --enable-mdns \
                        --enable-howl \
                        --with-id3tag="$(STAGING_DIR)/usr" \
                        --with-gdbm-includes="$(STAGING_DIR)/usr/include" \
                        --with-gdbm-libs="$(STAGING_DIR)/usr/lib" \
                        --with-howl-includes="$(STAGING_DIR)/usr/include/howl" \
                        --with-howl-libs="$(STAGING_DIR)/usr/lib" \
                        --without-static-libs,ac_cv_func_setpgrp_void=yes)
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/mt-daapd/install	
	install -m0755 -d $(1)/etc
	install -m0644 $(PKG_BUILD_DIR)/contrib/mt-daapd.conf $(1)/etc/
	install -m0644 $(PKG_BUILD_DIR)/contrib/mt-daapd.playlist $(1)/etc/
	install -m0755 -d $(1)/etc/init.d
	install -m0755 ./files/mt-daapd.init $(1)/etc/init.d/mt-daapd
	install -m0755 -d $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/usr/share/mt-daapd $(1)/usr/share/
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/mt-daapd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,mt-daapd))
