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

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.bitwizard.nl/mtr/
PKG_MD5SUM:=58904d6d8d70114195cdeb653d56914c
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/mtr
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libncurses
  TITLE:=Full screen ncurses traceroute tool
  DESCRIPTION:=\
	mtr combines the functionality of the 'traceroute' and 'ping' programs \\\
	in a single network diagnostic tool.\\\
	As mtr starts, it investigates the network connection between the host \\\
	mtr runs on and a user-specified destination host.  After it \\\
	determines the address of each network hop between the machines, \\\
	it sends a sequence ICMP ECHO requests to each one to determine the \\\
	quality of the link to each machine.  As it does this, it prints \\\
	running statistics about each machine.
  URL:=http://www.bitwizard.nl/mtr/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); touch \
		configure.in \
		aclocal.m4 \
		Makefile.in \
		img/Makefile.in \
		stamp-h.in \
		config.h.in \
		configure \
	);
	$(call Build/Configure/Default, \
		--without-gtk \
		, \
		ac_cv_lib_resolv_res_mkquery=yes \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/mtr/install	
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/mtr $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,mtr))
