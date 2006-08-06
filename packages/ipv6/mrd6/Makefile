#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mrd6
PKG_VERSION:=0.9.5
PKG_RELEASE:=1
PKG_MD5SUM:=24a08cf1407000d628a272b08a415dda

PKG_SOURCE_URL:=http://hng.av.it.pt/mrd6/download/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/mrd6
  SECTION:=ipv6
  CATEGORY:=IPv6
  DEPENDS:=+uclibcxx
  TITLE:=IPv6 multicast routing daemon
  DESCRIPTION:=Multicast is becoming a major component in next generation\\\
		networks, used in several scenarios, from video broadcasting\\\
		to multimedia conferencing. In order to be implemented, new\\\
		technology needs supporting hardware and software across a set\\\
		of devices and systems. MRD6 is an implementation of a modular\\\
		IPv6 Multicast Routing Framework for the Linux operating system\\\
		and provides MLDv2 (as well as MLDv1), PIM-SM and MBGP support.\\\
  URL:=http://artemis.av.it.pt/mrd6/
endef

define Package/mrd6/conffiles
/etc/mrd6.conf
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		OPTIMIZE=yes \
		SPACE_OPTIMIZE=yes \
		FULL_STATIC=yes \
		CFLAGS="$(TARGET_CFLAGS) -DNO_INET6_OPTION" \
		CXX=$(TARGET_CROSS)g++ \
		CC=$(TARGET_CC) \
		STAGING_DIR=$(STAGING_DIR) \
		DESTDIR=$(PKG_INSTALL_DIR) \
		PREFIX=/usr/ \
		install
endef

define Package/mrd6/install
	install -d -m0755 $(1)/etc/init.d
	install -m0644 files/mrd6.conf $(1)/etc
	install -m0755 files/mrd6.init $(1)/etc/init.d/S60mrd6
endef

$(eval $(call BuildPackage,mrd6))
