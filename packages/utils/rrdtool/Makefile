#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=rrdtool
PKG_VERSION:=1.2.11
PKG_RELEASE:=1
PKG_MD5SUM:=d61c5755cb77207f9ad3584b26e8bf08

PKG_SOURCE_URL:=http://people.ee.ethz.ch/~oetiker/webtools/rrdtool/pub
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/rrd
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Round Robin Database (RRD) tools (v1.2.x)
  SUBMENU:=Round Robin Database (RRD) tools (v1.2.x)
endef

define Package/librrd
  $(call Package/rrd)
  DEPENDS:=+libart +libfreetype +libpng +zlib
  SECTION:=libs
  CATEGORY:=Utilities
  TITLE:=Round Robin Database (RRD) management library (v1.2.x)
endef
	
define Package/rrdcgi
  $(call Package/rrd)
  DEPENDS:=librrd +cgilib
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Round Robin Database (RRD) CGI graphing tool (v1.2.x)
endef

define Package/rrdtool
  $(call Package/rrd)
  DEPENDS:=librrd
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Round Robin Database (RRD) management tools (v1.2.x)
endef

define Build/Configure
$(call Build/Configure/Default,--enable-shared=yes \
                        --enable-static=yes \
                        --disable-rpath \
                        --with-gnu-ld \
                        --enable-rrdcgi \
                        --disable-mmap \
                        --disable-perl \
                        --disable-tcl \
                        --disable-python \
                        --without-x \
                        --with-rrd-default-font=/usr/share/rrdtool/fonts/DejaVuSansMono-Roman.ttf, CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include/freetype2 -I$(STAGING_DIR)/usr/include/libart-2.0" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib " \
		LIBS="-lnotimpl" \
		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
		rd_cv_ieee_works=yes)
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/rrdtool/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/rrdtool $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/rrdupdate $(1)/usr/bin/
endef

define Package/rrdcgi/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/rrdcgi $(1)/usr/bin/
endef

define Package/librrd/install	
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librrd.so.* $(1)/usr/lib/
	install -d -m0755 $(1)/usr/share/rrdtool/fonts
	$(CP) $(PKG_BUILD_DIR)/src/DejaVuSansMono-Roman.ttf \
		$(1)/usr/share/rrdtool/fonts/
endef

define Build/InstallDev	
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/rrd.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librrd.a $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librrd.so* $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev	
	rm -rf \
		$(STAGING_DIR)/usr/include/rrd.h \
		$(STAGING_DIR)/usr/lib/librrd.a \
		$(STAGING_DIR)/usr/lib/librrd.so*
endef

$(eval $(call BuildPackage,librrd))
$(eval $(call BuildPackage,rrdcgi))
$(eval $(call BuildPackage,rrdtool))
