#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=openconnect
PKG_VERSION:=2.25
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.infradead.org/pub/openconnect/
PKG_MD5SUM:=796a32b611ee6210a5367eb9684d6778

include $(INCLUDE_DIR)/package.mk

define Package/openconnect
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libxml2 +libopenssl +kmod-tun
  TITLE:=VPN client for Cisco's AnyConnect SSL VPN
  URL:=http://www.infradead.org/openconnect/
  SUBMENU:=VPN
endef

define Package/openconnect/description
	A VPN client compatible with Cisco's AnyConnect SSL VPN.

        OpenConnect is a client for Cisco's AnyConnect SSL VPN, which is
        supported by IOS 12.4(9)T or later on Cisco SR500, 870, 880, 1800, 2800,
        3800, 7200 Series and Cisco 7301 Routers.  
endef

define Build/Compile
	$(call Build/Compile/Default, \
		SSL_CFLAGS="" \
		OPT_FLAGS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS)" \
		OS="Linux" \
		STAGING_DIR="$(STAGING_DIR)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		PREFIX=/usr \
		all install \
	)
endef

define Package/openconnect/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP)	$(PKG_INSTALL_DIR)/usr/bin/openconnect \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,openconnect))
