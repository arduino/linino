#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=python
PKG_VERSION:=2.5.4
PKG_RELEASE:=2

PKG_SOURCE:=Python-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.python.org/ftp/python/$(PKG_VERSION)/
PKG_MD5SUM:=394a5f56a5ce811fb0f023197ec0833e

PKG_BUILD_DIR:=$(BUILD_DIR)/Python-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,./files/python-package.mk)

define Package/python/Default
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Python 2.5 programming language
  URL:=http://www.python.org/
endef

define Package/python/Default/description
 Python is a dynamic object-oriented programming language that can be used
 for many kinds of software development. It offers strong support for
 integration with other languages and tools, comes with extensive standard
 libraries, and can be learned in a few days. Many Python programmers
 report substantial productivity gains and feel the language encourages
 the development of higher quality, more maintainable code.
endef

define Package/python
$(call Package/python/Default)
  TITLE+= (full)
  DEPENDS:=+libpthread +zlib +PACKAGE_python:libffi
  PROVIDES:=python-core
endef

define Package/python/description
$(call Package/python/Default/description)
 .
 This package contains the full Python install.
endef

define Package/python-mini
$(call Package/python/Default)
  TITLE+= (minimal)
  DEPENDS:=+libpthread +zlib
  PROVIDES:=python-core
endef

define Package/python-mini/description
$(call Package/python/Default/description)
  .
  This package contains only a minimal Python install.
endef

define Package/python-doc
$(call Package/python/Default)
  TITLE:=Python interactive documentation
  DEPENDS+= python-core
endef

define Package/python-expat
$(call Package/python/Default)
  TITLE:=Python support for expat
  DEPENDS+= python-core +libexpat
endef

define Package/python-openssl
$(call Package/python/Default)
 TITLE:=Python support for OpenSSL
 DEPENDS+= python-core +libopenssl
endef


PY_DISABLED_MODULES:= \
	readline _curses _curses_panel _tkinter nis

MAKE_OPTS:=\
	$(TARGET_CONFIGURE_OPTS) \
	PYTHON_DISABLE_MODULES="$(PY_DISABLED_MODULES)" \
	PYTHON_MODULES_INCLUDE="$(STAGING_DIR)/usr/include" \
	PYTHON_MODULES_LIB="$(STAGING_DIR)/usr/lib" \
	CROSS_COMPILE=yes \
	CFLAGS="$(TARGET_CFLAGS) -fno-inline" \
	LDFLAGS="$(TARGET_LDFLAGS)" \
	LD="$(TARGET_CC)" \
	HOSTPYTHON=./hostpython \
	HOSTPGEN=./hostpgen \

define Build/Configure
endef

define Build/Compile
	-$(MAKE) -C $(PKG_BUILD_DIR) distclean
	(cd $(PKG_BUILD_DIR); \
		rm -rf config.cache; \
		CONFIG_SITE= \
		OPT="$(HOST_CFLAGS)" \
		./configure --without-cxx-main --without-threads --prefix=$(PKG_INSTALL_DIR)/host; \
	);
	$(MAKE) -C $(PKG_BUILD_DIR) \
		python Parser/pgen
	$(MAKE) -C $(PKG_BUILD_DIR) \
		HOSTPYTHON=$(PKG_BUILD_DIR)/python \
		sharedmods install
	(cd $(PKG_BUILD_DIR);mv Parser/pgen hostpgen)

    # The python executable needs to stay in the rootdir since its location will
    # be used to compute the path of the config files.
	$(CP) $(PKG_BUILD_DIR)/python $(PKG_BUILD_DIR)/hostpython
	$(MAKE) -C $(PKG_BUILD_DIR) distclean

	$(call Build/Configure/Default, \
		--sysconfdir=/etc \
		--disable-shared \
		--disable-ipv6 \
		--without-cxx-main \
		--with-threads \
		--with-system-ffi \
		ac_cv_lib_readline_readline=no \
		OPT="$(TARGET_CFLAGS)" \
	)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(MAKE_OPTS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/mk $(2)/bin $(1)/usr/bin $(1)/usr/include $(1)/usr/lib
	$(INSTALL_DATA) ./files/python-package.mk $(1)/mk/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/python$(PYTHON_VERSION) \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/host/lib/python$(PYTHON_VERSION) \
		$(PKG_BUILD_DIR)/libpython$(PYTHON_VERSION).a \
		$(1)/usr/lib/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/python$(PYTHON_VERSION)/config \
		$(1)/usr/lib/python$(PYTHON_VERSION)/

	$(CP) \
		$(PKG_INSTALL_DIR)/host/bin/python \
		$(1)/usr/bin/hostpython
	(cd $(2)/bin; \
	ln -sf ../../usr/bin/hostpython python$(PYTHON_VERSION); \
	ln -sf python$(PYTHON_VERSION) python)

	$(CP) \
		$(PKG_INSTALL_DIR)/host/bin/python$(PYTHON_VERSION)-config \
		$(2)/bin/
	$(SED) 's,^#!.*,#!/usr/bin/env python2.5,g' $(2)/bin/python$(PYTHON_VERSION)-config

	(cd $(2)/bin; \
	ln -sf python$(PYTHON_VERSION)-config python-config;)
endef

define PyPackage/python/filespec
+|/usr/bin/python$(PYTHON_VERSION)
+|/usr/include/python$(PYTHON_VERSION)/pyconfig.h
+|/usr/lib/python$(PYTHON_VERSION)
-|/usr/lib/python$(PYTHON_VERSION)/bsddb/test
-|/usr/lib/python$(PYTHON_VERSION)/config
+|/usr/lib/python$(PYTHON_VERSION)/config/Makefile
-|/usr/lib/python$(PYTHON_VERSION)/ctypes/test
-|/usr/lib/python$(PYTHON_VERSION)/distutils/command/wininst-*.exe
-|/usr/lib/python$(PYTHON_VERSION)/distutils/tests
-|/usr/lib/python$(PYTHON_VERSION)/email/test
-|/usr/lib/python$(PYTHON_VERSION)/idlelib
-|/usr/lib/python$(PYTHON_VERSION)/lib-tk
-|/usr/lib/python$(PYTHON_VERSION)/sqlite3/test
-|/usr/lib/python$(PYTHON_VERSION)/test
endef

define PyPackage/python/install
	ln -sf python$(PYTHON_VERSION) $(1)/usr/bin/python
endef

define PyPackage/python-mini/filespec
+|/usr/bin/python$(PYTHON_VERSION)
+|/usr/lib/python$(PYTHON_VERSION)/__future__.py
+|/usr/lib/python$(PYTHON_VERSION)/codecs.py
+|/usr/lib/python$(PYTHON_VERSION)/compileall.py
+|/usr/lib/python$(PYTHON_VERSION)/ConfigParser.py
+|/usr/lib/python$(PYTHON_VERSION)/copy.py
+|/usr/lib/python$(PYTHON_VERSION)/copy_reg.py
+|/usr/lib/python$(PYTHON_VERSION)/dis.py
+|/usr/lib/python$(PYTHON_VERSION)/encodings
+|/usr/lib/python$(PYTHON_VERSION)/fnmatch.py
+|/usr/lib/python$(PYTHON_VERSION)/getopt.py
+|/usr/lib/python$(PYTHON_VERSION)/glob.py
+|/usr/lib/python$(PYTHON_VERSION)/hashlib.py
+|/usr/lib/python$(PYTHON_VERSION)/inspect.py
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/array.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/binascii.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/cStringIO.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/fcntl.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/grp.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/itertools.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/math.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/operator.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/_random.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/select.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/_socket.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/strop.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/_struct.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/syslog.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/time.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/unicodedata.so
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/zlib.so
+|/usr/lib/python$(PYTHON_VERSION)/linecache.py
+|/usr/lib/python$(PYTHON_VERSION)/md5.py
+|/usr/lib/python$(PYTHON_VERSION)/opcode.py
+|/usr/lib/python$(PYTHON_VERSION)/optparse.py
+|/usr/lib/python$(PYTHON_VERSION)/os.py
+|/usr/lib/python$(PYTHON_VERSION)/pickle.py
+|/usr/lib/python$(PYTHON_VERSION)/pickle.py
+|/usr/lib/python$(PYTHON_VERSION)/pkgutil.py
+|/usr/lib/python$(PYTHON_VERSION)/popen2.py
+|/usr/lib/python$(PYTHON_VERSION)/posixpath.py
+|/usr/lib/python$(PYTHON_VERSION)/py_compile.py
+|/usr/lib/python$(PYTHON_VERSION)/random.py
+|/usr/lib/python$(PYTHON_VERSION)/repr.py
+|/usr/lib/python$(PYTHON_VERSION)/re.py
+|/usr/lib/python$(PYTHON_VERSION)/sha.py
+|/usr/lib/python$(PYTHON_VERSION)/site.py
+|/usr/lib/python$(PYTHON_VERSION)/socket.py
+|/usr/lib/python$(PYTHON_VERSION)/sre_compile.py
+|/usr/lib/python$(PYTHON_VERSION)/sre_constants.py
+|/usr/lib/python$(PYTHON_VERSION)/sre_parse.py
+|/usr/lib/python$(PYTHON_VERSION)/sre.py
+|/usr/lib/python$(PYTHON_VERSION)/stat.py
+|/usr/lib/python$(PYTHON_VERSION)/StringIO.py
+|/usr/lib/python$(PYTHON_VERSION)/stringprep.py
+|/usr/lib/python$(PYTHON_VERSION)/string.py
+|/usr/lib/python$(PYTHON_VERSION)/struct.py
+|/usr/lib/python$(PYTHON_VERSION)/subprocess.py
+|/usr/lib/python$(PYTHON_VERSION)/tempfile.py
+|/usr/lib/python$(PYTHON_VERSION)/textwrap.py
+|/usr/lib/python$(PYTHON_VERSION)/tokenize.py
+|/usr/lib/python$(PYTHON_VERSION)/token.py
+|/usr/lib/python$(PYTHON_VERSION)/traceback.py
+|/usr/lib/python$(PYTHON_VERSION)/types.py
+|/usr/lib/python$(PYTHON_VERSION)/UserDict.py
+|/usr/lib/python$(PYTHON_VERSION)/warnings.py
endef

define PyPackage/python-mini/install
	ln -sf python$(PYTHON_VERSION) $(1)/usr/bin/python
endef

define PyPackage/python-doc/filespec
+|/usr/lib/python$(PYTHON_VERSION)/pydoc.py
endef

define PyPackage/python-expat/filespec
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/pyexpat.so
endef

define PyPackage/python-openssl/filespec
+|/usr/lib/python$(PYTHON_VERSION)/lib-dynload/_ssl.so
endef

$(eval $(call PyPackage,python))
$(eval $(call PyPackage,python-mini))
$(eval $(call PyPackage,python-doc))
$(eval $(call PyPackage,python-expat))
$(eval $(call PyPackage,python-openssl))

$(eval $(call BuildPackage,python))
$(eval $(call BuildPackage,python-mini))
$(eval $(call BuildPackage,python-doc))
$(eval $(call BuildPackage,python-expat))
$(eval $(call BuildPackage,python-openssl))

