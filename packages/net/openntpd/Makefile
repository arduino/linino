#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=openntpd
PKG_VERSION:=3.7p1
PKG_RELEASE:=1
PKG_MD5SUM:=10ed8eefd760e5819efcf3277b118f47

# space separated list or special @SF for sourceforge projects
PKG_SOURCE_URL:=ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD/ \
	ftp://ftp.de.openbsd.org/pub/unix/OpenBSD/OpenNTPD/ \
	ftp://ftp.fr.openbsd.org/pub/OpenBSD/OpenNTPD/ \
	ftp://ftp.sunet.se/pub/OpenBSD/OpenNTPD/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/openntpd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A free and easy to use NTP (Network Time Protocol) implementation
  DESCRIPTION:=NTP server
  URL:=http://www.openntpd.org/
endef

define Package/openntpd/conffiles
/etc/ntpd.conf
endef

define Package/openntpd/postinst
#!/bin/sh

name=ntp
id=50

# do not change below
# check if we are on real system
if [ -z "${IPKG_INSTROOT}" ]; then
        # create copies of passwd and group, if we use squashfs
        rootfs=`mount |awk '/root/ { print $5 }'`
        if [ "$rootfs" = "squashfs" ]; then
                if [ -h /etc/group ]; then
                        rm /etc/group
                        cp -p /rom/etc/group /etc/group
                fi
                if [ -h /etc/passwd ]; then
                        rm /etc/passwd
                        cp -p /rom/etc/passwd /etc/passwd
                fi
        fi
fi

echo ""
if [ -z "$(grep ^\\${name}: ${IPKG_INSTROOT}/etc/group)" ]; then
        echo "adding group $name to /etc/group"
        echo "${name}:x:${id}:" >> ${IPKG_INSTROOT}/etc/group
fi
if [ -z "$(grep ^\\${name}: ${IPKG_INSTROOT}/etc/passwd)" ]; then
        echo "adding user $name to /etc/passwd"
        echo "${name}:x:${id}:${id}:${name}:/tmp/.${name}:/bin/false" >> ${IPKG_INSTROOT}/etc/passwd
fi

grep -q '^ntp[[:space:]]*123/udp' ${IPKG_INSTROOT}/etc/services 2>/dev/null
[ $? -ne 0 ] && echo "ntp       123/udp" >>${IPKG_INSTROOT}/etc/services
endef

define Build/Configure
$(call Build/Configure/Default, --with-builtin-arc4random \
		--with-privsep-user=ntp \
		--with-adjtimex)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -DUSE_ADJTIMEX"
endef

define Package/openntpd/install	
	install -d -m0755 $(1)/etc
	install -m0644 ./files/ntpd.conf $(1)/etc/
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/ntpd.init $(1)/etc/init.d/S55ntpd
	install -d -m0755 $(1)/usr/sbin/
	install -m0755 $(PKG_BUILD_DIR)/ntpd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,openntpd))
