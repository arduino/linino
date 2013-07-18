#
# Copyright (c) 2013 Arduino LLC. All right reserved.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yun-conf
PKG_VERSION:=1.0.0
PKG_RELEASE:=2

include $(INCLUDE_DIR)/package.mk

define Package/yun-conf
  SECTION:=utils
  CATEGORY:=Base system
  TITLE:=Custom Yún configurations
  DEPENDS:=+avahi-daemon +base-files +triggerhappy
endef

define Package/yun-conf/conffiles
/etc/avahi/services/arduino.service
/etc/config/arduino
/etc/httpd.conf
endef

define Build/Compile
	# NOOP
endef

define Package/yun-conf/install
	$(INSTALL_DIR) $(1)/etc/avahi/services
	$(INSTALL_DIR) $(1)/etc/arduino
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/triggerhappy/triggers.d
	$(INSTALL_DIR) $(1)/etc/linino

	$(INSTALL_CONF) ./files/etc/avahi/services/arduino.service $(1)/etc/avahi/services/
	$(INSTALL_CONF) ./files/etc/triggerhappy/triggers.d/reset.conf $(1)/etc/triggerhappy/triggers.d
	$(INSTALL_CONF) ./files/etc/shadow $(1)/etc/shadow.1
	$(INSTALL_DATA) ./files/etc/banner $(1)/etc/

	$(INSTALL_CONF) ./files/etc/httpd.conf $(1)/etc/
	$(INSTALL_CONF) ./files/etc/config/arduino $(1)/etc/config/
	$(INSTALL_CONF) ./files/etc/config/firewall $(1)/etc/config/firewall.1
	#$(INSTALL_CONF) ./files/etc/config/dhcp $(1)/etc/config/dhcp.1

	$(INSTALL_DATA) ./files/etc/arduino/Caterina-Yun.hex $(1)/etc/arduino/
	$(INSTALL_CONF) ./files/etc/arduino/linino-arduino-release $(1)/etc/arduino/
	sed -i "s/DATE/`date`/g" $(1)/etc/arduino/linino-arduino-release
	$(INSTALL_CONF) ./files/etc/arduino/gpg_gen_key_batch $(1)/etc/arduino/
	$(INSTALL_DATA) ./files/etc/arduino/wifi_timezones.csv.gz $(1)/etc/arduino
	$(INSTALL_DATA) ./files/etc/arduino/wifi_error_statuses.csv.gz $(1)/etc/arduino
	$(INSTALL_DATA) ./files/etc/arduino/wifi_error_reasons.csv.gz $(1)/etc/arduino

	$(INSTALL_DATA) ./files/etc/linino/LININO_CONTRIBUTORS.TXT $(1)/etc/linino/
endef

define Package/yun-conf/postinst
#!/bin/sh -e
if [ -n "$${IPKG_INSTROOT}" ]; then
	#removing unconfigured services
	rm "$${IPKG_INSTROOT}/etc/avahi/services/http.service"

	#configuring firewall
	rm "$${IPKG_INSTROOT}/etc/config/firewall"
	mv "$${IPKG_INSTROOT}/etc/config/firewall.1" "$${IPKG_INSTROOT}/etc/config/firewall"

	#configuring dhcp/dnsmasq
	#rm "$${IPKG_INSTROOT}/etc/config/dhcp"
	#mv "$${IPKG_INSTROOT}/etc/config/dhcp.1" "$${IPKG_INSTROOT}/etc/config/dhcp"

	#setting hostname, ip address, and wifi ssid
	sed -i "s/option hostname	OpenWrt/option hostname	Arduino/" "$${IPKG_INSTROOT}/etc/config/system"
	sed -i "s/option ssid     Linino/option ssid     Arduino/" "$${IPKG_INSTROOT}/etc/config/wireless"
	sed -i "s/192.168.1.1/192.168.240.1/" "$${IPKG_INSTROOT}/lib/functions/uci-defaults.sh"
	sed -i "s/set network.lan.ifname/#set network.lan.ifname/" "$${IPKG_INSTROOT}/lib/functions/uci-defaults.sh"
	sed -i "s/set network.lan.type/#set network.lan.type/" "$${IPKG_INSTROOT}/lib/functions/uci-defaults.sh"
	sed -i "s/set network.wan.proto='dhcp'/set network.wan.proto='dhcp'\nset network.wan.metric='10'/" "$${IPKG_INSTROOT}/lib/functions/uci-defaults.sh"
	sed -i "s/\*wpa_supplicant\*/\*wpa_supplicant\*\|\*udhcpc\*/" "$${IPKG_INSTROOT}/lib/upgrade/common.sh"

	sed -i "s/option days		730/option days		36500/" "$${IPKG_INSTROOT}/etc/config/uhttpd"
	sed -i "s/option country		DE/option country		IT/" "$${IPKG_INSTROOT}/etc/config/uhttpd"
	sed -i "s/option state		Berlin/option state		Turin/" "$${IPKG_INSTROOT}/etc/config/uhttpd"
	sed -i "s/option location		Berlin/option location		Turin/" "$${IPKG_INSTROOT}/etc/config/uhttpd"
	sed -i "s/option commonname	OpenWrt/option commonname	'Arduino LLC'/" "$${IPKG_INSTROOT}/etc/config/uhttpd"
	sed -i "s/option rfc1918_filter 1/option rfc1918_filter 0/" "$${IPKG_INSTROOT}/etc/config/uhttpd"
	sed -i "s/option max_requests 3/option max_requests 2/" "$${IPKG_INSTROOT}/etc/config/uhttpd"

	#setting default root password
	cp "$${IPKG_INSTROOT}/etc/shadow" "$${IPKG_INSTROOT}/etc/shadow-"
	mv "$${IPKG_INSTROOT}/etc/shadow.1" "$${IPKG_INSTROOT}/etc/shadow"

	#adding boot time scripts
	sed -i "s/exit 0//" "$${IPKG_INSTROOT}/etc/rc.local"
	echo "wifi-live-or-reset" >> "$${IPKG_INSTROOT}/etc/rc.local"
	echo "exit 0" >> "$${IPKG_INSTROOT}/etc/rc.local"
fi
endef

$(eval $(call BuildPackage,yun-conf))
