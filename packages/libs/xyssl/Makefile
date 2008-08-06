# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=xyssl
PKG_VERSION:=0.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=http://ftp.de.debian.org/debian/pool/main/x/xyssl
PKG_MD5SUM:=3f0695831aa874cb77e3790755d6b570

include $(INCLUDE_DIR)/package.mk

define Package/xyssl/Default
  TITLE:=Embedded SSL
  URL:=http://xyssl.org/
endef

define Package/libxyssl/Default/description
 The aim of the XySSL project is to provide a quality, open-source 
 cryptographic library written in C and targeted at embedded systems.
endef

define Package/libxyssl
$(call Package/xyssl/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (library)
endef

define Package/xyssl-progs
$(call Package/xyssl/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libxyssl
  TITLE+= (programs)
endef

define Build/Configure
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		OFLAGS="$(TARGET_CFLAGS)" \
		all
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)/usr" \
		install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/xyssl $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libxyssl.{a,so} $(1)/usr/lib/
endef

define Package/libxyssl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/libxyssl.so $(1)/usr/lib/
endef

define Package/xyssl-progs/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/xyssl_* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,libxyssl))
$(eval $(call BuildPackage,xyssl-progs))
