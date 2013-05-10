#
# Copyright (C) 2013 Arduino SA
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=etheris-scripts
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/etheris-scripts
  SECTION:=utils
  CATEGORY:=Base system
  TITLE:=Custom Etheris scripts
endef

define Build/Compile
	# NOOP
endef

define Package/etheris-scripts/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) ./files/usr/bin/blink-start $(1)/usr/bin/
	$(INSTALL_BIN) ./files/usr/bin/blink-stop $(1)/usr/bin/
	$(INSTALL_BIN) ./files/usr/bin/update-file-available $(1)/usr/bin/
	$(INSTALL_BIN) ./files/usr/bin/run-sysupgrade $(1)/usr/bin/
	$(INSTALL_BIN) ./files/usr/bin/wifi-live-or-reset $(1)/usr/bin/
	$(INSTALL_BIN) ./files/usr/bin/wifi-reset-and-reboot $(1)/usr/bin/
	$(INSTALL_BIN) ./files/usr/bin/reset-to-factory $(1)/usr/bin/
endef

$(eval $(call BuildPackage,etheris-scripts))

