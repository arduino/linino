#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=comgt
PKG_VERSION:=0.3
PKG_RELEASE:=1
PKG_MD5SUM:=cd32663025ed94a0ee623a689989f3c3

PKG_SOURCE_URL:=http://www.pharscape.org/3G/comgt
PKG_SOURCE:=$(PKG_NAME)$(PKG_VERSION).tgz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/comgt
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Option/Vodafone 3G/GPRS control tool
  DESCRIPTION:=Option GlobeTrotter GPRS/EDGE/3G/HSDPA and Vodafone 3G/GPRS datacard control tool\\\
\\\
gcom is a scripting language interpreter useful for establishing communications\\\
on serial lines and through PCMCIA modems as well as GPRS and 3G datacards.\\\
  URL:= http://www.pharscape.org/content/view/46/70/
endef

define Build/Prepare	
	rm -rf $(PKG_BUILD_DIR)
	mkdir -p $(PKG_BUILD_DIR)
	zcat $(DL_DIR)/$(PKG_SOURCE) | tar -C $(PKG_BUILD_DIR) $(TAR_OPTIONS) -
	if [ -d ./patches ]; then $(PATCH) $(PKG_BUILD_DIR) ./patches ; fi
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		gcom
endef
	
define Package/comgt/install
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/gcom $(1)/usr/bin/
	install -d -m0755 $(1)/etc/gcom
	install -m0644 ./files/setpin.gcom $(1)/etc/gcom/setpin.gcom
	install -m0644 ./files/setmode.gcom $(1)/etc/gcom/setmode.gcom
	install -m0644 ./files/getcardinfo.gcom $(1)/etc/gcom/getcardinfo.gcom
	install -m0644 ./files/getstrength.gcom $(1)/etc/gcom/getstrength.gcom
endef

$(eval $(call BuildPackage,comgt))

