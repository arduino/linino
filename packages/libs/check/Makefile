#
# Copyright (C) 2008-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=check
PKG_VERSION:=0.9.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/check
PKG_MD5SUM:=6f80cd4a24d14ad706117a7714222420
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL = 1

TARGET_CFLAGS += $(FPIC) \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include

TARGET_LDFLAGS += \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/check
  SECTION:=lib
  CATEGORY:=Libraries
  TITLE:=Unit testing framework for C
  URL:=http://check.sourceforge.net/
endef

define Package/check/description
  Check features a simple interface for defining unit tests, putting little in
  the way of the developer. Tests are run in a separate address space, so Check
  can catch both assertion failures and code errors that cause segmentation
  faults or other signals. The output from unit tests can be used within source
  code editors and IDEs.
endef

define Build/Configure
	$(CP) $(SCRIPT_DIR)/config.* $(PKG_BUILD_DIR)/build-aux/
	$(call Build/Configure/Default)
endef

define Build/Install
	$(call Build/Install/Default)
	cd $(PKG_INSTALL_DIR)/usr/lib/ ; ln -s libcheck.so libcheck_pic.so
endef

define Build/InstallDev
	mkdir -p $(1)
	cp -r $(PKG_INSTALL_DIR)/* $(1)
endef

define Package/check/install
	mkdir -p $(1)
	cp -r $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,check))
