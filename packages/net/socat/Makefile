#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=socat
PKG_VERSION:=1.4.3.0
PKG_RELEASE:=1
PKG_MD5SUM:=ce574e75c2fda4456e8efd4efb86ec5e

PKG_SOURCE_URL:=http://www.dest-unreach.org/socat/download/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-1.4
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/socat
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +libpthread
  TITLE:=A multipurpose relay (SOcket CAT)
  DESCRIPTION:=SoCat (for SOcket CAT) establishes two bidirectional byte streams and\\\
	transfers data between them.\\\
	Data channels may be files, pipes, devices (terminal or modem, etc.), or\\\
	sockets (Unix, IPv4, IPv6, raw, UDP, TCP, SSL). It provides forking,\\\
	logging and tracing, different modes for interprocess communication and\\\
	many more options.\\\
  URL:=http://www.dest-unreach.org/socat/
endef

define Build/Configure
$(call Build/Configure/Default,--disable-libwrap \
                        --disable-readline, sc_cv_termios_ispeed="no")
endef

define Build/Compile	
$(call Build/Compile/Default, DESTDIR="$(PKG_INSTALL_DIR)" all install)
endef

define Package/socat/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/socat $(1)/usr/bin/
endef

$(eval $(call BuildPackage,socat))
