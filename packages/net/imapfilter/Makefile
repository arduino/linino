# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=imapfilter
PKG_VERSION:=1.2.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://imapfilter.hellug.gr/source/
PKG_MD5SUM:=4c1f28dffbb727a4769948f10baccd79
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/imapfilter
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+liblua +libopenssl
  TITLE:=IMAP server based email filtering
  URL:=http://imapfilter.hellug.gr/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		./configure \
			-d /usr \
	);
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		INCDIRS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LIBDIRS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		MYCFLAGS="$(TARGET_CFLAGS)"
endef

define Package/imapfilter/conffiles
/etc/imapfilter/config.lua
endef

define Package/imapfilter/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/imapfilter $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/imapfilter
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/sample.config.lua $(1)/etc/imapfilter/config.lua
	$(INSTALL_DIR) $(1)/usr/share/imapfilter
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/interface.lua $(1)/usr/share/imapfilter/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/auxiliary.lua $(1)/usr/share/imapfilter/
endef

$(eval $(call BuildPackage,imapfilter))
