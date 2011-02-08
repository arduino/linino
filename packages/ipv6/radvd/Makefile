#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=radvd
PKG_VERSION:=1.7
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://v6web.litech.org/radvd/dist \
		http://download.sourcemage.org/mirror
PKG_MD5SUM:=5ec417bde33964a07231ddf6353177c8

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/radvd
  SECTION:=ipv6
  CATEGORY:=IPv6
  TITLE:=IPv6 Routing Advertisement Daemon
  URL:=http://v6web.litech.org/radvd/
  DEPENDS:=+kmod-ipv6
endef

define Package/radvd/description
IPv6 Routing Advertisement Daemon.
endef

CONFIGURE_ARGS += \
	--with-configfile=/etc/radvd.conf \
	--with-logfile=/var/log/radvd.log \
	--with-pidfile=/var/run/radvd.pid

MAKE_FLAGS += \
	radvd_LDADD=""

define Package/radvd/conffiles
/etc/config/radvd
endef

define Package/radvd/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/radvd.config $(1)/etc/config/radvd
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/radvd.init $(1)/etc/init.d/radvd
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/radvd $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/radvdump $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,radvd))
