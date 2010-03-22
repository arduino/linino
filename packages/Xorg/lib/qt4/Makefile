#
# Copyright (C) 2008-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# TODO:
#  - handle software which uses qmake in a more generic way (move functionality / generic qmake-config into buildroot)
#  - use generic qmake, moc, etc. executables since building them within the qt stack will get redundant and annyoing when other sw will need them as well
#  - test/add X11/xcb support
#  - handle plugins in a granular way (find out which packages should provide which plugins)

include $(TOPDIR)/rules.mk

PKG_NAME:=qt4
PKG_VERSION:=4.6.2
PKG_RELEASE:=1

PKG_SOURCE:=qt-everywhere-opensource-src-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.qt.nokia.com/qt/source
PKG_BUILD_DIR=$(BUILD_DIR)/qt-everywhere-opensource-src-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/qt4/Default
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=qt4
  DEPENDS:=qt4
endef

define Package/qt4
  $(call Package/qt4/Default)
  DEPENDS:=@FEATURE_drawing-backend_DirectFB +FEATURE_drawing-backend_DirectFB:DirectFB +zlib +libstdcpp +libsqlite3 # require directfb for now, as other systems (libX11, xcb) are untested
endef

define Package/qt4-gui
  $(call Package/qt4/Default)
  #DEPENDS+=+FEATURE_drawing-backend_DirectFB:DirectFB +libpng +libtiff +libjpeg +libfreetype
  DEPENDS+=+libpng +libtiff +libjpeg +libfreetype
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
  DEPENDS+=+qt4-gui
endef

define Package/qt4-network
  $(call Package/qt4/Default)
  TITLE+=(network)
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
  DEPENDS+=+qt4-gui
endef

#define Package/qt4-phonon-backend
#  $(call Package/qt4/Default)
#  TITLE+=(phonon-backend)
#endef

define Package/qt4-svg
  $(call Package/qt4/Default)
  TITLE+=(svg)
  #DEPENDS+=+qt4-gui @BROKEN
  DEPENDS+=+qt4-gui
endef

define Package/qt4-webkit
  $(call Package/qt4/Default)
  TITLE+=(webkit)
  DEPENDS+=@USE_GLIBC||@USE_EGLIBC # until we do not have nptl-support within uclibc javascriptcore will fail to link against uclibc
endef

define Package/qt4-script
  $(call Package/qt4/Default)
  TITLE+=(script)
  DEPENDS+=@USE_GLIBC||@USE_EGLIBC # until we do not have nptl-support within uclibc, javascriptcore will fail to link against uclibc
endef

define Package/qt4-scripttools
  $(call Package/qt4/Default)
  TITLE+=(scripttools)
  DEPENDS+=+qt4-script
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
  DEPENDS+=+libdbus
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
endef

TARGET_CFLAGS+="-I$(STAGING_DIR)/usr/include/freetype2"

define Build/Configure
	# demos/examples: which demos are going to be built depends on which features are going to to be compiled into qt
	# svg: svg support always compiled in, as once qt is built without, strange include errors occur when we're going to compile qt4-svg afterwards
	# linuxfb/directfb: since directfb is not much overhead compared to plain framebuffer, force using directfb
	# do not use fontconfig as it doesn't work anyway for qte
	( \
		cd $(PKG_BUILD_DIR); \
		QPATH='mkspecs/qws/linux-openwrt-g++' ; \
		mkdir $$$$QPATH ; \
		echo '#include "../../linux-g++/qplatformdefs.h"' \
			>> $$$$QPATH/qplatformdefs.h ; \
		echo 'include(../../common/g++.conf)' \
			>> $$$$QPATH/qmake.conf ; \
		echo 'include(../../common/linux.conf)' \
			>> $$$$QPATH/qmake.conf ; \
		echo 'include(../../common/qws.conf)' \
			>> $$$$QPATH/qmake.conf ; \
		echo "QMAKE_CC 			= $(TARGET_CC)" \
			>> $$$$QPATH/qmake.conf ; \
		echo "QMAKE_CXX 		= $(TARGET_CXX)" \
			>> $$$$QPATH/qmake.conf ; \
		echo "QMAKE_AR 			= $(TARGET_CROSS)ar cqs" \
			>> $$$$QPATH/qmake.conf ; \
		echo "QMAKE_OBJCOPY	 	= $(TARGET_CROSS)objcopy" \
			>> $$$$QPATH/qmake.conf ; \
		echo "QMAKE_RANLIB 		= $(TARGET_CROSS)ranlib" \
			>> $$$$QPATH/qmake.conf ; \
		echo "QMAKE_CFLAGS 		= $(TARGET_CFLAGS) $(EXTRA_CFLAGS) $(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS)" \
			>> $$$$QPATH/qmake.conf ; \
		echo "QMAKE_CXXFLAGS 		= $(TARGET_CFLAGS) $(EXTRA_CFLAGS) $(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS)" \
			>> $$$$QPATH/qmake.conf ; \
		echo "QMAKE_LINK 		= $(TARGET_CXX)" \
			>> $$$$QPATH/qmake.conf ; \
		echo "QMAKE_LINK_SHLIB 		= $(TARGET_CXX)" \
			>> $$$$QPATH/qmake.conf ; \
		echo "QMAKE_LINK_C 		= $(TARGET_CC)" \
			>> $$$$QPATH/qmake.conf ; \
		echo "QMAKE_LINK_C_SHLIB 	= $(TARGET_CC)" \
			>> $$$$QPATH/qmake.conf ; \
		echo "QMAKE_LFLAGS 		= -L$(PKG_BUILD_DIR)/lib $(TARGET_LDFLAGS) -Wl,-rpath-link=$(STAGING_DIR)/usr/lib" \
			>> $$$$QPATH/qmake.conf ; \
		echo "QMAKE_STRIP 		= : " \
			>> $$$$QPATH/qmake.conf ; \
		echo "QMAKE_STRIPFLAGS_LIB  	= " \
			>> $$$$QPATH/qmake.conf ; \
		echo 'load(qt_config)' \
			>> $$$$QPATH/qmake.conf ; \
		echo yes | ./configure \
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
			-$(if $(CONFIG_PACKAGE_qt4-demos),make demos,nomake demos) \
			-$(if $(CONFIG_PACKAGE_qt4-examples),make examples,nomake examples) \
			-nomake docs \
			-nomake translations \
			-embedded openwrt \
			-platform linux-g++ \
			-release \
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
			-no-decoration-styled \
			-no-decoration-windows \
			-no-decoration-default \
			-verbose \
			-$(if $(CONFIG_PACKAGE_qt4-multimedia),multimedia,no-multimedia) \
			-$(if $(CONFIG_PACKAGE_qt4-audio-backend),audio-backend,no-audio-backend) \
			-$(if $(CONFIG_PACKAGE_qt4-phonon),phonon,no-phonon) \
			-$(if $(CONFIG_PACKAGE_qt4-phonon-backend),phonon-backend,no-phonon-backend) \
			-svg \
			-$(if $(CONFIG_PACKAGE_qt4-webkit),webkit,no-webkit) \
			-$(if $(CONFIG_PACKAGE_qt4-javascript-jit),javascript-jit,no-javascript-jit) \
			-$(if $(CONFIG_PACKAGE_qt4-script),script,no-script) \
			-$(if $(CONFIG_PACKAGE_qt4-scripttools),scripttools,no-scripttools) \
			-$(if $(CONFIG_PACKAGE_qt4-accessibility),accessibility,no-accessibility) \
			-no-declarative \
			-no-openssl \
			-no-nis \
			-$(if $(CONFIG_PACKAGE_qt4-cups),cups,no-cups) \
			-no-iconv \
			-$(if $(CONFIG_PACKAGE_qt4-dbus),dbus,no-dbus) \
			-$(if $(CONFIG_PACKAGE_qt4-gtkstyle),gtkstyle,no-gtkstyle) \
			-no-nas-sound \
			-no-opengl \
			-no-openvg \
			-no-sm \
			-no-xshape \
			-no-xsync \
			-no-xinerama \
			-no-xcursor \
			-no-xfixes \
			-no-xrandr \
			-no-xrender \
			-no-mitshm \
			-no-fontconfig \
			-no-xinput \
			-no-xkb \
			-$(if $(CONFIG_PACKAGE_qt4-glib),glib,no-glib) \
			-$(if $(CONFIG_PACKAGE_qt4-qt3support),qt3support,no-qt3support) \
			-$(if $(CONFIG_FEATURE_drawing-backend_DirectFB),qt-gfx-directfb,) \
			-no-gfx-linuxfb \
			-no-gfx-multiscreen \
	)
endef

define Build/Compile
	INSTALL_ROOT=$(PKG_INSTALL_DIR) \
		$(MAKE) -C $(PKG_BUILD_DIR) install
endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/share/mkspecs \
		$(1)/usr/lib/pkgconfig \
		$(1)/usr/lib \
		$(1)/usr/include \
		$(1)/usr/lib/Qt/plugins

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

$(eval $(call BuildPackage,qt4))
$(eval $(call BuildPackage,qt4-gui))
$(eval $(call BuildPackage,qt4-demos))
$(eval $(call BuildPackage,qt4-examples))
$(eval $(call BuildPackage,qt4-network))
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
