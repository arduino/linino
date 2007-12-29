# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=wxbase
PKG_VERSION:=2.6.4
PKG_RELEASE:=1

PKG_SOURCE:=wxBase-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/wxwindows
PKG_MD5SUM:=6e55324d2a522d23fd8834ad8656e0b6

PKG_BUILD_DIR:=$(BUILD_DIR)/wxBase-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libwxbase
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Cross-platform C++ framework
  URL:=http://www.wxwidgets.org/
  DEPENDS:=+libexpat +uclibcxx +zlib @BROKEN
endef

define Package/libwxbase/description
 wxBase contains most of the non-GUI classes from the wxWindows cross-
 -platform C++ framework. There are 2 categories: generally useful portable 
 code (date/time handling, command line parsing, regular expression support) 
 and wrappers for the OS objects (files, directories, sockets, threads, 
 etc.) allowing you to write portable programs easily.
endef


# XXX: aMule *needs* the following configure options to be enabled:
#	--enable-intl
#	--enable-largefile
#	--disable-no_rtti
#	--with-regex
CONFIGURE_ARGS+= \
	--enable-shared \
	--disable-rpath \
	--with-gnu-ld \
	--disable-gui \
	--disable-monolithic \
	--enable-plugins \
	--disable-universal \
	--disable-nanox \
	--disable-gtk2 \
	--disable-gpe \
	--disable-optimise \
	--disable-debug \
	--disable-stl \
	--disable-omf \
	--disable-debug_flag \
	--disable-debug_info \
	--disable-debug_gdb \
	--disable-debug_cntxt \
	--disable-mem_tracing \
	--disable-profile \
	--disable-no_rtti \
	--disable-no_exceptions \
	--disable-compat22 \
	--disable-compat24 \
	--enable-intl \
	--disable-backtrace \
	--enable-exceptions \
	--disable-unicode \
	--disable-sound \
	--enable-largefile \
	\
	--without-gtk \
	--without-motif \
	--without-mac \
	--without-cocoa \
	--without-wine \
	--without-msw \
	--without-pm \
	--without-mgl \
	--without-microwin \
	--without-x11 \
	--without-libpng \
	--without-libjpeg \
	--without-libtiff \
	--without-libxpm \
	--without-libmspack \
	--without-sdl \
	--without-gnomeprint \
	--without-opengl \
	--without-dmalloc \
	--with-regex="sys" \
	--with-zlib="sys" \
	--without-odbc \
	--with-expat="sys" \
	--without-gtk-prefix \
	--without-x \
	--without-libiconv-prefix \
	--without-sdl-prefix \
	--without-cppunit-prefix \

CONFIGURE_VARS+= \
	CXX="g++-uc+std" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/include $(1)/usr/lib
	$(CP) -L $(PKG_INSTALL_DIR)/usr/bin/wx-config $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/wx-2.6 $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libwx_base{,_net,_xml}-2.6-*.so $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libwx_base{,_net,_xml}-2.6.so.* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/wx $(1)/usr/lib/
	$(SED) 's,-I$$$${includedir}/wx-2.6,-I$(STAGING_DIR)/usr/include/wx-2.6,g' $(1)/usr/bin/wx-config
	$(SED) 's,-I$$$${libdir}/wx/include,-I$(STAGING_DIR)/usr/lib/wx/include,g' $(1)/usr/bin/wx-config
endef

define Package/libwxbase/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libwx_base{,_net,_xml}-2.6.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libwxbase))
