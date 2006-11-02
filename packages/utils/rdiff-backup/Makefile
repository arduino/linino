#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $
 
include $(TOPDIR)/rules.mk

PKG_NAME:=rdiff-backup
PKG_VERSION:=1.0.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://savannah.nongnu.org/download/rdiff-backup/
PKG_MD5SUM:=756b38aaf2602d097cafd08996fb7887
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/rdiff-backup
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Incremental backup utility
  URL:=http://www.nongnu.org/rdiff-backup
  DEPENDS:=+librsync +python
endef

define Build/Configure
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR); \
		$(STAGING_DIR)/usr/bin/hostpython ./setup.py build --librsync-dir="$(STAGING_DIR)/usr" --lflags="-L$(STAGING_DIR)/usr/lib"; \
		$(STAGING_DIR)/usr/bin/hostpython ./setup.py install --prefix=$(PKG_INSTALL_DIR)/usr/; \
	);
endef

define Package/rdiff-backup/install
	mkdir -p $(1)/usr/{bin,lib}
	$(CP) $(PKG_INSTALL_DIR)/usr/{bin,lib} $(1)/usr/
endef

$(eval $(call BuildPackage,rdiff-backup))
