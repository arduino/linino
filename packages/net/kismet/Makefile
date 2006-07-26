# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=kismet
PKG_VERSION:=2006-04-R1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.kismetwireless.net/code
PKG_MD5SUM:=8ec2de513f2911df1b7edfcba5ad1c26
PKG_CAT:=zcat

PKG_BUILDDEP:=libpcap libncurses uclibcxx

include $(INCLUDE_DIR)/package.mk

define Package/kismet-client
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Kismet client
  DEPENDS:=+libncurses +uclibc++
  DESCRIPTION:=Kismet client.\\\
    An 802.11 layer2 wireless network detector, sniffer, and intrusion \\\
    detection system.\\\
    \\\
    This package contains the kismet text interface client.
  URL:=http://www.kismetwireless.net/
endef

define Package/kismet-client/conffiles
/etc/kismet/ap_manuf
/etc/kismet/client_manuf
/etc/kismet/kismet.conf
/etc/kismet/kismet_ui.conf
endef

define Package/kismet-drone
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap +uclibc++
  TITLE:=Kismet drone
  DESCRIPTION:=Kismet drone.\\\
    An 802.11 layer2 wireless network detector, sniffer, and intrusion \\\
    detection system.\\\
    \\\
    This package contains the kismet remote sniffing.and monitoring drone.
  URL:=http://www.kismetwireless.net/
endef

define Package/kismet-drone/conffiles
/etc/kismet/kismet_drone.conf
endef

define Package/kismet-server
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap +uclibc++
  TITLE:=Kismet server
  DESCRIPTION:=Kismet server.\\\
    An 802.11 layer2 wireless network detector, sniffer, and intrusion \\\
    detection system.\\\
    \\\
    This package contains the kismet server.
  URL:=http://www.kismetwireless.net/
endef

define Package/kismet-server/conffiles
/etc/kismet/ap_manuf
/etc/kismet/client_manuf
/etc/kismet/kismet.conf
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -rf config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)"  \
		CXXFLAGS="$(TARGET_CFLAGS) -fno-builtin -fno-rtti -nostdinc++"  \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include -I$(LINUX_DIR)/include" \
		LDFLAGS="-nodefaultlibs -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		LIBS="-luClibc++ -lc -lm -lgcc" \
		./configure \
			--target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--program-prefix="" \
			--program-suffix="" \
			--prefix=/usr \
			--exec-prefix=/usr \
			--bindir=/usr/bin \
			--datadir=/usr/share \
			--includedir=/usr/include \
			--infodir=/usr/share/info \
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc/kismet \
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			--enable-syspcap=yes \
			--disable-setuid \
			--disable-wsp100 \
			--disable-gpsmap \
	);
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		LIBS="-luClibc++ -lc -lm -lgcc" \
		all
endef

#FIXME: remove this package?
define Package/kismet/install
	install -d -m0755 $(1)/usr/bin/
	install -m0755 $(PKG_BUILD_DIR)/scripts/kismet $(1)/usr/bin/kismet
endef

define Package/kismet-client/install
	install -d -m0755 $(1)/etc/kismet/
	install -m0644 ./files/ap_manuf $(1)/etc/kismet/
	install -m0644 ./files/client_manuf $(1)/etc/kismet/
	install -m0644 ./files/kismet.conf $(1)/etc/kismet/
	install -m0644 ./files/kismet_ui.conf $(1)/etc/kismet/
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/kismet_client $(1)/usr/bin/
endef

define Package/kismet-drone/install
	install -d -m0755 $(1)/etc/kismet/
	install -m0644 ./files/kismet_drone.conf $(1)/etc/kismet/
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/kismet_drone $(1)/usr/bin/
endef

define Package/kismet-server/install
	install -d -m0755 $(1)/etc/kismet/
	install -m0644 ./files/ap_manuf $(1)/etc/kismet/
	install -m0644 ./files/client_manuf $(1)/etc/kismet/
	install -m0644 ./files/kismet.conf $(1)/etc/kismet/
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/kismet_server $(1)/usr/bin/
endef

$(eval $(call BuildPackage,kismet-client))
$(eval $(call BuildPackage,kismet-drone))
$(eval $(call BuildPackage,kismet-server))
