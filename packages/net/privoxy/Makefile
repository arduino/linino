#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=privoxy
PKG_VERSION:=3.0.17
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-stable-src.tar.gz
PKG_SOURCE_URL:=@SF/ijbswa
PKG_MD5SUM:=9d363d738a3f3d73e774d6dfeafdb15f

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-stable
PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/privoxy
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  DEPENDS:=+libpcre +libpthread
  TITLE:=web proxy with advanced filtering capabilities
  URL:=http://www.privoxy.org/
endef

define Package/privoxy/description
	Privoxy is a web proxy with advanced filtering capabilities for 
	protecting privacy, modifying web page content, managing cookies, 
	controlling access, and removing ads, banners, pop-ups and other 
	obnoxious Internet junk. Privoxy has a very flexible configuration 
	and can be customized to suit individual needs and tastes. Privoxy 
	has application for both stand-alone systems and multi-user networks.
endef

CONFIGURE_ARGS += \
	--sysconfdir=/etc/privoxy \

MAKE_FLAGS :=

define Package/privoxy/conffiles
/etc/privoxy/config
endef

define Package/privoxy/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/privoxy $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/privoxy
	$(CP) $(PKG_INSTALL_DIR)/etc/privoxy/* $(1)/etc/privoxy/
	$(INSTALL_CONF) ./files/privoxy.config $(1)/etc/privoxy/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/privoxy.init $(1)/etc/init.d/privoxy
endef

$(eval $(call BuildPackage,privoxy))
