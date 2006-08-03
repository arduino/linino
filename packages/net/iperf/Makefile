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
PKG_MD5SUM:=bb658aba58a5af0356f5b1342dfe8f53

PKG_SOURCE_URL:=http://dast.nlanr.net/Projects/Iperf2.0
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/iperf
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+uclibcxx
  TITLE:=Internet Protocol bandwidth measuring tool
  DESCRIPTION:=Iperf is a modern alternative for measuring TCP and UDP bandwidth\\\
performance, allowing the tuning of various parameters and\\\
characteristics.\\\
  URL:=http://dast.nlanr.net/Projects/Iperf/ 
endef

define Build/Configure
$(call Build/Configure/Default,--enable-shared \
--disable-static \
--disable-rpath \
--disable-multicast \
--disable-threads,CXXFLAGS="$(TARGET_CFLAGS) -fno-builtin -fno-rtti -nostdinc++" \
LDFLAGS="-nodefaultlibs -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
LIBS="-luClibc++ -lc -lm -lgcc_s" \
ac_cv_func_malloc_0_nonnull=yes)
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Package/iperf/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/iperf $(1)/usr/bin
endef

$(eval $(call BuildPackage,iperf))
