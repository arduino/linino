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

PKG_SOURCE_URL:=http://www.remlab.net/files/miredo/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=b5a51cb98732decc2ada96b2caee5d3c

include $(INCLUDE_DIR)/package.mk

define Package/miredo/Default
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +uclibcxx +kmod-ipv6 +kmod-tun
  SUBMENU:=miredo: Teredo (IPv6 tunneling over UDP through NAT)
  URL:=http://www.simphalempin.com/dev/miredo/
endef

define Package/miredo-server
$(call Package/miredo/Default)
  TITLE:=Teredo (IPv6 tunneling over UDP through NAT) server daemon
endef

define Package/miredo-server/conffiles
/etc/miredo-server.conf
endef

define Package/miredo-client
$(call Package/miredo/Default)
  TITLE:=Teredo (IPv6 tunneling over UDP through NAT) client and relay daemon
endef

define Package/miredo-client/conffiles
/etc/miredo.conf
endef

CONFIGURE_ARGS += \
	--disable-shared \
	--enable-static \
	--with-gnu-ld \
	--disable-rpath \
	--disable-chroot \
	--enable-teredo-client \
	--enable-teredo-relay \
	--enable-teredo-server \
	--enable-miredo-user=root \

CONFIGURE_VARS += \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/uClibc++" \
	CXXFLAGS="$$$$CXXFLAGS -fno-builtin -fno-rtti -nostdinc++"  \
	LIBS="-nodefaultlibs -luClibc++ -lm" \
	ac_cv_file__proc_self_maps=yes\

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CXXLINK="\$$$$(LINK)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/miredo-server/install
	$(INSTALL_DIR) $(1)/etc/
	$(CP) $(PKG_INSTALL_DIR)/etc/miredo-server.conf-dist $(1)/etc/miredo-server.conf
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/miredo-server.init $(1)/etc/init.d/miredo-server
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/miredo-server $(1)/usr/sbin/
endef

define Package/miredo-client/install	
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/etc/miredo.conf-dist $(1)/etc/miredo.conf
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/miredo.init $(1)/etc/init.d/miredo
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/miredo $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,miredo-server))
$(eval $(call BuildPackage,miredo-client))
