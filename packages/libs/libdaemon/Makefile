# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libdaemon
PKG_VERSION:=0.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://0pointer.de/lennart/projects/libdaemon/
PKG_MD5SUM:=6812a5e4063b5016f25e9a0cebbd3dd9
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libdaemon
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A lightweight C library that eases the writing of UNIX daemons
  DESCRIPTION:=\
	libdaemon is a lightweight C library that eases the writing of UNIX daemons.\\\
	It consists of the following parts:\\\
	- A wrapper around fork() which does the correct daemonization procedure of a process\\\
	- A wrapper around syslog() for simpler and compatible log output to Syslog or STDERR\\\
	- An API for writing PID files\\\
	- An API for serializing UNIX signals into a pipe for usage with select() or poll()\\\
	- An API for running subprocesses with STDOUT and STDERR redirected to syslog\\\
	\\\
	APIs like these are used in most daemon software available. It is not that \\\
	simple to get it done right and code duplication is not a goal.
  URL:=http://0pointer.de/lennart/projects/libdaemon/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--disable-lynx \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libdaemon $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdaemon.a $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdaemon.so* $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libdaemon.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/libdaemon.pc
	$(SED) 's,-L$$$${libdir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/libdaemon.pc
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/libdaemon \
		$(STAGING_DIR)/usr/lib/libdaemon.a \
		$(STAGING_DIR)/usr/lib/libdaemon.so* \
		$(STAGING_DIR)/usr/lib/pkgconfig/libdaemon.pc
endef

define Package/libdaemon/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdaemon.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libdaemon))
