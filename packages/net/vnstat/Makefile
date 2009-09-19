#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vnstat
PKG_VERSION:=1.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://humdi.net/vnstat
PKG_MD5SUM:=ebaf8352fa3674faea2fe2ce1001a38d

include $(INCLUDE_DIR)/package.mk

define Package/vnstat/Default
  SECTION:=net
  CATEGORY:=Network
  URL:=http://humdi.net/vnstat/
endef

define Package/vnstat
$(call Package/vnstat/Default)
  TITLE:=Console-based network traffic monitor
endef

define Package/vnstat/description
	vnStat is a network traffic monitor for Linux that keeps a log of daily
	network traffic for the selected interface(s). vnStat isn't a packet
	sniffer. The traffic information is analyzed from the /proc -filesystem,
	so vnStat can be used without root permissions.
endef

define Package/vnstati
$(call Package/vnstat/Default)
  DEPENDS+=vnstat +libgd
  TITLE:=PNG image output support for vnStat
endef

define Package/vnstati/description
	The purpose of vnstati is to provide image output support for statistics
	collected using vnstat(1). However, the image file format is limited to
	png. All basic outputs of vnStat are supported excluding live traffic
	features. The image can be outputted either to a file or to standard
	output.
endef

define Package/vnstat/conffiles
/etc/vnstat.conf
/etc/config/vnstat
endef

define Build/Compile/vnstat
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)"
endef

define Build/Compile/vnstati
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
		LDFLAGS="$(TARGET_LDFLAGS) -Wl,-rpath-link,$(STAGING_DIR)/usr/lib" \
		all
endef

define Build/Compile
$(call Build/Compile/vnstat)
$(call Build/Compile/vnstati)
endef

define Package/vnstat/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/vnstat $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/vnstatd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/cfg/vnstat.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/vnstat-uci.conf $(1)/etc/config/vnstat
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/vnstat.init $(1)/etc/init.d/vnstat
endef

define Package/vnstati/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/vnstati $(1)/usr/bin/
endef

define Package/vnstat/postinst
#!/bin/sh
BIN_REL=/usr/bin/vnstat
BIN=$${IPKG_INSTROOT}$${BIN_REL}
CRONTAB=$${IPKG_INSTROOT}/etc/crontabs/root
LIB_D_REL=/var/lib/vnstat
LIB_D=$${IPKG_INSTROOT}$${LIB_D_REL}
mkdir -p $${IPKG_INSTROOT}/etc/crontabs/
[ -d $$LIB_D ] || mkdir -p $$LIB_D
IFACE_WAN=$$(uci get network.wan.ifname)
if [ -n $$IFACE_WAN ]; then
	[ -e $$LIB_D/$$IFACE_WAN ] || ( [ -x $$BIN ] && $$BIN -u -i $$IFACE_WAN )
fi
grep -q "$$BIN_REL -u" $$CRONTAB 2>/dev/null
[ $$? -eq 0 ] && sed -i -e "/\/usr\/bin\/vnstat -u/d" $$CRONTAB
true
endef

$(eval $(call BuildPackage,vnstat))
$(eval $(call BuildPackage,vnstati))
