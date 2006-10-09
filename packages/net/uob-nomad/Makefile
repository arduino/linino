# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=uob-nomad
PKG_VERSION:=0.11
PKG_RELEASE:=1
PKG_MD5SUM:=9c7445cefaf8d6160017aef606f2e558

PKG_SOURCE_URL:=http://www.comnets.uni-bremen.de/~mab/openwrt/source/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/uob-nomad
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+kmod-ipip +libpthread
  TITLE:=UoB Nomad
  DESCRIPTION:=This is an implementation of NOMADv4 (Filters for\\\
  	Mobile IP, IETF Draft\\\
  	draft-mobileip-nomad-filters-05.txt) for Linux,\\\
  	based on the Sun Labs Mobile IP software. It is\\\
  	released under the Sun Public License (SPL).\\\
  	\\\
  	This version (0.11) has been modified to provide\\\
  	status information to the UoB-NOMAD-GUI (ver 0.1).
  URL:=http://www.comnets.uni-bremen.de/~mab/openwrt/source/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/Agent \
		CC=$(TARGET_CC) \
		$(TARGET_CONFIGURE_OPTS) \
		mipagent
	$(MAKE) -C $(PKG_BUILD_DIR)/Client/net-tools \
		CC=$(TARGET_CC) \
		$(TARGET_CONFIGURE_OPTS) \
		clean
	$(MAKE) -C $(PKG_BUILD_DIR)/Client/net-tools/lib \
		CC=$(TARGET_CC) \
		$(TARGET_CONFIGURE_OPTS) \
		clean
	$(MAKE) -C $(PKG_BUILD_DIR)/Client/net-tools \
		CC=$(TARGET_CC) \
		$(TARGET_CONFIGURE_OPTS) \
		all
	$(MAKE) -C $(PKG_BUILD_DIR)/Client \
		CC=$(TARGET_CC) \
		$(TARGET_CONFIGURE_OPTS) \
		mipmn
endef

define Package/uob-nomad/install	
	install -d -m0755 $(1)/usr/bin $(1)/usr/lib $(1)/etc/
	$(CP) $(PKG_BUILD_DIR)/Agent/mipagent $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/Client/mipmn $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/conf/mip{agent,mn,mn-filters}.conf $(1)/etc/
endef

$(eval $(call BuildPackage,uob-nomad))
