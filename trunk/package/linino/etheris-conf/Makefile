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

DEPENDS:=+avahi-daemon +base-files +webpanel

include $(INCLUDE_DIR)/package.mk

define Package/etheris-conf
  SECTION:=utils
  CATEGORY:=Base system
  TITLE:=Custom Etheris configurations
endef

define Package/etheris-conf/conffiles
/etc/config/arduino
/etc/avahi/services/arduino.service
/etc/arduino/ssl_certificate.pem
endef

define Build/Compile
	./create_certificate.sh $(PKG_BUILD_DIR)/ssl_certificate.pem
endef

define Package/etheris-conf/install
	$(INSTALL_DIR) $(1)/etc/avahi/services
	$(INSTALL_DIR) $(1)/etc/arduino
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/etc/avahi/services/arduino.service $(1)/etc/avahi/services/
	$(INSTALL_CONF) ./files/etc/config/arduino $(1)/etc/config/
	$(INSTALL_CONF) ./files/etc/config/firewall $(1)/etc/config/firewall.1
	$(INSTALL_CONF) ./files/etc/shadow $(1)/etc/shadow.1
	$(INSTALL_DATA) ./files/etc/arduino/Caterina-Etheris.hex $(1)/etc/arduino/
	$(INSTALL_DATA) ./files/etc/arduino/optiboot_atmega328.hex $(1)/etc/arduino/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/ssl_certificate.pem $(1)/etc/arduino/
	$(INSTALL_DATA) ./files/etc/banner $(1)/etc/
endef

define Package/etheris-conf/postinst
#!/bin/sh -e
if [ -n "$${IPKG_INSTROOT}" ]; then
	#removing unconfigured services
	rm "$${IPKG_INSTROOT}/etc/avahi/services/http.service"

	#configuring firewall
	rm "$${IPKG_INSTROOT}/etc/config/firewall"
	mv "$${IPKG_INSTROOT}/etc/config/firewall.1" "$${IPKG_INSTROOT}/etc/config/firewall"

	#setting hostname, ip address, and wifi ssid
	sed -i "s/option hostname	OpenWrt/option hostname	Arduino/" "$${IPKG_INSTROOT}/etc/config/system"
	sed -i "s/option ssid     Linino/option ssid     Arduino/" "$${IPKG_INSTROOT}/etc/config/wireless"
	sed -i "s/192.168.1.1/192.168.240.1/" "$${IPKG_INSTROOT}/lib/functions/uci-defaults.sh"
	sed -i "s/\*wpa_supplicant\*/\*wpa_supplicant\*\|\*udhcpc\*/" "$${IPKG_INSTROOT}/lib/upgrade/common.sh"

	#setting default root password
	cp "$${IPKG_INSTROOT}/etc/shadow" "$${IPKG_INSTROOT}/etc/shadow-"
	mv "$${IPKG_INSTROOT}/etc/shadow.1" "$${IPKG_INSTROOT}/etc/shadow"

	#adding boot time scripts
	sed -i "s/exit 0//" "$${IPKG_INSTROOT}/etc/rc.local"
	echo "reset-to-factory && reboot" >> "$${IPKG_INSTROOT}/etc/rc.local"
	echo "wifi-live-or-reset" >> "$${IPKG_INSTROOT}/etc/rc.local"
	echo "cd /www/webpanel/ && exec python -B main.py &" >> "$${IPKG_INSTROOT}/etc/rc.local"
	echo "exit 0" >> "$${IPKG_INSTROOT}/etc/rc.local"
fi
endef

$(eval $(call BuildPackage,etheris-conf))

