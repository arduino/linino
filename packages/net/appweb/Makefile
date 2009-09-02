#
#  	Makefile for the Appweb Web Server
#
#  	Copyright (C) 2009 Embedthis Software
#
#  	This software is licensed under the GPLv2. Commercial and other licenses
#   are available from http://www.embedthis.com.
#
# 	$Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=appweb
PKG_RELEASE:=1

#
#	Build 3.0B.3
#
PKG_SOURCE_URL:=http://www.appwebserver.org/software/
PKG_VERSION:=3.0B.2-3
PKG_MD5SUM:=b54a99d388a5588a9af33aa1c6354e06
PKG_SOURCE:=$(PKG_NAME)-src-$(PKG_VERSION).tar.gz
#
#	Build the latest snapshot from the default trunk
#
#	PKG_SOURCE:=tip.tar.gz
#	PKG_SOURCE_URL:= http://hg.embedthis.com/appweb/archive/
#	PKG_VERSION:=default
#	PKG_MD5SUM:=

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS += -q --defaults=release --shared --tune=size --without-php \
	--without-ssl --disable-angel --disable-samples --disable-access-log \
	--disable-complete-native --disable-complete-cross --webdir=/www \
	--logdir=/var/log --port=8000 --sslPort=8443 --config=flat

define Package/appweb
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Appweb Web Server
  VERSION:=$(PKG_VERSION)
  URL:=http://www.appwebserver.org/
endef

define Package/appweb/description
	Appweb is a powerful, compact embedded web server designed for dynamic web
	applications.
endef

define Build/Prepare
	rm -rf $(PKG_BUILD_DIR)
	mkdir -p $(PKG_BUILD_DIR)
	tar xzf "$(DL_DIR)/$(PKG_SOURCE)" --strip-components 1 -C "$(PKG_BUILD_DIR)"
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) $(TARGET_CONFIGURE_OPTS)
endef

define Package/appweb/install
	( cd $(PKG_BUILD_DIR) ; $(PKG_BUILD_DIR)/build/bin/makeInstall \
		--root=$(1) --install --with-openwrt=1 binary )
	rm -rf $(1)/var
endef

$(eval $(call BuildPackage,appweb))

