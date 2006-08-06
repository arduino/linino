#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=palantir
PKG_VERSION:=2.6
PKG_RELEASE:=1
PKG_MD5SUM:=8e4d20e7f7fad26d7447483c68894ace

PKG_SOURCE_URL:=http://www.fastpath.it/products/palantir/pub/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

define Package/palantir
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+libjpeg
  TITLE:=A multichannel interactive streaming solution
  DESCRIPTION:=Palantir is a Linux-based streaming system designed to transmit live\\\
	video, audio and data over a TCP/IP network, as well as to control\\\
	remote devices.\\\
  URL:=http://www.fastpath.it/products/palantir/
endef

define Package/palantir/conffiles
/etc/palantir.conf
endef

export CPPFLAGS=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
export LDFLAGS=-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib

include $(INCLUDE_DIR)/package.mk

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)/usr
	$(MAKE) -C $(PKG_BUILD_DIR)/server/libgsm \
		$(TARGET_CONFIGURE_OPTS) \
		CCINC="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		lib/libgsm.a
	$(MAKE) -C $(PKG_BUILD_DIR)/server \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="-Wall -D_REENTRANT $(TARGET_CFLAGS)" \
		palantir
endef

define Package/palantir/install	
	install -d -m0755 $(1)/etc
	install -m0644 $(PKG_BUILD_DIR)/server/palantir-mips.conf.sample $(1)/etc/palantir.conf
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/server/palantir $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,palantir))
