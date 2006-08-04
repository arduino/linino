# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=tcpdump
PKG_VERSION:=3.9.4
PKG_RELEASE:=1
PKG_MD5SUM:=4b64755bbc8ba1af49c747271a6df5b8

PKG_SOURCE_URL:=http://www.tcpdump.org/release/ \
	http://ftp.gwdg.de/pub/misc/tcpdump/ \
	http://www.at.tcpdump.org/ \
	http://www.br.tcpdump.org/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/tcpdump
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap
  TITLE:=Network monitoring and data acquisition tool
  DESCRIPTION:=A tool for network monitoring and data acquisition.
  URL:=http://www.tcpdump.org/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -rf config.{cache,status} ; \
		BUILD_CC="$(TARGET_CC)" HOSTCC="$(HOSTCC)" \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		ac_cv_linux_vers=2 \
		td_cv_buggygetaddrinfo="no" \
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
			$(DISABLE_NLS) \
			$(DISABLE_LARGEFILE) \
			--enable-shared \
			--disable-static \
			--enable-ipv6 \
			--without-crypto \
		);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CCOPT="$(TARGET_CFLAGS)" INCLS="-I. -I$(STAGING_DIR)/usr/include" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/tcpdump/install
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/tcpdump $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,tcpdump))
