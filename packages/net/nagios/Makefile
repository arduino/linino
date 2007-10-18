# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=nagios
PKG_VERSION:=2.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/nagios
PKG_MD5SUM:=b6e3a21c91edb063c00712c6001e15ec

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/nagios
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +microperl
  TITLE:=service and network monitoring program
  URL:=http://www.nagios.org/
endef

define Package/nagios/description
	service and network monitoring program
endef

define Package/send-nagios/conffiles
/etc/send_nagios.cfg
endef

EXTRA_CFLAGS += -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include

define Build/Configure
	$(call Build/Configure/Default,\
		--with-nagios-user="root" \
		--with-nagios-group="root", \
		CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
		LIBS="-lnotimpl" \
	)
endef

define Build/Compile
	$(call Build/Compile/Default,\
		DESTDIR="$(PKG_INSTALL_DIR)" \
		INSTALL_OPTS="" \
		all install install-config \
	)
endef

define Package/nagios/install
	$(CP) $(PKG_INSTALL_DIR) $(1)/
endef

$(eval $(call BuildPackage,nagios))
