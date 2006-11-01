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
	TITLE:=Python programming language
	URL:=http://www.python.org
	DEPENDS:=+uclibcxx
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
		cat $(PKG_BUILD_DIR)/setup.py.new $(PKG_BUILD_DIR)/setup.py > $(PKG_BUILD_DIR)/setup.py.foo; \
		mv $(PKG_BUILD_DIR)/setup.py.foo $(PKG_BUILD_DIR)/setup.py; \
		rm $(PKG_BUILD_DIR)/setup.py.new; \
	);
	$(call Build/Configure/Default, \
		--disable-shared \
		--sysconfdir=/etc \
		--with-threads=no, \
		HOSTPYTHON=./hostpython \
		HOSTPGEN=./Parser/hostpgen \
	)
endef

MAKE_OPTS= \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		LD_LIBRARY_PATH="$(LD_LIBRARY_PATH)" \
		LD="$(TARGET_CC)" \
		HOSTPYTHON=./hostpython \
		HOSTPGEN=./Parser/hostpgen

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		$(MAKE_OPTS) \
		all install
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/usr/include/python2.4 $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/python2.4 $(STAGING_DIR)/usr/lib/
endef

define Package/python/install
	mkdir -p $(1)/usr/{bin,lib}
	$(CP) $(PKG_INSTALL_DIR)/usr/{bin,lib} $(1)/usr/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/{include,lib}/python2.4
endef

$(eval $(call BuildPackage,python))
