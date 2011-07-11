#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pyqt4
PKG_VERSION:=4.8.3
PKG_RELEASE:=1

PKG_SOURCE:=PyQt-x11-gpl-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://bu3sch.de/pyqt4/
PKG_MD5SUM:=d54fd1c37a74864faf42709c8102f254
PKG_BUILD_DIR:=$(BUILD_DIR)/PyQt-x11-gpl-$(PKG_VERSION)
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

PKG_BUILD_DEPENDS:=python-sip/host

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)
$(call include_mk, python-sip-package.mk)

define Package/pyqt4
  SECTION:=language-python
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Python QT4
  MAINTAINER:=Michael Buesch <mb@bu3sch.de>
  URL:=http://www.riverbankcomputing.co.uk/software/pyqt/download
  DEPENDS:=+qt4 +qt4-gui +dbus-python +python +python-sip @FEATURE_drawing-backend_libX11
endef

define Package/pyqt4/Description
  Python QT4 framework bindings.
endef

TARGET_INCDIRS+=$(STAGING_DIR)/include \
	$(STAGING_DIR)/usr/include \
	$(STAGING_DIR)/usr/include/Qt \
	$(STAGING_DIR)/usr/include/Qt3Support \
	$(STAGING_DIR)/usr/include/QtCore \
	$(STAGING_DIR)/usr/include/QtDBus \
	$(STAGING_DIR)/usr/include/QtGui \
	$(STAGING_DIR)/usr/include/QtNetwork \
	$(STAGING_DIR)/usr/include/QtSql \
	$(STAGING_DIR)/usr/include/QtSvg \
	$(STAGING_DIR)/usr/include/QtTest \
	$(STAGING_DIR)/usr/include/QtXml \
	$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION) \
	$(STAGING_DIR)/usr/lib/dbus-1.0/include \
	$(TOOLCHAIN_DIR)/include \
	$(TOOLCHAIN_DIR)/usr/include

TARGET_LIBDIRS+=$(STAGING_DIR)/lib \
	$(STAGING_DIR)/usr/lib \
	$(TOOLCHAIN_DIR)/lib \
	$(TOOLCHAIN_DIR)/usr/lib

EXTRA_CFLAGS:=
EXTRA_LDFLAGS:=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
		-Wl,-rpath=/usr/lib/

QTDIRSFILE:=$(PKG_BUILD_DIR)/qtdirs.out
SIPCFGFILE:=$(PKG_BUILD_DIR)/sipconfig.macros

QT_VERSION:=./files/qt_versioning.sh version "$(STAGING_DIR)/usr/include" "$(PKG_BUILD_DIR)/qtver.tmp"
QT_EDITION:=./files/qt_versioning.sh edition "$(STAGING_DIR)/usr/include" "$(PKG_BUILD_DIR)/qtver.tmp"

# Welcome to cross compilation hell. Dinner is served!

define Build/Configure
	echo "$(STAGING_DIR)/usr" > $(QTDIRSFILE)
	echo "$(STAGING_DIR)/usr/include" >> $(QTDIRSFILE)
	echo "$(STAGING_DIR)/usr/lib" >> $(QTDIRSFILE)
	echo "$(STAGING_DIR)/usr/bin" >> $(QTDIRSFILE)
	echo "$(STAGING_DIR)/usr/share" >> $(QTDIRSFILE)
	echo "$(STAGING_DIR)/usr/lib/Qt/plugins" >> $(QTDIRSFILE)
	$(QT_VERSION) >> $(QTDIRSFILE)
	$(QT_EDITION) >> $(QTDIRSFILE)
	echo "Open Source" >> $(QTDIRSFILE)
	echo "shared" >> $(QTDIRSFILE)

	$(CP) "$(PYTHON_SIP_CONFIG_TEMPLATE)" "$(SIPCFGFILE)"
	echo "INCDIR_QT			$(STAGING_DIR)/usr/include" >> $(SIPCFGFILE)
	echo "LIBDIR_QT			$(STAGING_DIR)/usr/lib" >> $(SIPCFGFILE)
	echo "MOC			$(STAGING_DIR_HOST)/bin/moc" >> $(SIPCFGFILE)
	echo "QT_INSTALL_BINS		$(STAGING_DIR)/usr/bin" >> $(SIPCFGFILE)
	echo "QT_INSTALL_HEADERS	$(STAGING_DIR)/usr/include" >> $(SIPCFGFILE)
	echo "QT_INSTALL_LIBS		$(STAGING_DIR)/usr/lib" >> $(SIPCFGFILE)
	echo "INCDIR			$(TARGET_INCDIRS)" >> $(SIPCFGFILE)
	echo "INCDIR_OPENGL		$(TARGET_INCDIRS)" >> $(SIPCFGFILE)
	echo "INCDIR_X11		$(TARGET_INCDIRS)" >> $(SIPCFGFILE)
	echo "LIBDIR			$(TARGET_LIBDIRS)" >> $(SIPCFGFILE)
	echo "LIBDIR_OPENGL		$(TARGET_LIBDIRS)" >> $(SIPCFGFILE)
	echo "LIBDIR_X11		$(TARGET_LIBDIRS)" >> $(SIPCFGFILE)

	$(call HostPython, \
		cd "$(PKG_BUILD_DIR)"; \
		, \
		./configure.py \
		        --use-arch="$(ARCH)" \
			--qmake="$(STAGING_DIR_HOST)/bin/qmake" \
			--qmake-spec="$(STAGING_DIR)/usr/share/mkspecs/linux-openwrt-g++" \
			--qmake-prefix='TARGET_CC="$(TARGET_CROSS)gcc"' \
			--qmake-prefix='TARGET_CXX="$(TARGET_CROSS)g++"' \
			--qmake-prefix='TARGET_AR="$(TARGET_CROSS)ar cqs"' \
			--qmake-prefix='TARGET_OBJCOPY="$(TARGET_CROSS)objcopy"' \
			--qmake-prefix='TARGET_RANLIB="$(TARGET_CROSS)ranlib"' \
			--qmake-prefix='TARGET_CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)"' \
			--qmake-prefix='TARGET_CXXFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)"' \
			--qmake-prefix='TARGET_LDFLAGS="$(TARGET_LDFLAGS) $(EXTRA_LDFLAGS)"' \
			--qmake-prefix='TARGET_INCDIRS="$(TARGET_INCDIRS)"' \
			--qmake-prefix='TARGET_LIBDIRS="$(TARGET_LIBDIRS)"' \
			--qmake-prefix='STAGING_DIR_HOST="$(STAGING_DIR)/../host"' \
			--qtdirs-file="$(QTDIRSFILE)" \
			--host-sip-bin="$(STAGING_DIR_HOST)/usr/bin/sip" \
			--sipconfig-macros="$(SIPCFGFILE)" \
			--dbus="$(STAGING_DIR)/usr/include/dbus-1.0" \
			--bindir="$(PKG_INSTALL_DIR)/usr/bin" \
			--destdir="$(PKG_INSTALL_DIR)/$(PYTHON_PKG_DIR)" \
			--plugin-destdir="$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins" \
			--pydbus-installdir="$(PKG_INSTALL_DIR)/$(PYTHON_PKG_DIR)" \
			--sipdir="$(PKG_INSTALL_DIR)/usr/share/sip" \
			--protected-is-public \
			--crosscompile \
			--no-designer-plugin \
			--no-qsci-api \
			--confirm-license \
			--verbose \
	)
	./files/fixup.sh "$(PKG_BUILD_DIR)"
endef

define Build/Compile
	$(MAKE_VARS) $(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)
endef

define Build/Install
	$(MAKE_VARS) DESTDIR="" $(MAKE) -C $(PKG_BUILD_DIR) install
endef

define Package/pyqt4/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/$(PYTHON_PKG_DIR)/PyQt4
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/{pylupdate4,pyrcc4,pyuic4} $(1)/usr/bin
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/$(PYTHON_PKG_DIR)/qt.so $(1)/$(PYTHON_PKG_DIR)
	$(CP) $(PKG_INSTALL_DIR)/$(PYTHON_PKG_DIR)/PyQt4 $(1)/$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,pyqt4))
