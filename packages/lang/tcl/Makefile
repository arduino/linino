# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=tcl
PKG_VERSION:=8.4.19
PKG_RELEASE:=1

PKG_SOURCE:=tcl$(PKG_VERSION)-src.tar.gz
PKG_SOURCE_URL:=@SF/tcl
PKG_MD5SUM:=ade2c033a7b545ee108f3fdfeb629fcf

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/tcl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=TCL Lang
  URL:=http://www.tcl.tk
endef

define Package/tcl/description
	TCL Scripting Language
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR)/unix; \
	autoconf configure.in > configure; \
	sed -i.bak "s/relid'/relid/" configure; \
	$(TARGET_CONFIGURE_OPTS) \
	./configure \
		--build=$(GNU_HOST_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--prefix=/usr \
		--enable-gcc \
		--enable-threads \
		--disable-nls \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/unix \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/*.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtcl*.{a,so*} $(1)/usr/lib/
endef


define Package/tcl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin
endef

$(eval $(call BuildPackage,tcl))
