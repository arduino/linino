#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=iperf
PKG_VERSION:=2.0.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://dast.nlanr.net/Projects/Iperf2.0
PKG_MD5SUM:=bb658aba58a5af0356f5b1342dfe8f53

include $(INCLUDE_DIR)/package.mk

define Package/iperf
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+uclibcxx
  TITLE:=Internet Protocol bandwidth measuring tool
  URL:=http://dast.nlanr.net/Projects/Iperf/ 
endef

define Package/iperf/description
 Iperf is a modern alternative for measuring TCP and UDP bandwidth 
 performance, allowing the tuning of various parameters and 
 characteristics.
endef

CONFIGURE_ARGS += \
	--disable-multicast \
	--disable-threads \

CONFIGURE_VARS += \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/uClibc++" \
	CXXFLAGS="$$$$CXX_CFLAGS -fno-builtin -fno-rtti -nostdinc++" \
	LIBS="-nodefaultlibs -luClibc++ -lgcc" \

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/iperf/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/iperf $(1)/usr/bin/
endef

$(eval $(call BuildPackage,iperf))
