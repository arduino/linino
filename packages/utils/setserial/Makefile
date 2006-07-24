# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=setserial
PKG_VERSION:=2.17
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/setserial
PKG_MD5SUM:=c4867d72c41564318e0107745eb7a0f2
PKG_CAT:=zcat

PKG_INIT_PRIO=15

include $(INCLUDE_DIR)/package.mk

define Package/setserial
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Serial port configuration utility
  DESCRIPTION:=Serial port configuration utility.\\\
    setserial  is a program designed to set and/or report the \\\
    configuration information associated with a serial port. This \\\
    information  includes what I/O port and IRQ a particular \\\
    serial port is using, and whether or not the break key should \\\
    be interpreted as the Secure Attention Key, and so on.
  URL:=http://setserial.sourceforge.net/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
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
	);
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		all
endef

define Package/setserial/install
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/serial.init $(1)/etc/init.d/setserial
	ln -sf setserial $(1)/etc/init.d/S$(PKG_INIT_PRIO)setserial
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/setserial $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,setserial))
