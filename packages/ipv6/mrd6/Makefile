#
# Copyright (C) 2006,2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mrd6
PKG_VERSION:=0.9.5
PKG_REVISION:=3
PKG_RELEASE:=$(PKG_REVISION).1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REVISION).tar.gz
PKG_SOURCE_URL:=http://fivebits.net/files/mrd6/ \
	http://hng.av.it.pt/mrd6/download/
PKG_MD5SUM:=361322198dafcc5ffab5e8e23197012b

PKG_BUILD_DEPENDS:=libnotimpl

include $(INCLUDE_DIR)/package.mk

define Package/mrd6
  SECTION:=ipv6
  CATEGORY:=IPv6
  TITLE:=IPv6 multicast routing daemon
  URL:=http://artemis.av.it.pt/mrd6/
  DEPENDS:= +uclibcxx
endef

define Package/mrd6/description
 Multicast is becoming a major component in next generation networks, used 
 in several scenarios, from video broadcasting to multimedia conferencing. 
 In order to be implemented, new technology needs supporting hardware and 
 software across a set of devices and systems. MRD6 is an implementation of 
 a modular IPv6 Multicast Routing Framework for the Linux operating system 
 and provides MLDv2 (as well as MLDv1), PIM-SM and MBGP support.
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		$(TARGET_CONFIGURE_OPTS) \
		OPTIMIZE=yes \
		SPACE_OPTIMIZE=yes \
		FULL_STATIC=no \
		CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) -DNO_INET6_OPTION -fno-builtin -fno-rtti" \
		LDFLAGS="$(TARGET_LDFLAGS) -nodefaultlibs -luClibc++ -Wl,-Bstatic,-lstdc++,-Bdynamic -ldl -lgcc -lm -lnotimpl" \
		MODULE_CXX="\$$$$(CC) -shared \$$$$(CXXFLAGS) \$$$$(LDFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		PREFIX="/usr" \
		install
endef

define Package/mrd6/conffiles
/etc/mrd6.conf
endef

define Package/mrd6/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DATA) files/mrd6.conf $(1)/etc
	$(INSTALL_BIN) files/mrd6.init $(1)/etc/init.d/mrd6
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/mrd $(1)/usr/sbin/mrd6
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mrd6sh $(1)/usr/bin/mrd6sh
	$(INSTALL_DIR) $(1)/usr/lib/mrd6
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/mrd6/bgp.so $(1)/usr/lib/mrd6/bgp.so
endef

$(eval $(call BuildPackage,mrd6))
