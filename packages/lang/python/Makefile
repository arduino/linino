#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$
 
include $(TOPDIR)/rules.mk

PKG_NAME:=python
PKG_VERSION:=2.5
PKG_RELEASE:=3

PKG_SOURCE:=Python-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.python.org/ftp/python/2.5/
PKG_MD5SUM:=ddb7401e711354ca83b7842b733825a3
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/Python-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

PY_DISABLED_MODULES=readline pyexpat dbm gdbm bsddb \
	_curses _curses_panel _tkinter nis zipfile

define Package/python
  SECTION:=lang
  CATEGORY:=Languages
  DEPENDS:=+uclibcxx
  TITLE:=Python 2.5 programming language
  URL:=http://www.python.org/
endef

define Package/python/description
Python programming language
	Python is a dynamic object-oriented programming language that 
	can be used for many kinds of software development. It offers 
	strong support for integration with other languages and tools, 
	comes with extensive standard libraries, and can be learned in a 
	few days. Many Python programmers report substantial productivity 
	gains and feel the language encourages the development of higher 
	quality, more maintainable code.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		rm -rf config.cache; \
		CONFIG_SITE= \
		./configure --with-threads=no --with-cxx=no; \
		$(MAKE) python Parser/pgen; \
		mv python hostpython; \
		mv Parser/pgen Parser/hostpgen; \
		make distclean; \
	);
	$(call Build/Configure/Default, \
		--disable-shared \
		--with-cxx=no \
		--sysconfdir=/etc \
		--with-threads=no \
		--disable-ipv6 \
		HOSTPYTHON=./hostpython \
		HOSTPGEN=./Parser/hostpgen \
	)
endef

MAKE_OPTS:=\
		$(TARGET_CONFIGURE_OPTS) \
		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/include \
		PYTHON_MODULES_LIB=$(STAGING_DIR)/lib \
		PYTHON_DISABLE_MODULES="$(PY_DISABLED_MODULES)" \
		CFLAGS="$(TARGET_CFLAGS) -fno-inline" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		LD="$(TARGET_CC)" \
		HOSTPYTHON=./hostpython \
		HOSTPGEN=./Parser/hostpgen

define Build/Compile
	export PYTHON_DISABLE_SSL=1
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(MAKE_OPTS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		EXTRA_CFLAGS="$(TARGET_CFLAGS) -fno-inline" \
		CROSS_COMPILE=yes \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/hostpython $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/python2.5 $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/python2.5 $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/{include,lib}/python2.5
endef

define Package/python/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/python2.5 $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/python $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/python2.5 $(1)/usr/lib/
	rm -rf \
		$(1)/usr/lib/python2.5/bsddb/test \
		$(1)/usr/lib/python2.5/distutils/tests \
		$(1)/usr/lib/python2.5/email/test \
		$(1)/usr/lib/python2.5/idlelib \
		$(1)/usr/lib/python2.5/lib-tk \
		$(1)/usr/lib/python2.5/test \

endef

$(eval $(call BuildPackage,python))
