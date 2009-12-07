#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mDNSResponder
PKG_VERSION:=107.6
PKG_RELEASE:=1
PKG_INSTALL:=1
PKG_SOURCE:=mDNSResponder-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.opensource.apple.com/darwinsource/tarballs/other/
PKG_MD5SUM:=aa4e0e5c57f94489463ea6576591ce9d

PKG_BUILD_DIR:=$(BUILD_DIR)/mDNSResponder-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/mdnsresponder
  SECTION:=net
  CATEGORY:=Network
  TITLE:=mDNSResponder
  URL:=http://developer.apple.com/networking/bonjour/
endef

define Package/mdnsresponder/decription
  Bonjour, also known as zero-configuration networking, enables
  automatic discovery of computers, devices, and services on
  IP networks.
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

# I have no idea why -lc is required, but without it, C library symbols are
# not found:
MAKE_FLAGS += \
	LINKOPTS=-lc \
	LDCONFIG= \
	ETCBASE="$(PKG_INSTALL_DIR)/etc" \
	INSTBASE="$(PKG_INSTALL_DIR)/usr" \
	NSSINSTPATH="$(PKG_INSTALL_DIR)/lib" \
	MANPATH="$(PKG_INSTALL_DIR)/usr/man" \
	STARTUPSCRIPTDIR="$(PKG_INSTALL_DIR)/etc/init.d" \
	RUNLEVELSCRIPTSDIR="$(PKG_INSTALL_DIR)/etc/rc.d" \
	os=linux-uclibc
MAKE_PATH = mDNSPosix

define Build/Compile
	$(call Build/Compile/Default)
	# mDNSResponder's "make install" does not seem to create:
	mkdir -p $(PKG_INSTALL_DIR)/lib/
	mkdir -p $(PKG_INSTALL_DIR)/usr/bin/
	mkdir -p $(PKG_INSTALL_DIR)/usr/sbin/
	mkdir -p $(PKG_INSTALL_DIR)/usr/lib/
	mkdir -p $(PKG_INSTALL_DIR)/usr/man/man5/
	mkdir -p $(PKG_INSTALL_DIR)/usr/man/man8/
	mkdir -p $(PKG_INSTALL_DIR)/usr/include/
	mkdir -p $(PKG_INSTALL_DIR)/etc/
	mkdir -p $(PKG_INSTALL_DIR)/etc/init.d/
	mkdir -p $(PKG_INSTALL_DIR)/etc/rc.d/
	mkdir -p $(PKG_INSTALL_DIR)/etc/rc.d/rc2.d/
	mkdir -p $(PKG_INSTALL_DIR)/etc/rc.d/rc3.d/
	mkdir -p $(PKG_INSTALL_DIR)/etc/rc.d/rc4.d/
	mkdir -p $(PKG_INSTALL_DIR)/etc/rc.d/rc5.d/
	mkdir -p $(PKG_INSTALL_DIR)/etc/rc.d/rc0.d/
	mkdir -p $(PKG_INSTALL_DIR)/etc/rc.d/rc6.d/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/mDNSShared/dns_sd.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_BUILD_DIR)/mDNSPosix/build/prod/*.so* \
		$(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/sbin/
endef

define Package/mdnsresponder/install
        $(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/mDNSResponder.init $(1)/etc/init.d/mDNSResponder
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdns_sd.so.1 $(1)/usr/lib/
	# Note: mDNSResponder's makefile creates the following link incorrectly:
	ln -s libdns_sd.so.1 $(1)/usr/lib/libdns_sd.so
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(CP) $(PKG_BUILD_DIR)/mDNSPosix/build/prod/mdnsd $(1)/usr/sbin/
	$(CP) $(PKG_BUILD_DIR)/mDNSPosix/build/prod/mDNSResponderPosix $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,mdnsresponder))
