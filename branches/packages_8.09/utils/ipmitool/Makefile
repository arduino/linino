# Copyright (C) 2008, OpenWrt.org
#
# $Id: #

include $(TOPDIR)/rules.mk

PKG_NAME:=ipmitool
PKG_VERSION:=1.8.10
PKG_RELEASE:=1

PKG_SOURCE:=ipmitool-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/ipmitool
PKG_MD5SUM:=282f3a3837399eae885512a4026bf5e1

include $(INCLUDE_DIR)/package.mk

define Package/ipmitool
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libopenssl
  TITLE:=IPMI remote computer management utility
  URL:=http://ipmitool.sourceforge.net/
endef

define Package/ipmitool/description
  IPMItool is a utility for managing and configuring devices
  that support the Intelligent Platform Management Interface
  (IPMI) version 1.5 and version 2.0 specifications.
endef

CONFIGURE_ARGS += \
	--enable-static=no \
	--enable-internal-md5 \
	--enable-intf-lan=yes \
	--enable-intf-lanplus=no \
	--enable-intf-free=no \
	--enable-intf-open=no \
	--enable-intf-imb=no \
	--enable-intf-lipmi=no \
	--enable-intf-bmc=no

define Package/ipmitool/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/ipmitool $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,ipmitool))

