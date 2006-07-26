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

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.porchdogsoft.com/download/
PKG_MD5SUM:=c389d3ffba0e69a179de2ec650f1fdcc
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libhowl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A Zeroconf networking implementation (library)
  DESCRIPTION:=A Zeroconf networking implementation (library).\\\
    A cross-platform implementation of Zeroconf networking.\\\
    \\\
    This package contains shared libraries, needed by other programs.
  URL:=http://www.porchdogsoft.com/products/howl/
endef

define Package/howl-utils
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libhowl
  TITLE:=A Zeroconf networking implementation (utilities)
  DESCRIPTION:=A Zeroconf networking implementation (utilities).\\\
    A cross-platform implementation of Zeroconf networking.\\\
    \\\
    This package contains mDNS client utilities.
  URL:=http://www.porchdogsoft.com/products/howl/
endef

define Package/autoipd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libhowl
  TITLE:=An IPv4 Link-Local address self-assigner daemon
  DESCRIPTION:=An IPv4 Link-Local address self-assigner daemon.\\\
    A cross-platform implementation of Zeroconf networking.\\\
    \\\
    This package contains an IPv4 Link-Local address self-assigner daemon.
  URL:=http://www.porchdogsoft.com/products/howl/
endef

define Package/mdnsresponder
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libhowl
  TITLE:=An mDNS (Multicast DNS) service responder daemon
  DESCRIPTION:=An mDNS (Multicast DNS) service responder daemon.\\\
    A cross-platform implementation of Zeroconf networking.\\\
    \\\
    This package contains an mDNS (Multicast DNS) service responder daemon.
  URL:=http://www.porchdogsoft.com/products/howl/
endef

define Package/mdnsresponder/conffiles
/etc/mDNSResponder.conf
endef

define Package/nifd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libhowl
  TITLE:=A network interface monitor daemon
  DESCRIPTION:=A network interface monitor daemon.\\\
    A cross-platform implementation of Zeroconf networking.\\\
    \\\
    This package contains a network interface monitor daemon.
  URL:=http://www.porchdogsoft.com/products/howl/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		./configure \
			--target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--program-prefix="" \
			--program-suffix="" \
			--prefix=/usr \
			--exec-prefix=/usr \
			--bindir=/usr/bin \
			--datadir=/usr/share \
			--includedir=/usr/include \
			--infodir=/usr/share/info \
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			--enable-shared \
			--enable-static \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libhowl/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{howl,mDNSResponder}.so.* $(1)/usr/lib/
endef

define Package/howl-utils/install
	install -m0755 -d $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mDNS{Browse,Publish,Query,Resolve} $(1)/usr/bin/
endef
	
define Package/mdnsresponder/install
	install -m0755 -d $(1)/etc
	install -m0644 ./files/mDNSResponder.conf $(1)/etc/mDNSResponder.conf
	install -m0755 -d $(1)/etc/init.d
	install -m0644 ./files/mDNSResponder.init $(1)/etc/init.d/mDNSResponder
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mDNSResponder $(1)/usr/sbin/
endef
	
define Package/autoipd/install
	install -m0755 -d $(1)/etc/init.d
	install -m0644 ./files/autoipd.init $(1)/etc/init.d/autoipd
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/autoipd $(1)/usr/sbin/
endef
	
define Package/nifd/install
	install -m0755 -d $(1)/etc/init.d
	install -m0644 ./files/nifd.init $(1)/etc/init.d/nifd
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/nifd $(1)/usr/sbin/
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
	rm -rf \
		$(STAGING_DIR)/usr/include/howl \
		$(STAGING_DIR)/usr/lib/lib{howl,mDNSResponder}.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/howl.pc
endef

$(eval $(call BuildPackage,libhowl))
$(eval $(call BuildPackage,howl-utils))
$(eval $(call BuildPackage,autoipd))
$(eval $(call BuildPackage,mdnsresponder))
$(eval $(call BuildPackage,nifd))
