# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 4603 2006-08-18 21:21:06Z mbm $

include $(TOPDIR)/rules.mk

PKG_NAME:=ettercap
PKG_VERSION:=NG-0.7.3
PKG_RELEASE:=0
PKG_MD5SUM:=28fb15cd024162c55249888fe1b97820

PKG_SOURCE_URL:=@SF/ettercap
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/ettercap
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap +libnet1 +libopenssl +libpcre +libiconv +libncurses
  TITLE:=Ettercap is a suite for man in the middle attacks on LAN.
  DESCRIPTION:=Ettercap is a suite for man in the middle attacks on LAN. It features sniffing of live connections,\\\
  content filtering on the fly and many other interesting tricks.\\\
  It supports active and passive dissection of many protocols (even ciphered ones) and includes many feature for network\\\
  and host analysis.\\\
  URL:=http://ettercap.sourceforge.net
endef

define Build/Configure
$(call Build/Configure/Default,--with-libpcap="$(STAGING_DIR)/usr" \
			--with-libnet="$(STAGING_DIR)/usr" \
			--with-openssl="$(STAGING_DIR)/usr" \
			--with-libpcre="$(STAGING_DIR)/usr" \
			--with-libiconv="$(STAGING_DIR)/usr" \
			--with-libncurses="$(STAGING_DIR)/usr" \
			--disable-gtk \
			--disable-debug \
)
endef


define Build/Compile
$(call Build/Compile/Default,DESTDIR="$(PKG_INSTALL_DIR)" all install)
endef

define Package/ettercap/install
	install -d -m0755 $(1)/usr/
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
	rm -rf $(1)/usr/man
endef

$(eval $(call BuildPackage,ettercap))
