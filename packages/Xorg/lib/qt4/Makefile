#
# Copyright (C) 2008-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# TODO:
#  - test/add xcb support
#  - handle plugins in a granular way (find out which packages should provide which plugins)

include $(TOPDIR)/rules.mk

PKG_NAME:=qt4
PKG_VERSION:=4.7.0
PKG_RELEASE:=1
PKG_MD5SUM:=3a2f25b9b115037277f4fb759194a7a5

PKG_SOURCE:=qt-everywhere-opensource-src-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.qt.nokia.com/qt/source
PKG_BUILD_DIR=$(BUILD_DIR)/qt-everywhere-opensource-src-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_CONFIG_DEPENDS:= \
	CONFIG_QT4_WS_QWS \
	CONFIG_QT4_WS_X11 \
	CONFIG_PACKAGE_directfb \
	CONFIG_PACKAGE_qt4-demos \
	CONFIG_PACKAGE_qt4-examples \
	CONFIG_PACKAGE_qt4-svg \
	CONFIG_PACKAGE_qt4-qt3support \
	CONFIG_PACKAGE_qt4-dbus \
	CONFIG_PACKAGE_qt4-phonon \
	CONFIG_PACKAGE_qt4-sqlite \
	CONFIG_PACKAGE_qt4-mysql \
	CONFIG_PACKAGE_qt4-openssl

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,./files/qmake.mk)

# this should be moved to a more generic place later, as other packages are configured different as well depending on available nptl support
ifeq ($(CONFIG_USE_GLIBC),y)
  NPTL:=y
endif
ifeq ($(CONFIG_USE_EGLIBC),y)
  NPTL:=y
endif
ifeq ($(CONFIG_UCLIBC_VERSION_0_9_32),y)
  NPTL:=y
endif

define Package/qt4/config
	source "$(SOURCE)/Config.in"
endef

define Package/qt4/Default
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=qt4
  DEPENDS:=qt4
  DEFAULT:=m if PACKAGE_qt4-gui && ALL
  URL:=http://qt.nokia.com/
endef

define Package/qt4
  $(call Package/qt4/Default)
  DEPENDS:=+zlib +libstdcpp +libsqlite3
endef

define Package/qt4-gui
  $(call Package/qt4/Default)
  DEFAULT:=
  DEPENDS+=+libpng +libtiff +libjpeg +libfreetype +qt4-network \
	+FEATURE_drawing-backend_DirectFB:directfb \
	+FEATURE_drawing-backend_libX11:libX11 \
	+FEATURE_drawing-backend_libX11:libXext @DISPLAY_SUPPORT
  TITLE+=(gui)
endef

define Package/qt4-demos
  $(call Package/qt4/Default)
  TITLE+=(demos)
  DEPENDS+=+qt4-gui
endef

define Package/qt4-examples
  $(call Package/qt4/Default)
  TITLE+=(examples)
  DEPENDS+=+qt4-gui +qt4-svg
endef

define Package/qt4-network
  $(call Package/qt4/Default)
  TITLE+=(network)
endef

define Package/qt4-sqlite
  $(call Package/qt4/Default)
  TITLE+=(sqlite)
  DEPENDS+=+libsqlite3
endef

define Package/qt4-mysql
  $(call Package/qt4/Default)
  TITLE+=(mysql)
  DEPENDS+=+libmysqlclient
endef

define Package/qt4-openssl
  $(call Package/qt4/Default)
  TITLE+=(openssl)
  DEPENDS+=+libopenssl
endef

#define Package/qt4-multimedia
#  $(call Package/qt4/Default)
#  TITLE+=(multimedia)
#endef

#define Package/qt4-audio-backend
#  $(call Package/qt4/Default)
#  TITLE+=(audio-backend)
#endef

define Package/qt4-phonon
  $(call Package/qt4/Default)
  TITLE+=(phonon)
  DEPENDS+=+qt4-gui +qt4-xml +qt4-dbus +qt4-network
endef

#define Package/qt4-phonon-backend
#  $(call Package/qt4/Default)
#  TITLE+=(phonon-backend)
#endef

define Package/qt4-svg
  $(call Package/qt4/Default)
  TITLE+=(svg)
  DEPENDS+=+qt4-gui +qt4-network
endef

define Package/qt4-webkit
  $(call Package/qt4/Default)
  TITLE+=(webkit)
  DEPENDS+=@USE_GLIBC||@USE_EGLIBC||@UCLIBC_VERSION_0_9_32 +libsqlite3 +qt4-phonon +qt4-dbus +qt4-xml +qt4-gui +qt4-network # versions of uclibc prior 0.9.32 do not have nptl support
endef

define Package/qt4-script
  $(call Package/qt4/Default)
  TITLE+=(script)
  DEPENDS+=@USE_GLIBC||@USE_EGLIBC||@UCLIBC_VERSION_0_9_32 # versions of uclibc prior 0.9.32 do not have nptl support
endef

define Package/qt4-scripttools
  $(call Package/qt4/Default)
  TITLE+=(scripttools)
  DEPENDS+=+qt4-script +qt4-gui +qt4-network
endef

#define Package/qt4-accessibility
#  $(call Package/qt4/Default)
#  TITLE+=(accessibility)
#endef

#define Package/qt4-javascript-jit
#  $(call Package/qt4/Default)
#  TITLE+=(javascript-jit)
#endef

#define Package/qt4-cups
#  $(call Package/qt4/Default)
#  TITLE+=(cups)
#endef

define Package/qt4-dbus
  $(call Package/qt4/Default)
  TITLE+=(dbus)
  DEPENDS+=+libdbus +qt4-xml
endef

#define Package/qt4-gtkstyle
#  $(call Package/qt4/Default)
#  TITLE+=(gtkstyle)
#endef

#define Package/qt4-glib
#  $(call Package/qt4/Default)
#  TITLE+=(glib)
#endef

define Package/qt4-qt3support
  $(call Package/qt4/Default)
  TITLE+=(qt3support)
  DEPENDS+=+qt4-gui +qt4-xml
endef

define Package/qt4-declarative
  $(call Package/qt4/Default)
  TITLE+=(declarative)
  DEPENDS+=+qt4-script +qt4-xml +qt4-gui +qt4-network
endef

define Package/qt4-xml
  $(call Package/qt4/Default)
  TITLE+=(xml)
endef

###
define Package/qt4-drivers-mouse/Default
  $(call Package/qt4/Default)
  TITLE+=mousedrivers
  DEPENDS+=@QT4_WS_QWS
endef

define Package/qt4-drivers-mouse-tpmousedriver
  $(call Package/qt4-drivers-mouse/Default)
  TITLE+=tpmousedriver
endef

define Package/qt4-drivers-mouse-pcmousedriver
  $(call Package/qt4-drivers-mouse/Default)
  TITLE+=pcmousedriver
endef

define Package/qt4-drivers-mouse-tslibmousedriver
  $(call Package/qt4-drivers-mouse/Default)
  TITLE+=tslibmousedriver
  DEPENDS+=+tslib
endef

###
define Package/qt4-drivers-gfx/Default
  $(call Package/qt4/Default)
  TITLE+=gfxdrivers
  DEPENDS+=@QT4_WS_QWS
endef

define Package/qt4-drivers-gfx-directfb
  $(call Package/qt4-drivers-gfx/Default)
  TITLE+=directfb
  DEPENDS+=@FEATURE_drawing-backend_DirectFB +FEATURE_drawing-backend_DirectFB:directfb
endef

define Package/qt4-drivers-gfx-linuxfb
  $(call Package/qt4-drivers-gfx/Default)
  TITLE+=linuxfb
endef

###
define Package/qt4-drivers-kbd/Default
  $(call Package/qt4/Default)
  TITLE+=kbddrivers
  DEPENDS+=@QT4_WS_QWS
endef


TARGET_INCDIRS+=$(STAGING_DIR)/include $(STAGING_DIR)/usr/include $(TOOLCHAIN_DIR)/include $(TOOLCHAIN_DIR)/usr/include
TARGET_LIBDIRS+=$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib $(TOOLCHAIN_DIR)/lib $(TOOLCHAIN_DIR)/usr/lib
TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib,-rpath-link=$(PKG_BUILD_DIR)/lib
TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include/freetype2 -I$(PKG_BUILD_DIR)/include

ifeq ($(CONFIG_QT4_WS_QWS),y)
  FILEPFX:=qws-
endif
ifeq ($(CONFIG_QT4_WS_X11),y)
  FILEPFX:=x11-
endif
ifeq ($(CONFIG_PACKAGE_qt4-gui),)
  # If GUI is disabled, we use the X11 prefix. That's good enough, for now.
  # The X11 files also work for non-GUI.
  FILEPFX:=x11-
endif

define Build/Configure
	# NOTES:
	#  demos/examples: which demos are going to be built depends on which features are going to to be compiled into qt
	#  linuxfb/directfb: since directfb is not much overhead compared to plain framebuffer, force using directfb
	#  do not use fontconfig as it doesn't work anyway for qte
	#  bindir: bindir is where the host tools (qmake, moc, rcc, uic) will get installed into - they are just used on the host and not goig to be packaged
	mkdir -p $(PKG_BUILD_DIR)/mkspecs/$(QMAKE_PLATFORM_PREFIX)linux-openwrt-g++
	$(CP) ./files/$(FILEPFX)qmake.conf $(PKG_BUILD_DIR)/mkspecs/$(QMAKE_PLATFORM_PREFIX)linux-openwrt-g++/qmake.conf
	$(CP) ./files/$(FILEPFX)qplatformdefs.h $(PKG_BUILD_DIR)/mkspecs/$(QMAKE_PLATFORM_PREFIX)linux-openwrt-g++/qplatformdefs.h
	( cd $(PKG_BUILD_DIR) ; \
		TARGET_CC="$(TARGET_CROSS)gcc" \
		TARGET_CXX="$(TARGET_CROSS)g++" \
		TARGET_AR="$(TARGET_CROSS)ar cqs" \
		TARGET_OBJCOPY="$(TARGET_CROSS)objcopy" \
		TARGET_RANLIB="$(TARGET_CROSS)ranlib" \
		TARGET_CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
		TARGET_CXXFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
		TARGET_LDFLAGS="$(TARGET_LDFLAGS) $(EXTRA_LDFLAGS)" \
		TARGET_INCDIRS="$(TARGET_INCDIRS)" \
		TARGET_LIBDIRS="$(TARGET_LIBDIRS)" \
		STAGING_DIR="$(STAGING_DIR)" \
		STAGING_DIR_HOST="$(STAGING_DIR)/../host" \
		./configure \
			-arch $(ARCH) \
			-prefix $(CONFIGURE_PREFIX) \
			-bindir $(CONFIGURE_PREFIX)/bin \
			-libdir $(CONFIGURE_PREFIX)/lib \
			-datadir $(CONFIGURE_PREFIX)/share/Qt \
			-plugindir $(CONFIGURE_PREFIX)/lib/Qt/plugins \
			-demosdir $(CONFIGURE_PREFIX)/share/Qt/demos \
			-examplesdir $(CONFIGURE_PREFIX)/share/Qt/examples \
			-sysconfdir /etc/Qt \
			-no-rpath \
			-force-pkg-config \
			-nomake tools \
			$(if $(CONFIG_PACKAGE_qt4-demos),-make,-nomake) demos \
			$(if $(CONFIG_PACKAGE_qt4-examples),-make,-nomake) examples \
			-nomake docs \
			-nomake translations \
			-xplatform $(QMAKE_PLATFORM_PREFIX)linux-openwrt-g++ \
			-platform linux-g++ \
			$(if $(CONFIG_QT4_WS_X11),-x11,-embedded) \
			-release \
			-confirm-license \
			-opensource \
			-no-mmx \
			-no-3dnow \
			-no-sse \
			-no-sse2 \
			-system-zlib \
			-system-libtiff \
			-system-libpng \
			-system-libjpeg \
			-system-freetype \
			-system-sqlite \
			$(if $(CONFIG_PACKAGE_qt4-sqlite),-plugin-sql-sqlite) \
			$(if $(CONFIG_PACKAGE_qt4-mysql),-plugin-sql-mysql) \
			-no-decoration-styled \
			-no-decoration-windows \
			-no-decoration-default \
			-verbose \
			-no-multimedia \
			-no-audio-backend \
			$(if $(CONFIG_PACKAGE_qt4-phonon),-phonon,-no-phonon) \
			-no-phonon-backend \
			$(if $(CONFIG_PACKAGE_qt4-svg),-svg,-no-svg) \
			$(if $(NPTL),-webkit,-no-webkit) \
			-no-javascript-jit \
			$(if $(NPTL),-script,-no-script) \
			$(if $(NPTL),-scripttools,-no-scripttools) \
			-no-accessibility \
			$(if $(NPTL),-declarative,-no-declarative) \
			$(if $(CONFIG_PACKAGE_qt4-openssl),-openssl -I $(STAGING_DIR)/usr/include,-no-openssl) \
			-no-nis \
			-no-cups \
			-no-iconv \
			$(if $(CONFIG_PACKAGE_qt4-dbus),-dbus,-no-dbus) \
			-no-gtkstyle \
			-no-nas-sound \
			-no-opengl \
			-no-openvg \
			-no-sm \
			-no-xshape \
			$(if $(CONFIG_QT4_WS_X11),-no-xsync,-xsync) \
			-no-xinerama \
			$(if $(CONFIG_QT4_WS_X11),-no-xcursor,-xcursor) \
			-no-xfixes \
			-no-xrandr \
			-no-xrender \
			-no-mitshm \
			$(if $(CONFIG_QT4_WS_X11),-no-fontconfig,-fontconfig) \
			$(if $(CONFIG_QT4_WS_X11),-no-xinput,-xinput) \
			$(if $(CONFIG_QT4_WS_X11),-no-xkb,-xkb) \
			-no-glib \
			$(if $(CONFIG_PACKAGE_qt4-qt3support),-qt3support,-no-qt3support) \
			-no-gfx-transformed \
			-no-gfx-qvfb \
			-no-gfx-vnc \
			-no-gfx-multiscreen \
			-no-gfx-qnx \
			$(if $(CONFIG_PACKAGE_directfb),-plugin-gfx-directfb) \
			-plugin-gfx-linuxfb \
			-no-mouse-qvfb \
			-no-mouse-qnx \
			-qt-mouse-linuxinput \
			-plugin-mouse-linuxtp \
			-plugin-mouse-pc \
			-plugin-mouse-tslib \
			-no-kbd-qvfb \
			-no-kbd-qnx \
			-qt-kbd-tty \
			-qt-kbd-linuxinput \
	)
endef

define Build/Compile
	# just passing <make install> results in not building 3rdparty/webkit/JavaScriptCore
	# unfortunately in this particular case, <make> makes further <qmake> calls, therewith
	#  uses the qmake.conf which needs get the cross-compiling vars passed once again
	TARGET_CC="$(TARGET_CROSS)gcc" \
	TARGET_CXX="$(TARGET_CROSS)g++" \
	TARGET_AR="$(TARGET_CROSS)ar cqs" \
	TARGET_OBJCOPY="$(TARGET_CROSS)objcopy" \
	TARGET_RANLIB="$(TARGET_CROSS)ranlib" \
	TARGET_CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
	TARGET_CXXFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
	TARGET_LDFLAGS="$(TARGET_LDFLAGS) $(EXTRA_LDFLAGS)" \
	TARGET_INCDIRS="$(TARGET_INCDIRS)" \
	TARGET_LIBDIRS="$(TARGET_LIBDIRS)" \
	STAGING_DIR="$(STAGING_DIR)" \
	STAGING_DIR_HOST="$(STAGING_DIR)/../host" \
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)
	INSTALL_ROOT=$(PKG_INSTALL_DIR) \
		$(MAKE) -C $(PKG_BUILD_DIR) install
endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(STAGING_DIR_HOST)/bin

	# host tools (qmake, moc, rcc, uic)
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/bin/{qmake,moc,rcc,uic} \
		$(STAGING_DIR_HOST)/bin/

	$(INSTALL_DIR) \
		$(1)/mk \
		$(1)/usr/share/mkspecs \
		$(1)/usr/lib/pkgconfig \
		$(1)/usr/lib \
		$(1)/usr/include \
		$(1)/usr/lib/Qt/plugins

	$(CP) \
		./files/qmake.mk \
		$(1)/mk/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/Qt/mkspecs/* \
		$(1)/usr/share/mkspecs/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/

	#$(CP) \
	#	$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/* \
	#	$(1)/usr/lib/Qt/plugins/
endef

define Package/qt4/install
	$(INSTALL_DIR) \
		$(1)/usr/lib \
		$(1)/usr/lib/Qt/plugins

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libQtCore.so* \
		$(1)/usr/lib/

	#$(CP) \
	#	$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/codecs/*.so \
	#	$(1)/usr/lib/Qt/plugins/codecs/
endef

define Package/qt4-gui/install
	$(INSTALL_DIR) \
		$(1)/usr/lib \
		$(1)/usr/lib/Qt/plugins

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libQtGui.so* \
		$(1)/usr/lib/

	#HACK: Qt4 requires having truetype fonts stored in /usr/lib/fonts - no subdirectories allowed, so use the dejavue set by default
	ln -s \
		/usr/share/fonts/ttf-dejavu \
		$(1)/usr/lib/fonts

	# we use the dejavue font package instead
	#$(INSTALL_DATA) \
	#	$(PKG_INSTALL_DIR)/usr/lib/fonts/*.ttf \
	#	$(1)/usr/lib/fonts/

	#$(CP) \
	#	$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/accessible \
	#	$(1)/usr/lib/Qt/plugins/

	#$(CP) \
	#	$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/imageformats \
	#	$(1)/usr/lib/Qt/plugins/

	#$(CP) \
	#	$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/inputmethods \
	#	$(1)/usr/lib/Qt/plugins/
endef

define Package/qt4-demos/install
	$(INSTALL_DIR) \
		$(1)/usr/share/Qt

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/Qt/demos \
		$(1)/usr/share/Qt/

	$(FIND) \
		$(1) \
		-name "*.cpp" -o \
		-name "*.h" -o \
		-name "*.pro" \
		| $(XARGS) rm
endef

define Package/qt4-examples/install
	$(INSTALL_DIR) \
		$(1)/usr/share/Qt

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/Qt/examples \
		$(1)/usr/share/Qt/

	$(FIND) \
		$(1) \
		-name "*.cpp" -o \
		-name "*.h" -o \
		-name "*.pro" \
		| $(XARGS) rm
endef

define Package/qt4-network/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libQtNetwork.so* \
		$(1)/usr/lib/
endef

define Package/qt4-sqlite/install
	$(INSTALL_DIR) \
		$(1)/usr/lib/Qt/plugins/sqldrivers

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libQtSql.so* \
		$(1)/usr/lib/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/sqldrivers/libqsqlite.so \
		$(1)/usr/lib/Qt/plugins/sqldrivers/
endef

define Package/qt4-mysql/install
	$(INSTALL_DIR) \
		$(1)/usr/lib/Qt/plugins/sqldrivers

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libQtSql.so* \
		$(1)/usr/lib/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/sqldrivers/libqsqlmysql.so \
		$(1)/usr/lib/Qt/plugins/sqldrivers/
endef

#define Package/qt4-multimedia/install
#	$(INSTALL_DIR) \
#		$(1)/usr/bin
#
#	$(CP) \
#		$(PKG_INSTALL_DIR)/usr/bin/examples/* \
#		$(1)/usr/bin/
#endef

define Package/qt4-phonon/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libphonon.so* \
		$(1)/usr/lib/
endef

define Package/qt4-svg/install
	$(INSTALL_DIR) \
		$(1)/usr/lib \
		$(1)/usr/lib/Qt/plugins

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libQtSvg.so* \
		$(1)/usr/lib/

	#$(CP) \
	#	$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/iconengines \
	#	$(1)/usr/lib/Qt/plugins/

	#$(CP) \
	#	$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/imageformats \
	#	$(1)/usr/lib/Qt/plugins/
endef

define Package/qt4-webkit/install
	$(INSTALL_DIR) \
		$(1)/usr/lib \
		$(1)/usr/lib/Qt/plugins

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libQtWebKit.so* \
		$(1)/usr/lib/

	#$(CP) \
	#	$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/designer \
	#	$(1)/usr/lib/Qt/plugins/
endef

define Package/qt4-script/install
	$(INSTALL_DIR) \
		$(1)/usr/lib \
		$(1)/usr/lib/Qt/plugins

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libQtScript.so* \
		$(1)/usr/lib/

	#$(CP) \
	#	$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/script \
	#	$(1)/usr/lib/Qt/plugins/
endef

define Package/qt4-scripttools/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libQtScriptTools.so* \
		$(1)/usr/lib/
endef

define Package/qt4-dbus/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libQtDBus.so* \
		$(1)/usr/lib/

	#$(CP) \
	#	$(PKG_INSTALL_DIR)/usr/bin/qdbus \
	#	$(1)/usr/bin/
endef

define Package/qt4-qt3-support/install
	$(INSTALL_DIR) \
		$(1)/usr/lib \
		$(1)/usr/lib/Qt/plugins

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libQt3Support.so* \
		$(1)/usr/lib/

	#$(CP) \
	#	$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/accessible \
	#	$(1)/usr/lib/Qt/plugins/
endef

define Package/qt4-declarative/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libQtDeclarative.so* \
		$(1)/usr/lib/
endef

define Package/qt4-xml/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libQtXml.so* \
		$(1)/usr/lib/
endef

# plugins
#  mouse drivers
define Package/qt4-drivers-mouse-tpmousedriver/install
	$(INSTALL_DIR) \
		$(1)/usr/lib/Qt/plugins/mousedrivers

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/mousedrivers/libqlinuxtpmousedriver.so \
		$(1)/usr/lib/Qt/plugins/mousedrivers/
endef

define Package/qt4-drivers-mouse-pcmousedriver/install
	$(INSTALL_DIR) \
		$(1)/usr/lib/Qt/plugins/mousedrivers

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/mousedrivers/libqpcmousedriver.so \
		$(1)/usr/lib/Qt/plugins/mousedrivers/
endef

define Package/qt4-drivers-mouse-tslibmousedriver/install
	$(INSTALL_DIR) \
		$(1)/usr/lib/Qt/plugins/mousedrivers

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/mousedrivers/libqtslibmousedriver.so \
		$(1)/usr/lib/Qt/plugins/mousedrivers/
endef

#  graphics drivers
define Package/qt4-drivers-gfx-directfb/install
	$(INSTALL_DIR) \
		$(1)/usr/lib/Qt/plugins/gfxdrivers

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/gfxdrivers/libqdirectfbscreen.so \
		$(1)/usr/lib/Qt/plugins/gfxdrivers/
endef

define Package/qt4-drivers-gfx-linuxfb/install
	$(INSTALL_DIR) \
		$(1)/usr/lib/Qt/plugins/gfxdrivers

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/Qt/plugins/gfxdrivers/libqscreenlinuxfb.so \
		$(1)/usr/lib/Qt/plugins/gfxdrivers/
endef

#  keyboard drivers



$(eval $(call BuildPackage,qt4))
$(eval $(call BuildPackage,qt4-gui))
$(eval $(call BuildPackage,qt4-demos))
$(eval $(call BuildPackage,qt4-examples))
$(eval $(call BuildPackage,qt4-network))
$(eval $(call BuildPackage,qt4-sqlite))
$(eval $(call BuildPackage,qt4-mysql))
$(eval $(call BuildPackage,qt4-openssl))
#$(eval $(call BuildPackage,qt4-multimedia))
#$(eval $(call BuildPackage,qt4-audio-backend))
$(eval $(call BuildPackage,qt4-phonon))
#$(eval $(call BuildPackage,qt4-phonon-backend))
$(eval $(call BuildPackage,qt4-svg))
$(eval $(call BuildPackage,qt4-webkit))
$(eval $(call BuildPackage,qt4-script))
$(eval $(call BuildPackage,qt4-scripttools))
#$(eval $(call BuildPackage,qt4-accessibility))
#$(eval $(call BuildPackage,qt4-javascript-jit))
#$(eval $(call BuildPackage,qt4-cups))
$(eval $(call BuildPackage,qt4-dbus))
#$(eval $(call BuildPackage,qt4-gtkstyle))
#$(eval $(call BuildPackage,qt4-glib))
$(eval $(call BuildPackage,qt4-qt3support))
$(eval $(call BuildPackage,qt4-declarative))
$(eval $(call BuildPackage,qt4-xml))

$(eval $(call BuildPackage,qt4-drivers-mouse-tpmousedriver))
$(eval $(call BuildPackage,qt4-drivers-mouse-pcmousedriver))
$(eval $(call BuildPackage,qt4-drivers-mouse-tslibmousedriver))

$(eval $(call BuildPackage,qt4-drivers-gfx-directfb))
$(eval $(call BuildPackage,qt4-drivers-gfx-linuxfb))
