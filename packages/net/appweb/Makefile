#
# Copyright (C) 2009-2010 OpenWrt.org
# Copyright (C) 2009 Embedthis Software
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Commercial and other licenses are available from http://www.embedthis.com/.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=appweb
PKG_RELEASE:=1

#
#	Build stable
#
PKG_VERSION:=3.2.2-1
PKG_SOURCE:=$(PKG_NAME)-src-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.appwebserver.org/software/
PKG_MD5SUM:=060d43c8194fa6a119cada966fc807a7

#
#	Build the latest snapshot from the default trunk
#
#PKG_VERSION:=default
#PKG_SOURCE:=tip.tar.gz
#PKG_SOURCE_URL:= http://hg.embedthis.com/appweb/archive/
#PKG_MD5SUM:=

include $(INCLUDE_DIR)/package.mk

define Package/appweb
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Appweb Web Server
  URL:=http://www.appwebserver.org/
  DEPENDS:=@!avr32 +libpthread
endef

define Package/appweb/description
 Appweb is a powerful, compact embedded web server designed for dynamic web
 applications.
endef

CONFIGURE_ARGS += \
	-q --defaults=release --shared --tune=size --without-php \
	--without-ssl --disable-angel --disable-samples --disable-access-log \
	--disable-complete-native --disable-complete-cross --webdir=/www \
	--logdir=/var/log --port=8000 --sslPort=8443 --config=flat

define Build/Prepare
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
