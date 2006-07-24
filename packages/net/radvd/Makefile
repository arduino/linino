# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=radvd
PKG_VERSION:=0.7.3
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://v6web.litech.org/radvd/dist \
		http://download.sourcemage.org/mirror
PKG_MD5SUM:=56ce3f8cbf5966a0d531c21813320423
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

PKG_INIT_PRIO=51

include $(INCLUDE_DIR)/package.mk

define Package/radvd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=IPv6 Routing Advertisement Daemon
  DESCRIPTION:=IPv6 Routing Advertisement Daemon.
  URL:=http://v6web.litech.org/radvd/
endef

define Package/radvd/conffiles
/etc/radvd.conf
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
			--with-configfile=/etc/radvd.conf \
			--with-logfile=/var/log/radvd.log \
			--with-pidfile=/var/run/radvd.pid \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		radvd_LDADD=""
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
endef

define Package/radvd/install
	install -d -m0755 $(1)/etc
	install -m0644 ./files/radvd.conf $(1)/etc/radvd.conf
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/radvd.init $(1)/etc/init.d/S$(PKG_INIT_PRIO)radvd
	install -d -m0755 $(1)/usr/sbin
	install -m 755 $(PKG_INSTALL_DIR)/usr/sbin/radvd $(1)/usr/sbin/
	install -m 755 $(PKG_INSTALL_DIR)/usr/sbin/radvdump $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,radvd))
