# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=wavemon
PKG_VERSION:=0.4.0b
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.janmorgenstern.de/
PKG_MD5SUM:=2baab37eb967fc38dc53f8e4f609daac

include $(INCLUDE_DIR)/package.mk

define Package/wavemon
  SECTION:=net
  CATEGORY:=Network
  TITLE:=N-curses based wireless network devices monitor
  DEPENDS:= +libncurses
  SUBMENU:=wireless
  URL:=http://www.janmorgenstern.de/projects-software.html
endef

define Package/wavemon/description
  wavemon is a ncurses-based monitoring application for wireless network 
  devices. It currently works under Linux with devices that are supported 
  by the wireless extensions by Jean Tourrilhes (included in Kernel 2.4 
  and higher), e.g. the Lucent Orinoco cards. 
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -L${STAGING_DIR}/usr/lib -I${STAGING_DIR}/usr/include" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all
endef

define Package/wavemon/install
        $(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/wavemon $(1)/usr/bin/
endef

$(eval $(call BuildPackage,wavemon))
