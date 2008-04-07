#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=palantir
PKG_VERSION:=2.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://www.fastpath.it/products/palantir/pub/
PKG_MD5SUM:=3a5b1fb340857f6d8e357bf39b77583e

PKG_BUILD_DEPENDS:=libjpeg

define Package/palantir
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+libjpeg +libpthread
  TITLE:=A multichannel interactive streaming solution
  URL:=http://www.fastpath.it/products/palantir/
endef

define Package/palantir/description
	Palantir is a Linux-based streaming system designed to transmit live
	video, audio and data over a TCP/IP network, as well as to control
	remote devices.
endef

define Package/palantir/conffiles
/etc/palantir.conf
endef

include $(INCLUDE_DIR)/package.mk

export CPPFLAGS=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
export LDFLAGS=-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR)/server/libgsm \
		$(TARGET_CONFIGURE_OPTS) \
		CCINC="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		COPTS="$(TARGET_CFLAGS)" \
		lib/libgsm.a
	$(MAKE) -C $(PKG_BUILD_DIR)/server \
		$(TARGET_CONFIGURE_OPTS) \
		COPTS="$(TARGET_CFLAGS)" \
		palantir
endef

define Package/palantir/install	
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/server/palantir-mips.conf.sample $(1)/etc/palantir.conf
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/server/palantir $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,palantir))
