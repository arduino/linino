#
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=quagga-unstable
PKG_VERSION:=0.99.16
PKG_RELEASE:=1

PKG_SOURCE:=quagga-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.quagga.net/download/ \
                http://www.de.quagga.net/download/ \
                http://www.uk.quagga.net/download/
PKG_MD5SUM:=350fb150be526cdfc4d2b093cb4d69a7

PKG_BUILD_DIR:=$(BUILD_DIR)/quagga-$(PKG_VERSION)

PKG_CONFIG_DEPENDS:= \
	CONFIG_PACKAGE_quagga-unstable-isisd \
	CONFIG_PACKAGE_quagga-unstable-ripngd

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/quagga-unstable/Default
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=quagga-unstable
  TITLE:=The Quagga Software Routing Suite
  URL:=http://www.quagga.net
endef

define Package/quagga-unstable
  $(call Package/quagga-unstable/Default)
  DEPENDS:= +librt
  MENU:=1
endef

define Package/quagga-unstable/description
  A routing software package that provides TCP/IP based routing services
  with routing protocols support such as RIPv1, RIPv2, RIPng, OSPFv2,
  OSPFv3, BGP-4, and BGP-4+
endef

define Package/quagga-unstable-libzebra
  $(call Package/quagga-unstable/Default)
  TITLE:=zebra library
endef

define Package/quagga-unstable-libospf
  $(call Package/quagga-unstable/Default)
  TITLE:=OSPF library
endef

define Package/quagga-unstable-bgpd
  $(call Package/quagga-unstable/Default)
  DEPENDS+= +quagga-unstable-libzebra
  TITLE:=BGPv4, BGPv4+, BGPv4- routing engine
endef

define Package/quagga-unstable-isisd
  $(call Package/quagga-unstable/Default)
  TITLE:=IS-IS routing engine
endef

define Package/quagga-unstable-ospfd
  $(call Package/quagga-unstable/Default)
  DEPENDS+= +quagga-unstable-libospf +quagga-unstable-libzebra
  TITLE:=OSPFv2 routing engine
endef

define Package/quagga-unstable-ospf6d
  $(call Package/quagga-unstable/Default)
  DEPENDS+= +quagga-unstable-libospf +quagga-unstable-libzebra @IPV6
  TITLE:=OSPFv3 routing engine
endef

define Package/quagga-unstable-ripd
  $(call Package/quagga-unstable/Default)
  DEPENDS+= +quagga-unstable-libzebra
  TITLE:=RIP routing engine
endef

define Package/quagga-unstable-ripngd
  $(call Package/quagga-unstable/Default)
  DEPENDS+= +quagga-unstable-libzebra @BROKEN
  TITLE:=RIPNG routing engine
endef

define Package/quagga-unstable-vtysh
  $(call Package/quagga-unstable/Default)
  DEPENDS+= quagga-unstable-libzebra +libreadline +libncurses
  TITLE:=integrated shell for Quagga routing software
endef

CONFIGURE_ARGS+= \
	--localstatedir=/var/run/quagga \
	--sysconfdir=/etc/quagga/ \
	--enable-shared \
	--disable-static \
	--enable-vtysh \
	--enable-user=quagga \
	--enable-group=quagga \
	--enable-pie=no \
	--enable-multipath=8 \

ifneq ($(CONFIG_PACKAGE_quagga-unstable-isisd),)
  CONFIGURE_ARGS+= --enable-isisd
endif

ifneq ($(CONFIG_PACKAGE_quagga-unstable-ripngd),)
  CONFIGURE_ARGS+= --enable-ripngd
endif

define Package/quagga-unstable/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/zebra $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/watchquagga $(1)/usr/sbin/
	# avoid /etc being set to 0750
	$(INSTALL_DIR) $(1)/etc/quagga
	chmod 0750 $(1)/etc/quagga
	$(INSTALL_DATA) ./files/quagga.conf $(1)/etc/quagga/zebra.conf
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/quagga $(1)/usr/sbin/quagga.init
	$(INSTALL_BIN) ./files/quagga.init $(1)/etc/init.d/quagga
endef

define Package/quagga-unstable/postinst
#!/bin/sh

name=quagga
id=51

# do not change below
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
	# create copies of passwd and group, if we use squashfs
	rootfs=`mount |awk '/root/ { print $$5 }'`
	if [ "$$rootfs" = "squashfs" ]; then
		if [ -h /etc/group ]; then
			rm /etc/group
			cp /rom/etc/group /etc/group
		fi
		if [ -h /etc/passwd ]; then
			rm /etc/passwd
			cp /rom/etc/passwd /etc/passwd
		fi
	fi
fi

echo ""
if [ -z "$$(grep ^\\$${name}: $${IPKG_INSTROOT}/etc/group)" ]; then
	echo "adding group $$name to /etc/group"
	echo "$${name}:x:$${id}:" >> $${IPKG_INSTROOT}/etc/group
fi

if [ -z "$$(grep ^\\$${name}: $${IPKG_INSTROOT}/etc/passwd)" ]; then
	echo "adding user $$name to /etc/passwd"
	echo "$${name}:x:$${id}:$${id}:$${name}:/tmp/.$${name}:/bin/false" >> $${IPKG_INSTROOT}/etc/passwd
fi

grep -q '^zebra[[:space:]]*2601/tcp' $${IPKG_INSTROOT}/etc/services 2>/dev/null
if [ $$? -ne 0 ]; then
echo "zebrasrv      2600/tcp" >>$${IPKG_INSTROOT}/etc/services
echo "zebra         2601/tcp" >>$${IPKG_INSTROOT}/etc/services
echo "ripd          2602/tcp" >>$${IPKG_INSTROOT}/etc/services
echo "ripngd        2603/tcp" >>$${IPKG_INSTROOT}/etc/services
echo "ospfd         2604/tcp" >>$${IPKG_INSTROOT}/etc/services
echo "bgpd          2605/tcp" >>$${IPKG_INSTROOT}/etc/services
echo "ospf6d        2606/tcp" >>$${IPKG_INSTROOT}/etc/services
echo "ospfapi       2607/tcp" >>$${IPKG_INSTROOT}/etc/services
echo "isisd         2608/tcp" >>$${IPKG_INSTROOT}/etc/services
fi
endef

define Package/quagga-unstable-bgpd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/bgpd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/quagga
	chmod 0750 $(1)/etc/quagga
	$(INSTALL_DATA) ./files/quagga.conf $(1)/etc/quagga/bgpd.conf
endef

define Package/quagga-unstable-isisd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/isisd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/quagga
	chmod 0750 $(1)/etc/quagga
	$(INSTALL_DATA) ./files/quagga.conf $(1)/etc/quagga/isisd.conf
endef

define Package/quagga-unstable-ospfd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/ospfd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/quagga
	chmod 0750 $(1)/etc/quagga
	$(INSTALL_DATA) ./files/quagga.conf $(1)/etc/quagga/ospfd.conf
endef

define Package/quagga-unstable-ospf6d/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/ospf6d $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/quagga
	chmod 0750 $(1)/etc/quagga
	$(INSTALL_DATA) ./files/quagga.conf $(1)/etc/quagga/ospf6d.conf
endef

define Package/quagga-unstable-ripd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/ripd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/quagga
	chmod 0750 $(1)/etc/quagga
	$(INSTALL_DATA) ./files/quagga.conf $(1)/etc/quagga/ripd.conf
endef

define Package/quagga-unstable-ripngd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/ripngd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/quagga
	chmod 0750 $(1)/etc/quagga
	$(INSTALL_DATA) ./files/quagga.conf $(1)/etc/quagga/ripngd.conf
endef

define Package/quagga-unstable-vtysh/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/vtysh $(1)/usr/bin/
endef

define Package/quagga-unstable-libospf/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libospf.so.* $(1)/usr/lib/
endef

define Package/quagga-unstable-libzebra/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libzebra.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,quagga-unstable))
$(eval $(call BuildPackage,quagga-unstable-libzebra))
$(eval $(call BuildPackage,quagga-unstable-libospf))
$(eval $(call BuildPackage,quagga-unstable-bgpd))
$(eval $(call BuildPackage,quagga-unstable-isisd))
$(eval $(call BuildPackage,quagga-unstable-ospfd))
$(eval $(call BuildPackage,quagga-unstable-ospf6d))
$(eval $(call BuildPackage,quagga-unstable-ripd))
$(eval $(call BuildPackage,quagga-unstable-ripngd))
$(eval $(call BuildPackage,quagga-unstable-vtysh))
