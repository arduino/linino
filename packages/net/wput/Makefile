# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=wput
PKG_VERSION:=0.5
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=@SF/wput
PKG_MD5SUM:=441b2e07219f78167b29a7ac33488fff
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/wput
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A wget-like command-line FTP client
  DESCRIPTION:=A wget-like command-line FTP client.
  URL:=http://itooktheredpill.dyndns.org/wput/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
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
			--disable-static \
			--disable-g-switch \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/wput/install
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/wput $(1)/usr/bin/
endef

$(eval $(call BuildPackage,wput))
