#
# Copyright (C) 2013 Arduino SA
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=etheris-conf
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

DEPENDS:=+avahi-daemon +base-files

include $(INCLUDE_DIR)/package.mk

define Package/etheris-conf
  SECTION:=utils
  CATEGORY:=Base system
  TITLE:=Custom Etheris configurations
endef

define Package/etheris-conf/conffiles
/etc/avahi/services/arduino.service
endef

define Build/Compile
	# NOOP
endef

define Package/etheris-conf/install
	$(INSTALL_DIR) $(1)/etc/avahi/services
	$(INSTALL_DATA) ./files/arduino.service $(1)/etc/avahi/services/arduino.service
endef

define Package/etheris-conf/postinst
#!/bin/sh
rm "$${IPKG_INSTROOT}/etc/avahi/services/http.service"
rm "$${IPKG_INSTROOT}/etc/avahi/services/ssh.service"

sed -i "s/option hostname	OpenWrt/option hostname	Etheris/" "$${IPKG_INSTROOT}/etc/config/system"
sed -i "s/192.168.1.1/192.168.240.1/" "$${IPKG_INSTROOT}/etc/preinit"
sed -i "s/192.168.1.255/192.168.240.255/" "$${IPKG_INSTROOT}/etc/preinit"
endef

$(eval $(call BuildPackage,etheris-conf))

