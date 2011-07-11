#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=libpciaccess
PKG_NAME:=libpciaccess
PKG_RELEASE:=1
PKG_VERSION:=0.10.9

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/individual/lib/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Xorg/$(PKG_NAME)-$(PKG_VERSION)/
PKG_MD5SUM:=685cb20e7a6165bc010972f1183addbd

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk


define Package/libpciaccess
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  DEPENDS:=+pciutils
  TITLE:=libpciaccess
  URL:=http://xorg.freedesktop.org/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-pciids-path=/usr/share/pci.ids \
		, \
		ac_cv_file__usr_include_asm_mtrr_h=$(shell \
		test -f "$(TOOLCHAIN_DIR)/include/asm/mtrr.h" \
			&& echo "yes" \
			|| echo "no") \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/*.h \
		$(1)/usr/include

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libpciaccess.{so*,a,la} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libpciaccess/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libpciaccess.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libpciaccess))
