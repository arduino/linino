# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=gcom
PKG_VERSION:=0.3
PKG_RELEASE:=1
PKG_MD5SUM:=f9bc8fde70278f1e990c705ccf2ae700

PKG_SOURCE_URL:=http://downloads.openwrt.org/sources/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(TOPDIR)/package/rules.mk

$(eval $(call PKG_template,GCOM,$(PKG_NAME),$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

$(PKG_BUILD_DIR)/.configured:
	touch $@

$(PKG_BUILD_DIR)/.built:
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		gcom
	touch $@

$(IPKG_GCOM):
	install -d -m0755 $(IDIR_GCOM)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/gcom $(IDIR_GCOM)/usr/bin/
	install -d -m0755 $(IDIR_GCOM)/etc/gcom
	install -m0644 ./files/setpin.gcom $(IDIR_GCOM)/etc/gcom/setpin.gcom
	install -m0644 ./files/setmode.gcom $(IDIR_GCOM)/etc/gcom/setmode.gcom
	install -m0644 ./files/getcardinfo.gcom $(IDIR_GCOM)/etc/gcom/getcardinfo.gcom
	install -m0644 ./files/getstrength.gcom $(IDIR_GCOM)/etc/gcom/getstrength.gcom
	$(RSTRIP) $(IDIR_GCOM)
	$(IPKG_BUILD) $(IDIR_GCOM) $(PACKAGE_DIR)

