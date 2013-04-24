#
# Copyright (C) 2013 Arduino SA
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=avahi-arduino
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

DEPENDS:=+avahi-daemon

include $(INCLUDE_DIR)/package.mk

define Package/avahi-arduino
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=IP Addresses and Names
  TITLE:=A custom avahi configuration
endef

define Package/avahi-arduino/conffiles
/etc/avahi/services/arduino.service
endef

define Build/Compile
	# NOOP
endef

define Package/avahi-arduino/install
	$(INSTALL_DIR) $(1)/etc/avahi/services
	$(INSTALL_DATA) ./files/arduino.service $(1)/etc/avahi/services/arduino.service
endef

define Package/avahi-arduino/postinst
	rm "$${IPKG_INSTROOT}/etc/avahi/services/http.service"
	rm "$${IPKG_INSTROOT}/etc/avahi/services/ssh.service"
endef

$(eval $(call BuildPackage,avahi-arduino))

