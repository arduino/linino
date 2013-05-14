#
# Copyright (c) 2013 Arduino LLC. All right reserved.
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
#PKG_MD5SUM:=58133f3bb176ca54cfab7432fe22517c

DEPENDS:=+python-mini

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
	$(INSTALL_DIR) $(1)/www/webpanel/views
	$(INSTALL_DIR) $(1)/usr/lib/python2.7/lib-dynload
	$(INSTALL_DIR) $(1)/usr/lib/python2.7/wsgiref

	$(CP) $(PKG_BUILD_DIR)/{bottle,conf,main}.py* $(1)/www/webpanel/
	$(CP) $(PKG_BUILD_DIR)/views/* $(1)/www/webpanel/views/

	$(CP) $(PKG_BUILD_DIR)/*.py* $(1)/usr/lib/python2.7/
	$(RM) $(1)/usr/lib/python2.7/{bottle,conf,main}.py*
	$(CP) $(PKG_BUILD_DIR)/wsgiref/* $(1)/usr/lib/python2.7/wsgiref/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/datetime.so $(1)/usr/lib/python2.7/lib-dynload/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cPickle.so $(1)/usr/lib/python2.7/lib-dynload/
endef

$(eval $(call BuildPackage,webpanel))
