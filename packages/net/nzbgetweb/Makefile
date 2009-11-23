#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nzbgetweb
PKG_VERSION:=1.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).zip
PKG_SOURCE_URL:=@SF/nzbget
PKG_MD5SUM:=ef342e75ff5796eab42fb3462ff4592d

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/nzbgetweb

include $(INCLUDE_DIR)/package.mk

define Package/nzbgetweb
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+nzbget +php5-cgi +php5-mod-session +php5-mod-gd +php5-mod-xml
  URL:=http://nzbget.sourceforge.net/
  TITLE:=Web interface for nzbget
endef

define Package/nzbgetweb/description
Web interface for nzbget.
endef

define Build/Compile
endef

define Package/nzbgetweb/install
	$(INSTALL_DIR) $(1)/www/nzbgetweb
	$(CP) $(PKG_BUILD_DIR)/*.php $(1)/www/nzbgetweb/
	$(CP) $(PKG_BUILD_DIR)/*.css $(1)/www/nzbgetweb/	
	$(CP) $(PKG_BUILD_DIR)/README $(1)/www/nzbgetweb/
	$(CP) $(PKG_BUILD_DIR)/ChangeLog $(1)/www/nzbgetweb/
	$(CP) $(PKG_BUILD_DIR)/images $(1)/www/nzbgetweb/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/httpd.conf /etc/httpd,conf
endef

$(eval $(call BuildPackage,nzbgetweb))
