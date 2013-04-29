#
# Copyright (C) 2013 Arduino SA
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=webpanel
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://downloads.arduino.cc/
PKG_MD5SUM:=c5991e22143c305ef21e8e24757b34f6

DEPENDS:=+python

include $(INCLUDE_DIR)/package.mk

define Package/webpanel
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Web Control Panel
endef

define Package/webpanel/description
 Web Control Panel lets you configure the board
endef

define Build/Compile
	# NOOP
endef

define Package/webpanel/install
	$(INSTALL_DIR) $(1)/www
	$(INSTALL_DIR) $(1)/www/webpanel
	$(INSTALL_DIR) $(1)/www/webpanel/views
	$(CP) $(PKG_BUILD_DIR)/*.py* $(1)/www/webpanel/
	$(CP) $(PKG_BUILD_DIR)/views/* $(1)/www/webpanel/views/
endef

$(eval $(call BuildPackage,webpanel))
