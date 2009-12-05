# 
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libcelt
PKG_VERSION:=0.7.0
PKG_RELEASE:=1

PKG_SOURCE:=celt-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/celt-$(PKG_VERSION)
PKG_SOURCE_URL:=http://downloads.us.xiph.org/releases/celt/
PKG_MD5SUM:=0bb72abec367f4ef12551f79dda11b23
PKG_BUILD_DEPENDS:=libogg

include $(INCLUDE_DIR)/package.mk

define Package/libcelt
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=CELT Codec
  URL:=http://www.celt-codec.org/
endef

define Package/libcelt/description
 The CELT codec is an experimental audio codec for use in low-delay speech and audio communication.
endef

CONFIGURE_ARGS += \
	--without-ogg

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/celt
	$(CP)   $(PKG_INSTALL_DIR)/usr/include/celt/celt*.h \
		$(1)/usr/include/celt
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP)   $(PKG_INSTALL_DIR)/usr/lib/* \
		$(1)/usr/lib/
endef

define Package/libcelt/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcelt.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libcelt))
