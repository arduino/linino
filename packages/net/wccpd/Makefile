#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=wccpd
PKG_VERSION:=0.2
PKG_RELEASE:=1
PKG_MD5SUM:=5f15c274de61dfb88e0dbfc1ccbe6b67

PKG_SOURCE_URL:=@SF/wccpd
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/wccpd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=a Web Cache Coordination daemon
  DESCRIPTION:=wccpd is a WCCP (Web Cache Coordination Protocol) server daemon\\\
  It allows a router (running Linux) to redirect web traffic to a\\\
  group of Squid servers using WCCP as the monitoring/controling\\\
  protocol.\\\
  URL:=http://wccpd.sourceforge.net/
endef

define Build/Configure
$(call Build/Configure/Default,--enable-shared \
                        --enable-static \
                        --disable-rpath \
                        --with-gnu-ld,ac_cv_func_setpgrp_void=yes)
endef

define Build/Compile
$(call Build/Compile/Default,DESTDIR="$(PKG_INSTALL_DIR)" all install)
endef

define Package/wccpd/install
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/wccpd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,wccpd))
