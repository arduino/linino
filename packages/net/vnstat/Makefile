#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=vnstat
PKG_VERSION:=1.6
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://humdi.net/vnstat
PKG_MD5SUM:=ccaffe8e70d47e0cf2f25e52daa25712

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/vnstat
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Console-based network traffic monitor
  URL:=http://humdi.net/vnstat/
endef

define Package/vnstat/description
	vnStat is a network traffic monitor for Linux that keeps a log of daily 
	network traffic for the selected interface(s). vnStat isn't a packet 
	sniffer. The traffic information is analyzed from the /proc -filesystem, 
	so vnStat can be used without root permissions.
endef

define Package/vnstat/conffiles
/etc/config/vnstat
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)"
endef

define Package/vnstat/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/vnstat $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/vnstat.conf $(1)/etc/config/vnstat
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/vnstat.init $(1)/etc/init.d/vnstat
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
[ $$? -ne 0 ] && echo "*/30 * * * *   root    if [ -x $$BIN_REL ] && [ \`ls $$LIB_D_REL | wc -l\` -ge 1 ]; then $$BIN_REL -u; fi" >> $$CRONTAB
true
endef

$(eval $(call BuildPackage,vnstat))
