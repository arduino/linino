# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=iptraf
PKG_VERSION:=3.0.0
PKG_RELEASE:=1
PKG_MD5SUM:=377371c28ee3c21a76f7024920649ea8

PKG_SOURCE_URL:=ftp://iptraf.seul.org/pub/iptraf/ \
	ftp://the.wiretapped.net/pub/security/network-monitoring/iptraf/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/iptraf
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libncurses
  TITLE:=A console-based network monitoring program
  DESCRIPTION:=IPTraf is a console-based network statistics utility for Linux. It gathers\\\
a variety of figures such as TCP connection packet and byte counts,\\\
interface statistics and activity indicators, TCP/UDP traffic breakdowns,\\\
and LAN station packet and byte counts.\\\
  URL:=http://iptraf.seul.org/
endef


define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		DEBUG="" \
		INCLUDEDIR="-I../support -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDOPTS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		PLATFORM="-DPLATFORM=\\\"Linux/$(ARCH)\\\"" \
		TARGET="/usr/bin" \
		WORKDIR="/var/lib/iptraf" \
		all
endef

define Package/iptraf/install	
	install -d -m0755 $(1)/usr/bin \
			  $(1)/var/run/iptraf \
			  $(1)/var/lib/iptraf
	install -m0755 $(PKG_BUILD_DIR)/src/iptraf $(1)/usr/bin/
endef

$(eval $(call BuildPackage,iptraf))
