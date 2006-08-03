# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=iftop
PKG_VERSION:=0.17
PKG_RELEASE:=1
PKG_MD5SUM:=062bc8fb3856580319857326e0b8752d

PKG_SOURCE_URL:=http://www.ex-parrot.com/~pdw/iftop/download
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/iftop
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap +libncurses +libpthread
  TITLE:=display bandwith usage on an interface
  DESCRIPTION:=iftop does for network usage what top(1) does for CPU usage. It\\\
listens to network traffic on a named interface and displays a\\\
table of current bandwidth usage by pairs of hosts. Handy for\\\
answering the question "why is our ADSL link so slow?".\\\
  URL:=http://www.ex-parrot.com/~pdw/iftop/
endef

define Build/Configure
$(call Build/Configure/Default)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC=$(TARGET_CC) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
endef

define Package/iftop/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,iftop))
