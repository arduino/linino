#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ipv6calc
PKG_VERSION:=0.73.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.bieringer.de/pub/linux/IPv6/ipv6calc/
PKG_MD5SUM:=24141d637207532ea9a9881f968d086f

include $(INCLUDE_DIR)/package.mk

define Package/ipv6calc
  SECTION:=ipv6
  CATEGORY:=IPv6
  TITLE:=IPv6 addresses calculations
  URL:=http://www.deepspace6.net/projects/ipv6calc.html
endef

define Package/ipv6calc/description
  ipv6calc is a small utility written in programming languate C to manipulate
  (not only) IPv6 addresses. Intentions were convering a given IPv6 address
  into compressed format, convering a given IPv6 address into the same format
  like shown in /proc/net/if_inet6 and (because it was not difficulty)
  migrating the Perl program ip6_int into. Now only one utiltity is needed to
  do a lot.
endef

CONFIGURE_ARGS += \
	--enable-static \
	--enable-shared

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		COPTS="$(TARGET_CFLAGS) -I$(PKG_BUILD_DIR)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/ipv6calc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ipv6* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,ipv6calc))
