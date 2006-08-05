#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mtr
PKG_VERSION:=0.69
PKG_RELEASE:=1
PKG_MD5SUM:=58904d6d8d70114195cdeb653d56914c

PKG_SOURCE_URL:=ftp://ftp.bitwizard.nl/mtr/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/mtr
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libncurses
  TITLE:=Full screen ncurses traceroute tool
  DESCRIPTION:=mtr combines the functionality of the 'traceroute' and 'ping' programs\\\
	in a single network diagnostic tool.\\\
	As mtr starts, it investigates the network connection between the host\\\
	mtr runs on and a user-specified destination host.  After it\\\
	determines the address of each network hop between the machines,\\\
	it sends a sequence ICMP ECHO requests to each one to determine the\\\
	quality of the link to each machine.  As it does this, it prints\\\
	running statistics about each machine.\\\
  URL:=http://www.bitwizard.nl/mtr/
endef

define Build/Configure
    (cd $(PKG_BUILD_DIR); rm -rf config.{cache,status}; \
		touch configure.in; \
		touch aclocal.m4; \
		touch Makefile.in; \
		touch img/Makefile.in; \
		touch stamp-h.in; \
		touch config.h.in; \
		touch configure; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		ac_cv_lib_resolv_res_mkquery=yes \
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
			--without-gtk \
	);
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		all install
endef

define Package/mtr/install	
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/mtr $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,mtr))
