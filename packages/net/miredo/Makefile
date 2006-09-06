#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=miredo
PKG_VERSION:=1.0.0
PKG_RELEASE:=1
PKG_MD5SUM:=b5a51cb98732decc2ada96b2caee5d3c

PKG_SOURCE_URL:=http://www.remlab.net/files/miredo/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/miredo
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +uclibcxx +kmod-ipv6 +kmod-tun
  SUBMENU:=Teredo (IPv6 tunneling over UDP through NAT) client and relay daemon
  DESCRIPTION:=A Teredo (IPv6 tunneling over UDP through NAT) client and relay daemon.
  URL:=http://www.simphalempin.com/dev/miredo/
endef

define Package/miredo-server
  $(call Package/miredo)
  TITLE:=Teredo (IPv6 tunneling over UDP through NAT) server daemon
  DESCRIPTION:=A Teredo (IPv6 tunneling over UDP through NAT) server daemon.
endef

define Package/miredo-server/conffiles
/etc/miredo-server.conf
endef

define Package/miredo-client
  $(call Package/miredo)
  TITLE:=Teredo (IPv6 tunneling over UDP through NAT) client and relay daemon
  DESCRIPTION:=Teredo (IPv6 tunneling over UDP through NAT) client and relay daemon
endef

define Package/miredo-client/conffiles
/etc/miredo.conf
endef

define Build/Configure	
$(call Build/Configure/Default,--disable-shared \
	--enable-static \
	--with-gnu-ld \
	--disable-rpath \
	--disable-chroot \
	--enable-teredo-client \
	--enable-teredo-relay \
	--enable-teredo-server \
	--enable-miredo-user=root,CXXFLAGS="$(TARGET_CFLAGS) -fno-builtin -fno-rtti -nostdinc++"  \
	CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
	LDFLAGS="-nodefaultlibs -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
	LIBS="-luClibc++ -lc -lm" \
	ac_cv_file__proc_self_maps=yes\
)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CXXLINK="\$$$$(LINK)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/miredo-server/install
	install -d -m0755 $(1)/etc/
	$(CP) $(PKG_INSTALL_DIR)/etc/miredo-server.conf-dist $(1)/etc/miredo-server.conf
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/miredo-server.init $(1)/etc/init.d/miredo-server
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/miredo-server $(1)/usr/sbin/
endef

define Package/miredo-client/install	
	install -d -m0755 $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/etc/miredo.conf-dist $(1)/etc/miredo.conf
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/miredo.init $(1)/etc/init.d/miredo
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/miredo $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,miredo-server))
$(eval $(call BuildPackage,miredo-client))
