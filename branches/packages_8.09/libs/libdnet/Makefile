#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libdnet
PKG_VERSION:=1.10
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=416b765e9d9961501ac85e9a366fd219
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/libdnet
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Low-level network library
  URL:=http://sourceforge.net/projects/libdnet/
endef

define Package/libdnet/description
	libdnet is a library of simplified, portable interface to several 
	low-level networking routines.
endef

define Package/pydnet
  SECTION:=libs
  DEPENDS:=libdnet python-core
  CATEGORY:=Libraries
  TITLE:=Low-level network library
  URL:=http://sourceforge.net/projects/libdnet/
endef

define Package/pydnet/description
	libdnet is a library of simplified, portable interface to several 
	low-level networking routines.
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--without-check \
	--without-python

CONFIGURE_VARS += \
	ac_cv_dnet_bsd_bpf=no

MAKE_FLAGS += \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	all install

define Build/InstallDev
	$(INSTALL_DIR) $(2)/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/dnet-config \
		$(2)/bin/
	$(SED) \
		's,^\(prefix\|exec_prefix\)=.*,\1=$(STAGING_DIR)/usr,g' \
		$(2)/bin/dnet-config

	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA)\
		$(PKG_INSTALL_DIR)/usr/include/dnet.h \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/dnet \
		$(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libdnet.{la,a,so*} \
		$(1)/usr/lib/
endef

define Package/libdnet/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libdnet.so.* \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/sbin/dnet \
		$(1)/usr/sbin/
endef

define Package/pydnet/install
	$(INSTALL_DIR) $(1)/usr/lib
	cd $(PKG_BUILD_DIR)/python; \
	CFLAGS="$(TARGET_CFLAGS)" \
	$(STAGING_DIR)/usr/bin/hostpython ./setup.py install \
		--no-compile --prefix $(PKG_INSTALL_DIR)/usr
	cp -a $(PKG_INSTALL_DIR)/usr/lib/python* $(1)/usr/lib/
endef


$(eval $(call BuildPackage,libdnet))
$(eval $(call BuildPackage,pydnet))
