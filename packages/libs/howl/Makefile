# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=howl
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.porchdogsoft.com/download/
PKG_MD5SUM:=c389d3ffba0e69a179de2ec650f1fdcc
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/howl/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Zeroconf networking implementation
  DESCRIPTION:=\
	Howl is a cross-platform implementation of Zeroconf networking.
  URL:=http://www.porchdogsoft.com/products/howl/
endef

define Package/libhowl
  $(call Package/howl/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (library)
  DESCRIPTION+=\\\
	\\\
	This package contains the Howl shared libraries, used by other programs.
endef

define Package/howl-autoipd
  $(call Package/howl/Default)
  DEPENDS:=+libhowl
  TITLE:=An IPv4 Link-Local address self-assigner daemon
  DESCRIPTION+=\\\
	\\\
	This package contains an IPv4 Link-Local address self-assigner daemon.
endef

define Package/howl-mdnsresponder
  $(call Package/howl/Default)
  DEPENDS:=+libhowl
  TITLE:=An mDNS (Multicast DNS) service responder daemon
  DESCRIPTION+=\\\
	\\\
	This package contains an mDNS (Multicast DNS) service responder daemon.
endef

define Package/howl-mdnsresponder/conffiles
/etc/mDNSResponder.conf
endef

define Package/howl-nifd
  $(call Package/howl/Default)
  DEPENDS:=+libhowl
  TITLE:=A network interface monitor daemon
  DESCRIPTION+=\\\
	\\\
	This package contains a network interface monitor daemon.
endef

define Package/howl-utils
  $(call Package/howl/Default)
  DEPENDS:=+libhowl
  TITLE+= (utilities)
  DESCRIPTION+=\\\
	\\\
	This package contains mDNS (Multicast DNS) client utilities.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	);
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/howl $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{howl,mDNSResponder}.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/howl.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,-I/usr/include,,g' $(STAGING_DIR)/usr/lib/pkgconfig/howl.pc
	$(SED) 's,-L/usr/lib/howl,,g' $(STAGING_DIR)/usr/lib/pkgconfig/howl.pc
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/include/howl \
		$(STAGING_DIR)/usr/lib/lib{howl,mDNSResponder}.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/howl.pc
endef

define Package/libhowl/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{howl,mDNSResponder}.so.* $(1)/usr/lib/
endef

define Package/howl-autoipd/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/autoipd $(1)/usr/sbin/
	install -d -m0755 $(1)/etc/init.d
	install -m0644 ./files/autoipd.init $(1)/etc/init.d/autoipd
endef
	
define Package/howl-mdnsresponder/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mDNSResponder $(1)/usr/sbin/
	install -d -m0755 $(1)/etc
	install -m0644 ./files/mDNSResponder.conf $(1)/etc/mDNSResponder.conf
	install -d -m0755 $(1)/etc/init.d
	install -m0644 ./files/mDNSResponder.init $(1)/etc/init.d/mDNSResponder
endef

define Package/howl-nifd/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/nifd $(1)/usr/sbin/
	install -d -m0755 $(1)/etc/init.d
	install -m0644 ./files/nifd.init $(1)/etc/init.d/nifd
endef
	
define Package/howl-utils/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mDNS{Browse,Publish,Query,Resolve} $(1)/usr/bin/
endef
	
$(eval $(call BuildPackage,libhowl))
$(eval $(call BuildPackage,howl-autoipd))
$(eval $(call BuildPackage,howl-mdnsresponder))
$(eval $(call BuildPackage,howl-nifd))
$(eval $(call BuildPackage,howl-utils))
