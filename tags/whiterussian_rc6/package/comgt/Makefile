# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=comgt
PKG_VERSION:=0.3
PKG_RELEASE:=1
PKG_MD5SUM:=70701fbed89df09826f73283e72c6a51

PKG_SOURCE_URL:=http://downloads.openwrt.org/sources/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(TOPDIR)/package/rules.mk

$(eval $(call PKG_template,COMGT,$(PKG_NAME),$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

$(PKG_BUILD_DIR)/.configured:
	touch $@

$(PKG_BUILD_DIR)/.built:
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		gcom
	touch $@

$(IPKG_COMGT):
	install -d -m0755 $(IDIR_COMGT)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/gcom $(IDIR_COMGT)/usr/bin/
	install -d -m0755 $(IDIR_COMGT)/etc/ppp
	install -m0755 ./files/wwan.connect $(IDIR_COMGT)/etc/ppp/wwan.connect
	install -d -m0755 $(IDIR_COMGT)/etc/chatscripts
	install -m0644 ./files/wwan.chat $(IDIR_COMGT)/etc/chatscripts/wwan.chat
	install -d -m0755 $(IDIR_COMGT)/etc/gcom
	install -m0644 ./files/setpin.gcom $(IDIR_COMGT)/etc/gcom/setpin.gcom
	install -m0644 ./files/setmode.gcom $(IDIR_COMGT)/etc/gcom/setmode.gcom
	install -m0644 ./files/getcardinfo.gcom $(IDIR_COMGT)/etc/gcom/getcardinfo.gcom
	install -m0644 ./files/getstrength.gcom $(IDIR_COMGT)/etc/gcom/getstrength.gcom
	install -d -m0755 $(IDIR_COMGT)/sbin
	install -m0755 ./files/ifup.wwan $(IDIR_COMGT)/sbin/
	install -m0755 ./files/ifdown.wwan $(IDIR_COMGT)/sbin/
	install -d -m0755 $(IDIR_COMGT)/etc/hotplug.d/iface
	install -m0644 ./files/wwan.iface $(IDIR_COMGT)/etc/hotplug.d/iface/05-wwan
	install -d -m0755 $(IDIR_COMGT)/etc/hotplug.d/button
	install -m0644 ./files/wwan.button $(IDIR_COMGT)/etc/hotplug.d/button/01-wwan
	$(RSTRIP) $(IDIR_COMGT)
	$(IPKG_BUILD) $(IDIR_COMGT) $(PACKAGE_DIR)

