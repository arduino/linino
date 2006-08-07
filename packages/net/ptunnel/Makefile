#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ptunnel
PKG_VERSION:=0.61
PKG_RELEASE:=1
PKG_MD5SUM:=b45f73875f2af48f101816672f83a5fe

PKG_SOURCE_URL:=http://www.cti.ecp.fr/~beauxir5/ptunnel/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/ptunnel
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +libpcap
  TITLE:=Tunnel TCP connections over ICMP packets
  DESCRIPTION:=ptunnel is an application that allows you to reliably tunnel TCP connections to\\\
	a remote host using ICMP echo request and reply packets, commonly known as ping\\\
	requests and replies. It acts as a proxy and can handle sockets and secured\\\
	identification.\\\
  URL:=http://www.cs.uit.no/~daniels/PingTunnel/
endef

define Build/Configure
$(call Build/Configure/Default,--enable-shared \
		--disable-static \
		--with-gnu-ld, BUILD_CC=$(TARGET_CC) \
		HOSTCC=$(HOSTCC) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		ac_cv_linux_vers=2 \
		td_cv_buggygetaddrinfo="no")
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/ptunnel/install	
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/ptunnel $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,ptunnel))
