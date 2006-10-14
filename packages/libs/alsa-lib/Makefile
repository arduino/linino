# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=alsa-lib
PKG_VERSION:=1.0.11
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.alsa-project.org/pub/lib/
PKG_MD5SUM:=ef7ae78a0ef08cbeacb295f2518886ab
PKG_CAT:=bzcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/alsa-lib
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+alsa
  TITLE:=Advanced Linux Sound Architecture Library
  DESCRIPTION:=This is the library package for alsa, needed by some userspace programs. You must\\\
  	have enabled the ALSA support in the kernel.
  URL:=http://www.alsa-project.org/
endef

define Build/Configure
$(call Build/Configure/Default,\
		--enable-shared=yes \
		--enable-static=yes \
		--with-gnu-ld \
		--disable-debugging \
		--disable-profiling \
		--with-softfloat \
		--with-versioned=no \
)
endef

define Build/Compile
$(call Build/Compile/Default,\
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install)
endef

define Package/alsa-lib/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libasound.so.* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/alsa $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libasound.{a,so}* $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/alsa \
		$(STAGING_DIR)/usr/lib/libasound.{a,so}*
endef

$(eval $(call BuildPackage,alsa-lib))
