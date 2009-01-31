# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=kismet
PKG_VERSION:=2008-05-R1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.kismetwireless.net/code
PKG_MD5SUM:=6ee365d36354b4dee4945e67f8149294

PKG_BUILD_DEPENDS:=libnotimpl libpcap libncurses uclibcxx

include $(INCLUDE_DIR)/package.mk

define Package/kismet/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Kismet
  DEPENDS:= +uclibcxx
  URL:=http://www.kismetwireless.net/
  SUBMENU:=wireless
endef

define Package/kismet/Default/description
 An 802.11 layer2 wireless network detector, sniffer, and intrusion
 detection system.
endef

define Package/kismet-client
$(call Package/kismet/Default)
  TITLE+= client
  DEPENDS+= +libncurses
endef

define Package/kismet-client/conffiles
/etc/kismet/ap_manuf
/etc/kismet/client_manuf
/etc/kismet/kismet.conf
/etc/kismet/kismet_ui.conf
endef

define Package/kismet-client/description
$(call Package/kismet/Default/description)
 This package contains the kismet text interface client.
endef

define Package/kismet-drone
$(call Package/kismet/Default)
  DEPENDS+= +libpcap +dbus
  TITLE+= drone
endef

define Package/kismet-drone/conffiles
/etc/kismet/kismet_drone.conf
endef

define Package/kismet-drone/description
$(call Package/kismet/Default/description)
 This package contains the kismet remote sniffing.and monitoring drone.
endef

define Package/kismet-server
$(call Package/kismet/Default)
  DEPENDS+= +libpcap +dbus
  TITLE+= server
endef

define Package/kismet-server/conffiles
/etc/kismet/ap_manuf
/etc/kismet/client_manuf
/etc/kismet/kismet.conf
endef

define Package/kismet-server/description
$(call Package/kismet/Default/description)
 This package contains the kismet server.
endef

CONFIGURE_ARGS += \
	--enable-syspcap=yes \
	--disable-dbus \
	--disable-setuid \
	--disable-wsp100 \
	--disable-gpsmap \

CONFIGURE_VARS += \
	CXXFLAGS="$$$$CXXFLAGS -fno-builtin -fno-rtti -nostdinc++"  \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/uClibc++ -I$(LINUX_DIR)/include" \
	LDFLAGS="$$$$LDFLAGS" \
	LIBS="-nodefaultlibs -luClibc++ -lm -lnotimpl -lgcc" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		LD="\$$$$(CC)" \
		all
endef

#FIXME: remove this package?
define Package/kismet/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/scripts/kismet $(1)/usr/bin/kismet
endef

define Package/kismet-client/install
	$(INSTALL_DIR) $(1)/etc/kismet/
	$(INSTALL_DATA) ./files/ap_manuf $(1)/etc/kismet/
	$(INSTALL_DATA) ./files/client_manuf $(1)/etc/kismet/
	$(INSTALL_DATA) ./files/kismet.conf $(1)/etc/kismet/
	$(INSTALL_DATA) ./files/kismet_ui.conf $(1)/etc/kismet/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/kismet_client $(1)/usr/bin/
endef

define Package/kismet-drone/install
	$(INSTALL_DIR) $(1)/etc/kismet/
	$(INSTALL_DATA) ./files/kismet_drone.conf $(1)/etc/kismet/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/kismet_drone $(1)/usr/bin/
endef

define Package/kismet-server/install
	$(INSTALL_DIR) $(1)/etc/kismet/
	$(INSTALL_DATA) ./files/ap_manuf $(1)/etc/kismet/
	$(INSTALL_DATA) ./files/client_manuf $(1)/etc/kismet/
	$(INSTALL_DATA) ./files/kismet.conf $(1)/etc/kismet/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/kismet_server $(1)/usr/bin/
endef

$(eval $(call BuildPackage,kismet-client))
$(eval $(call BuildPackage,kismet-drone))
$(eval $(call BuildPackage,kismet-server))
