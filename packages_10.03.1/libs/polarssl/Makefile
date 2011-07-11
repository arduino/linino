#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=polarssl
PKG_VERSION:=0.14.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-gpl.tgz
PKG_SOURCE_URL:=http://polarssl.org/code/releases
PKG_MD5SUM:=f1b2fe9087ab64d7ea40a276a3628583

include $(INCLUDE_DIR)/package.mk

define Package/polarssl/Default
  SUBMENU:=SSL
  TITLE:=Embedded SSL
  URL:=http://polarssl.org/
endef

define Package/polarssl/Default/description
The aim of the PolarSSL project is to provide a quality, open-source
cryptographic library written in C and targeted at embedded systems.
endef

define Package/libpolarssl
$(call Package/polarssl/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (library)
endef

define Package/libpolarssl/description
$(call Package/polarssl/Default/description)
This package contains the PolarSSL library.
endef

define Package/polarssl-progs
$(call Package/polarssl/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libpolarssl
  TITLE+= (programs)
endef

define Package/polarssl-progs/description
$(call Package/polarssl/Default/description)
This package contains the PolarSSL programs.
endef

PKG_INSTALL:=1

define Build/Configure
endef

TARGET_CFLAGS += $(FPIC)
MAKE_FLAGS += OFLAGS="$(TARGET_CFLAGS)"

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/include/polarssl $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/lib/libpolarssl.{a,so} $(1)/usr/lib/
endef

define Package/libpolarssl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/lib/libpolarssl.so $(1)/usr/lib/
endef

define Package/polarssl-progs/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/polarssl_* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,libpolarssl))
$(eval $(call BuildPackage,polarssl-progs))
