# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=bluez-utils
PKG_VERSION:=2.24
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://bluez.sourceforge.net/download
PKG_MD5SUM:=
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/bluez-utils
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+bluez-libs +libpthread
  TITLE:=Bluetooth utilities
  DESCRIPTION:=Bluetooth utilities.
  URL:=http://www.bluez.org/
endef

define Package/bluez-utils/conffiles
/etc/bluetooth/givepin
/etc/bluetooth/hcid.conf
/etc/bluetooth/rfcomm.conf
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
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
			--sysconfdir=/etc \
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			--enable-shared \
			--enable-static \
			--disable-rpath \
			--disable-dbus \
			--disable-fuse \
			--disable-obex \
			--disable-alsa \
			--disable-cups \
			--disable-pcmcia \
			--disable-initscripts \
			--disable-bccmd \
			--disable-avctrl \
			--disable-hid2hci \
			--disable-dfutool \
			--disable-bcm203x \
			--disable-bluepin \
			--with-bluez=$(STAGING_DIR)/usr/include \
			--with-usb=$(STAGING_DIR)/usr/include \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/bluez-utils/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/* $(1)/usr/sbin/
	install -d -m0755 $(1)/etc/bluetooth
	$(CP) $(PKG_INSTALL_DIR)/../hcid/hcid.conf $(1)/etc/bluetooth/
	$(CP) $(PKG_INSTALL_DIR)/../rfcomm/rfcomm.conf $(1)/etc/bluetooth/
	install -m0700 ./files/givepin $(1)/etc/bluetooth/
endef

$(eval $(call BuildPackage,bluez-utils))
