#
# Copyright (C) 2009-2010 Thomas Heil <heil@terminal-consulting.de> 
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=haproxy
PKG_VERSION:=1.4.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://haproxy.1wt.eu/download/1.4/src/
PKG_MD5SUM:=7f27c2dec3d67fce1b113be5fe878c33

include $(INCLUDE_DIR)/package.mk

define Package/haproxy
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcre +libltdl
  TITLE:=The Reliable, High Performance TCP/HTTP Load Balancer
  URL:=http://haproxy.1wt.eu/
  SUBMENU:=Proxy Servers
endef

define Package/haproxy/conffiles
/etc/haproxy.cfg
endef

define Package/haproxy/description
  Open source High Performance TCP/HTTP Load Balancer
endef

define Build/Compile
	$(MAKE) TARGET=$(if $(CONFIG_LINUX_2_4),linux24,linux26) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LD="$(TARGET_CC)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		SMALL_OPTS="-DBUFSIZE=16060 -DMAXREWRITE=4096" \
		all install
endef

define Package/haproxy/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/haproxy $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/haproxy.cfg $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/haproxy.init $(1)/etc/init.d/haproxy
	$(INSTALL_DIR) $(1)/etc/hotplug.d/net
	$(INSTALL_BIN) ./files/haproxy.hotplug $(1)/etc/hotplug.d/net/90-haproxy
endef

$(eval $(call BuildPackage,haproxy))
