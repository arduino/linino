#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ucarp
PKG_VERSION:=1.5.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://download.pureftpd.org/pub/ucarp
PKG_MD5SUM:=9219ea8214198e8af751353a132087bb

include $(INCLUDE_DIR)/package.mk

define Package/ucarp
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Lets several hosts share one IP
  URL:=http://www.ucarp.org/project/ucarp
endef

define Package/ucarp/description
 ucarp allows a couple of hosts to share common virtual IP addresses in order
 to provide automatic failover. It is a portable userland implementation of the
 secure and patent-free Common Address Redundancy Protocol
endef

define Package/ucarp/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/ucarp $(1)/sbin/
endef

$(eval $(call BuildPackage,ucarp))
