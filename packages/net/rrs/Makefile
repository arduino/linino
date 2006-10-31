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

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.cycom.se/uploads/36/19 
PKG_MD5SUM:=b400d03c0e39e3e78a7327ba78f789f0
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/rrs/Default
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+uclibcxx 
  TITLE:=A reverse (connecting) remote shell
  URL:=http://www.cycom.se/dl/rrs/
endef

define Package/rrs
  $(call Package/rrs/Default)
  DEPENDS+= +libopenssl
  TITLE+= (with SSL support)
endef

define Package/rrs-nossl
  TITLE+= (without SSL support)
endef

ifneq ($(SDK),)
  CONFIG_PACKAGE_rrs:=m
  CONFIG_PACKAGE_rrs-nossl:=m
endif

define Build/Compile/Template
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include -fno-builtin -fno-rtti -nostdinc++" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -Wl,-Bdynamic,-luClibc++,-Bstatic,-lstdc++,-Bdynamic $(3) -lutil -lm -lc" \
		$(2)
	( cd $(PKG_BUILD_DIR); mv rrs rrs-$(1); )
endef

ifneq ($(CONFIG_PACKAGE_rrs),)
  define Build/Compile/with-ssl
	$(call Build/Compile/Template,ssl,generic,-lcrypto -lssl)
  endef
endif

ifneq ($(CONFIG_PACKAGE_rrs-nossl),)
  define Build/Compile/without-ssl
	$(call Build/Compile/Template,nossl,generic-nossl,)
  endef
endif

define Build/Compile
	$(call Build/Compile/with-ssl)
	$(call Build/Compile/without-ssl)
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
