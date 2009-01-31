# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id:$
#
# Author: Carlos Cesario

include $(TOPDIR)/rules.mk

PKG_NAME:=imspector
PKG_VERSION:=0.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.imspector.org/downloads
PKG_MD5SUM:=08f983f5cd54094dac51ab39fe1ae839

include $(INCLUDE_DIR)/package.mk

define Package/imspector
	SECTION:=net
	CATEGORY:=Network
	TITLE:=IMSpector is an Instant Messenger proxy
	URL:=http://www.imspector.org
	DEPENDS:=+libopenssl +libstdcpp +libmysqlclient +libsqlite3 +libpq
endef

define Package/imspector/description
	IMSpector is an Instant Messenger proxy with monitoring and blocking, and content-filtering capabilities.
endef


define Package/imspector/conffiles
/etc/config/imspector
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		sed -ie 's/#ADD_PLUGINS/ADD_PLUGINS/' Makefile \
	);
endef


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
	    DESTDIR="$(PKG_INSTALL_DIR)" \
	    $(TARGET_CONFIGURE_OPTS) \
	    SSL_DIR="$(STAGING_DIR)/usr" \
	    SSL_LIBS="-L$(STAGING_DIR)/usr/lib -lssl -lcrypto" \
	    SSL_FLAGS="-I$(STAGING_DIR)/usr/include -DHAVE_SSL" \
	    SSL_OBJS=sslstate.o \
	    PREFIX="$(STAGING_DIR)/usr" \
	    CXX=$(TARGET_CXX) \
	    CXXFLAGS="$(TARGET_CXXFLAGS) $(TARGET_CFLAGS) $(FPIC) -I$(STAGING_DIR)/usr/include \
			-L$(STAGING_DIR)/usr/lib -DHAVE_SSL" \
	    all
endef


define Build/Install
	$(MAKE) -C $(PKG_BUILD_DIR) \
	    DESTDIR="$(PKG_INSTALL_DIR)" \
	    install
endef

define Package/imspector/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/imspector  $(1)/usr/sbin/imspector
	$(INSTALL_DIR) $(1)/usr/lib/$(PKG_NAME)
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libimspector.so $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/$(PKG_NAME)/*.so $(1)/usr/lib/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc/config
	$(CP) ./files/imspector.config $(1)/etc/config/imspector 
	$(INSTALL_DIR) $(1)/etc/init.d
	$(CP) ./files/imspector.init $(1)/etc/init.d/imspector
	$(CP) $(PKG_INSTALL_DIR)/usr/etc/$(PKG_NAME)/badwords.txt $(1)/etc/$(PKG_NAME)/
	$(CP) $(PKG_INSTALL_DIR)/usr/etc/$(PKG_NAME)/acl.txt $(1)/etc/$(PKG_NAME)/
	$(INSTALL_DIR) $(1)/var/log/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/var/lib/$(PKG_NAME)
endef

$(eval $(call BuildPackage,imspector))
