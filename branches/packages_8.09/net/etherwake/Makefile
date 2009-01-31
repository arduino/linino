#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=etherwake
PKG_VERSION:=1.09
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=http://ftp.debian.org/debian/pool/main/e/etherwake
PKG_MD5SUM:=628e8b2a28d47f262e4c26c989402a59

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION).orig

include $(INCLUDE_DIR)/package.mk

define Package/etherwake
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A little tool to send magic Wake-on-LAN packets
  URL:=http://ftp.debian.org/debian/pool/main/e/etherwake
endef

define Package/etherwake/description
	You can wake up WOL compliant Computers which have been powered down to 
	sleep mode or start WOL compliant Computers with a BIOS feature.
	WOL is an abbreviation for Wake-on-LAN. It is a standard that allows you 
	to turn on a computer from another location over a network connection.
	ether-wake also supports WOL passwords.
endef

define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) -D__UCLIBC__ $(PKG_BUILD_DIR)/ether-wake.c -o $(PKG_BUILD_DIR)/etherwake
endef

define Package/etherwake/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etherwake $(1)/usr/bin/
endef

$(eval $(call BuildPackage,etherwake))
