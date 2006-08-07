#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=rrs
PKG_VERSION:=1.70
PKG_RELEASE:=1
PKG_MD5SUM:=b400d03c0e39e3e78a7327ba78f789f0

PKG_SOURCE_URL:=http://www.cycom.se/uploads/36/19 

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/rrs
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+uclibcxx +libopenssl
  TITLE:=A reverse (connecting) remote shell, with SSL support
  DESCRIPTION:=A reverse (connecting) remote shell, built with SSL support.
  URL:=http://www.cycom.se/dl/rrs/
endef

define Package/rrs-nossl
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+uclibcxx 
  TITLE:=A reverse (connecting) remote shell, without SSL support
  DESCRIPTION:=A reverse (connecting) remote shell, built with SSL support.
  URL:=http://www.cycom.se/dl/rrs/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include -fno-builtin -fno-rtti -nostdinc++" \
		LDFLAGS="-nodefaultlibs -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -luClibc++ -lc -lm -lutil -lssl -lcrypto" \
		generic
	( cd $(PKG_BUILD_DIR); mv rrs rrs-ssl; )
	$(MAKE) -C $(PKG_BUILD_DIR) \
		clean
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include -fno-builtin -fno-rtti -nostdinc++" \
		LDFLAGSNOSSL="-nodefaultlibs -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -luClibc++ -lc -lm -lutil" \
		generic-nossl
	( cd $(PKG_BUILD_DIR); mv rrs rrs-nossl; )
endef

define Package/rrs/install	
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/rrs-ssl $(1)/usr/bin/rrs
endef

define Package/rrs-nossl/install	
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/rrs-nossl $(1)/usr/bin/rrs
endef

$(eval $(call BuildPackage,rrs))
$(eval $(call BuildPackage,rrs-nossl))
