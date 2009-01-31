#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libaudiofile
PKG_VERSION:=0.2.6
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.cti.ecp.fr/~beauxir5/peercast
PKG_MD5SUM:=460f848ce5f4a33ae66b15a4fb7720ec
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

define Package/libaudiofile
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Audio File library
  URL:=http://www.68k.org/~michael/audiofile/
endef

define Package/libaudiofile/description
	The audiofile library allows the processing of audio data to and from audio 
	files of many common formats (currently AIFF, AIFF-C, WAVE, NeXT/Sun, BICS, 
	and raw data).
endef

TARGET_CFLAGS += $(FPIC)

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--with-build-cc="$(HOSTCC)" \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(2)/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/audiofile-config \
		$(2)/bin/
	$(SED) \
		's,^\(prefix\|exec_prefix\)=.*,\1=$(STAGING_DIR)/usr,g' \
		$(2)/bin/audiofile-config

	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/{af_vfs,audiofile,aupvlist}.h \
		$(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libaudiofile.{la,a,so*} \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/audiofile.pc \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libaudiofile/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libaudiofile.so.* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libaudiofile))
