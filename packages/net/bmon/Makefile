#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=bmon
PKG_VERSION:=2.1.0
PKG_RELEASE:=0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://people.suug.ch/~tgr/bmon/files/
PKG_MD5SUM:=3111a027907016c0902d67350c619df6
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/bmon
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libncurses
  TITLE:=bmon is a portable bandwidth monitor
  DESCRIPTION:=\
  	bmon is a portable bandwidth monitor \\\
  	and rate estimator running on various \\\
  	operating systems. It supports various \\\
  	input methods for different architectures.
  URL:=http://people.suug.ch/~tgr/bmon/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-cnt-workaround \
		--disable-dbi \
		--disable-rrd \
		--disable-asound \
	)
endef


define Build/Compile
	$(call Build/Compile/Default,all)
endef

define Package/bmon/install
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/src/bmon $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,bmon))

