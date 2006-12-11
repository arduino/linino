# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=alsa-lib
PKG_VERSION:=1.0.13
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.alsa-project.org/pub/lib/
PKG_MD5SUM:=d55a9d7d2a79d738a1b7a511cffda4b6
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/alsa-lib
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+kmod-alsa @USB_SUPPORT
  TITLE:=ALSA (Advanced Linux Sound Architecture) library
  DESCRIPTION:=\
	This is the library package for alsa, needed by some userspace programs. You must \\\
	have enabled the ALSA support in the kernel.
  URL:=http://www.alsa-project.org/
endef

define Build/Configure
	$(call Build/Configure/Default,\
		--enable-shared \
		--enable-static \
		--disable-debugging \
		--disable-profiling \
		--with-softfloat \
		--with-versioned=no \
	)
endef

define Build/Compile
	# override AM_CFLAGS holding inappropriate optimization flags
	$(MAKE) -C $(PKG_BUILD_DIR) \
		AM_CFLAGS="" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/alsa $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libasound.{a,so}* $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/alsa.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir}/alsa,,g' $(STAGING_DIR)/usr/lib/pkgconfig/alsa.pc
	$(SED) 's,-I$$$${includedir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/alsa.pc
	$(SED) 's,-L$$$${libdir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/alsa.pc
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/alsa \
		$(STAGING_DIR)/usr/lib/libasound.{a,so}* \
		$(STAGING_DIR)/usr/lib/pkgconfig/alsa.pc
endef

define Package/alsa-lib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libasound.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,alsa-lib))
