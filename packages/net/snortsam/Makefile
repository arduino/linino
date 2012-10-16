#
# Copyright (C) 2012 OpenWrt
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=snortsam
PKG_VERSION:=2.70
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://val.bmstu.ru/unix/snort/
PKG_SOURCE:=$(PKG_NAME)-src-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=8ffa32056152e089fbacd601090f941d
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
MAKE_PATH:=src

include $(INCLUDE_DIR)/package.mk

define Package/snortsam
  SUBMENU:=Firewall
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Snortsam
  URL:=https://www.snortsam.net/
  DEPENDS:=+libpthread +snort
endef

define Package/snortsam/description
 SnortSam is a plugin for Snort, an Intrusion Detection System (IDS). The plugin allows automated blocking of IP addresses.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		$(MAKE_FLAGS) \
		all
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		$(MAKE_FLAGS) \
		samtool
endef

define Package/snortsam/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/snortsam $(PKG_BUILD_DIR)/samtool $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/conf/* $(1)/etc/
	$(CP) $(PKG_BUILD_DIR)/conf/snortsam.conf.sample $(1)/etc/snortsam.conf
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/snortsam.init $(1)/etc/init.d/snortsam
endef

$(eval $(call BuildPackage,snortsam))
