#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ngrep
PKG_VERSION:=1.45
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/ngrep
PKG_MD5SUM:=bc8150331601f3b869549c94866b4f1c

include $(INCLUDE_DIR)/package.mk

define Package/ngrep
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap +libpcre
  TITLE:=network grep
  URL:=http://ngrep.sourceforge.net
endef

define Package/ngrep/description
	ngrep a pcap-aware tool that will allow you to specify extended
	regular expressions to match against data payloads of packets. It
	currently recognizes TCP, UDP, and ICMP across Ethernet, PPP, SLIP,
	FDDI, Token Ring and null interfaces, and understands BPF filter
	logic in the same fashion as more common packet sniffing tools,
	like tcpdump and snoop.
endef

define Build/Configure
	$(call Build/Configure/Default,	\
		--with-pcap-includes=$(STAGING_DIR)/usr/include \
		--enable-pcre \
		--with-pcre=$(STAGING_DIR)/usr \
		--enable-ipv6 \
		--disable-dropprivs \
		,\
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -lpcre" \
	)
endef

define Build/Compile	
	$(call Build/Compile/Default,\
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all \
	)
endef

define Package/ngrep/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,ngrep))
