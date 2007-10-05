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

include $(INCLUDE_DIR)/package.mk

ifeq ($(KERNEL),2.4)
DEPENDS_KMOD:=+kmod-alsa
else
DEPENDS_KMOD:=+kmod-soundcore
endif

define Package/alsa-lib
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=ALSA (Advanced Linux Sound Architecture) library
  URL:=http://www.alsa-project.org/
  DEPENDS:=@USB_SUPPORT $(DEPENDS_KMOD)
endef

define Package/alsa-lib/description
 This is the library package for alsa, needed by some userspace programs.
 You must have enabled the ALSA support in the kernel.
endef

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-debugging \
	--disable-profiling \
	--with-softfloat \
	--with-versioned=no \

define Build/Configure
	$(call Build/Configure/Default)
	$(call libtool_disable_rpath)
endef

define Build/Compile
	# override AM_CFLAGS holding inappropriate optimization flags
	$(MAKE) -C $(PKG_BUILD_DIR) AM_CFLAGS="" all
	$(call libtool_fixup_libdir,$(PKG_INSTALL_DIR))
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/alsa $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libasound.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/alsa.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir}/alsa,-I$(STAGING_DIR)/usr/include/alsa,g' $(STAGING_DIR)/usr/lib/pkgconfig/alsa.pc
	$(SED) 's,-I$$$${includedir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/alsa.pc
	$(SED) 's,-L$$$${libdir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/alsa.pc
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/include/alsa \
		$(STAGING_DIR)/usr/lib/libasound.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/alsa.pc
endef

define Package/alsa-lib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libasound.so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/share/alsa/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/alsa/alsa.conf $(1)/usr/share/alsa/
endef

$(eval $(call BuildPackage,alsa-lib))
