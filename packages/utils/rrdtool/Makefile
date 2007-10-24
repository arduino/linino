#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=rrdtool
PKG_VERSION:=1.2.23
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://oss.oetiker.ch/rrdtool/pub/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=dafa161bc9c61e57636a6085c87c1fe8

PKG_BUILD_DEPENDS:=libnotimpl python-core

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,$(STAGING_DIR)/mk/python-package.mk)
ifneq ($(MAKECMDGOALS),download)
  $(if $(DUMP)$(Build/Compile/PyMod),,$(error Python packaging code not found.))
endif

define Package/rrdtool/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Round Robin Database (RRD)
endef

define Package/librrd
$(call Package/rrdtool/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= management library (v1.2.x)
  DEPENDS+= +libart +libfreetype +libpng +zlib
endef

define Package/rrdcgi
$(call Package/rrdtool/Default)
  TITLE+= CGI graphing tool (v1.2.x)
  DEPENDS+= +librrd +cgilib
endef

define Package/rrdtool
$(call Package/rrdtool/Default)
  TITLE+= management tools (v1.2.x)
  DEPENDS+= +librrd
endef

define Package/rrdpy
  TITLE:=Round Robin Database (RRD) python bindings (v1.2.x)
  DEPENDS+= +librrd
endef

CONFIGURE_ARGS += \
	--enable-shared=yes \
	--enable-static=yes \
	--disable-rpath \
	--with-gnu-ld \
	--disable-mmap \
	--disable-perl \
	--disable-tcl \
	--disable-ruby \
	--without-x \
	--with-rrd-default-font="/usr/share/rrdtool/fonts/DejaVuSansMono-Roman.ttf" \

CONFIGURE_VARS += \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/freetype2 -I$(STAGING_DIR)/usr/include/libart-2.0" \
	LIBS="-lnotimpl" \
	rd_cv_ieee_works=yes \
	rd_cv_null_realloc=nope \
	ac_cv_func_mmap_fixed_mapped=yes \

ifneq ($(SDK)$(CONFIG_PACKAGE_rrdcgi),)
  CONFIGURE_ARGS += --enable-rrdcgi
else
  CONFIGURE_ARGS += --disable-rrdcgi
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_rrdpy),)
  CONFIGURE_ARGS += \
	--enable-python
  CONFIGURE_VARS += \
	PYTHON="$(PYTHON)"
else
  CONFIGURE_ARGS += --disable-python
endif

define Build/Configure
	$(call Build/Configure/Default)
	$(call libtool_disable_rpath)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) all
	$(call libtool_fixup_libdir)
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/rrd.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librrd.{a,so*} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librrd_th.{a,so*} $(1)/usr/lib/
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/include/rrd.h \
		$(STAGING_DIR)/usr/lib/librrd.{a,so*} \
		$(STAGING_DIR)/usr/lib/librrd_th.{a,so*}
endef

define Package/librrd/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librrd.so.* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librrd_th.so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/share/rrdtool/fonts
	$(CP) $(PKG_BUILD_DIR)/src/DejaVuSansMono-Roman.ttf \
		$(1)/usr/share/rrdtool/fonts/
endef

define Package/rrdcgi/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/rrdcgi $(1)/usr/bin/
endef

define PyPackage/rrdpy/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* $(1)$(PYTHON_PKG_DIR)/
endef

define Package/rrdtool/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/rrdtool $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/rrdupdate $(1)/usr/bin/
endef

$(eval $(call BuildPackage,librrd))
$(eval $(call BuildPackage,rrdcgi))
$(eval $(call PyPackage,rrdpy))
$(eval $(call BuildPackage,rrdpy))
$(eval $(call BuildPackage,rrdtool))
