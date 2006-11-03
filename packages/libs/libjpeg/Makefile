# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=jpeg
PKG_VERSION:=6b
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)src.v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.ijg.org/files/ \
        ftp://ftp.uu.net/graphics/jpeg/
PKG_MD5SUM:=dbd5f3b47ed13132f04c685d608a7547
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

PKG_BUILDDEP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/jpeg/Default
  TITLE:=The Independent JPEG Group's JPEG
  URL:=http://www.ijg.org/
endef

define Package/libjpeg
  $(call Package/jpeg/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= runtime library
endef

define Package/jpeg-tools
  $(call Package/jpeg/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libjpeg
  TITLE+= manipulation tools
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	# replace the old upstream libtool stuff with our own
	ln -sf $(STAGING_DIR)/usr/bin/libtool $(PKG_BUILD_DIR)/
	ln -sf $(STAGING_DIR)/usr/share/libtool/config.guess $(PKG_BUILD_DIR)/
	ln -sf /bin/true $(PKG_BUILD_DIR)/ltconfig
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)/usr/{include,lib,bin,man/man1}
	$(MAKE) -C $(PKG_BUILD_DIR) \
		prefix="$(PKG_INSTALL_DIR)/usr" \
		exec_prefix="$(PKG_INSTALL_DIR)/usr" \
		all install-headers install-lib install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/jpeglib.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/jpegint.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/j{config,error,morecfg}.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libjpeg.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/jpeg{int,lib}.h \
		$(STAGING_DIR)/usr/include/j{config,error,morecfg}.h \
		$(STAGING_DIR)/usr/lib/libjpeg.{a,so*}
endef

define Package/libjpeg/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libjpeg.so.* $(1)/usr/lib/
endef

define Package/jpeg-tools/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/*jpeg* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,libjpeg))
$(eval $(call BuildPackage,jpeg-tools))
