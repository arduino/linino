#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk18-chan-datacard
PKG_REV:=185
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(if $(PKG_BRANCH),$(PKG_BRANCH),$(PKG_NAME))-$(PKG_VERSION)
PKG_SOURCE_URL:=https://www.makhutov.org/svn/chan_datacard/trunk/
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

include $(INCLUDE_DIR)/package.mk

define Package/asterisk18-chan-datacard
  SUBMENU:=asterisk18 (Complete Open Source PBX), v1.8.x
  SECTION:=net
  CATEGORY:=Network
  URL:=http://datacard.googlecode.com/
  MAINTAINER:=Hans Zandbelt <hans.zandbelt@gmail.com>
  DEPENDS:= +asterisk18 +libiconv-full
  TITLE:=Huawei UMTS 3G datacards support
endef

define Package/asterisk18-chan-datacard/description
	Asterisk channel driver for Huawei UMTS 3G datacards
endef

MAKE_VARS += \
	CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) \
		-I$(STAGING_DIR)/usr/include/asterisk-1.8/include \
		-I$(STAGING_DIR)/usr/lib/libiconv-full/include"
	LDFLAGS="$(TARGET_LDFLAGS) -liconv"

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/asterisk18-chan-datacard/conffiles
/etc/asterisk/datacard.conf
endef

define Package/asterisk18-chan-datacard/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/datacard.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/chan_datacard.so $(1)/usr/lib/asterisk/modules/
endef

$(eval $(call BuildPackage,asterisk18-chan-datacard))
