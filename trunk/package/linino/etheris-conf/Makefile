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
endef

define Package/etheris-conf/postinst
#!/bin/sh
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

	#setting default root password
	cp "$${IPKG_INSTROOT}/etc/shadow" "$${IPKG_INSTROOT}/etc/shadow-"
	mv "$${IPKG_INSTROOT}/etc/shadow.1" "$${IPKG_INSTROOT}/etc/shadow"

	#adding boot time scripts
	sed -i "s/exit 0//" "$${IPKG_INSTROOT}/etc/rc.local"
	echo "reset-to-factory && reboot" >> "$${IPKG_INSTROOT}/etc/rc.local"
	echo "wifi-live-or-reset" >> "$${IPKG_INSTROOT}/etc/rc.local"
	echo "cd /www/webpanel/ && python -B main.py &" >> "$${IPKG_INSTROOT}/etc/rc.local"
	echo "exit 0" >> "$${IPKG_INSTROOT}/etc/rc.local"

	#precompiling system python
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/StringIO.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/UserDict.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/__future__.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/_abcoll.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/_weakrefset.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/abc.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/bisect.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/codecs.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/collections.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/copy_reg.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/fnmatch.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/functools.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/genericpath.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/hashlib.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/heapq.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/keyword.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/linecache.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/os.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/pickle.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/posixpath.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/random.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/re.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/site.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/socket.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/sre_compile.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/sre_constants.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/sre_parse.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/stat.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/string.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/struct.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/subprocess.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/sysconfig.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/tempfile.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/traceback.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/types.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/warnings.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/encodings/aliases.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/encodings/ascii.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/encodings/utf_8.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/encodings/__init__.py"
	python -OO -m compileall "$${IPKG_INSTROOT}/usr/lib/python2.7/site-packages/json.py"
fi
endef

$(eval $(call BuildPackage,etheris-conf))

