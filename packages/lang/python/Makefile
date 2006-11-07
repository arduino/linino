#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$
 
include $(TOPDIR)/rules.mk

PKG_NAME:=python
PKG_VERSION:=2.4.3
PKG_RELEASE:=1

PKG_SOURCE:=Python-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.python.org/ftp/python/2.4.3/
PKG_MD5SUM:=141c683447d5e76be1d2bd4829574f02
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/Python-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/python
  SECTION:=lang
  CATEGORY:=Languages
  DEPENDS:=+uclibcxx
  TITLE:=Python programming language
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
		CONFIG_SITE= \
		./configure --with-threads=no; \
		$(MAKE) python Parser/pgen; \
		mv python hostpython; \
		mv Parser/pgen Parser/hostpgen; \
		make distclean; \
		echo "import sys" > $(PKG_BUILD_DIR)/setup.py.new; \
		echo "sys.path.append('$(PKG_BUILD_DIR)/Lib')" >> $(PKG_BUILD_DIR)/setup.py.new; \
		cat $(PKG_BUILD_DIR)/setup.py >> $(PKG_BUILD_DIR)/setup.py.new; \
		mv $(PKG_BUILD_DIR)/setup.py.new $(PKG_BUILD_DIR)/setup.py; \
	);
	$(call Build/Configure/Default, \
		--disable-shared \
		--sysconfdir=/etc \
		--with-threads=no, \
		HOSTPYTHON=./hostpython \
		HOSTPGEN=./Parser/hostpgen \
	)
endef

MAKE_OPTS:=\
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		LD_LIBRARY_PATH="$(LD_LIBRARY_PATH)" \
		LD="$(TARGET_CC)" \
		HOSTPYTHON=./hostpython \
		HOSTPGEN=./Parser/hostpgen

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(MAKE_OPTS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/hostpython $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/python2.4 $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/python2.4 $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/{include,lib}/python2.4
endef

define Package/python/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/python2.4 $(1)/usr/bin/
	ln -sf python2.4 $(1)/usr/bin/python
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/python2.4 $(1)/usr/lib/
	rm -rf \
		$(1)/usr/lib/python2.4/bsddb/test \
		$(1)/usr/lib/python2.4/distutils/tests \
		$(1)/usr/lib/python2.4/email/test \
		$(1)/usr/lib/python2.4/idlelib \
		$(1)/usr/lib/python2.4/lib-tk \
		$(1)/usr/lib/python2.4/test \

endef

$(eval $(call BuildPackage,python))
