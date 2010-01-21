#
# Copyright (C) 2008-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tor
PKG_VERSION:=0.2.1.22
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.torproject.org/dist
PKG_MD5SUM:=583501a989ed0c39e209b604c3671ecd

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/tor
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libevent +libopenssl +libpthread
  TITLE:=An anonymous Internet communication system
  URL:=http://www.torproject.org/
endef

define Package/tor/description
 Tor is a toolset for a wide range of organizations and people that want to
 improve their safety and security on the Internet. Using Tor can help you
 anonymize web browsing and publishing, instant messaging, IRC, SSH, and
 more. Tor also provides a platform on which software developers can build
 new applications with built-in anonymity, safety, and privacy features.
endef

define Package/tor/conffiles
/etc/tor/torrc
endef

define Package/tor/postinst
#!/bin/sh

name=tor
id=52

# do not change below
# # check if we are on real system
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
endef

CONFIGURE_ARGS += \
	--with-libevent-dir="$(STAGING_DIR)/usr" \
	--with-ssl-dir="$(STAGING_DIR)/usr" \

CONFIGURE_VARS += \
	CROSS_COMPILE="yes" \

# pass CFLAGS again to override -O2 set by configure
MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)" \

define Package/tor/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/tor $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/tor.init $(1)/etc/init.d/tor
	$(INSTALL_DIR) $(1)/etc/tor
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/tor/torrc.sample $(1)/etc/tor/torrc
endef

$(eval $(call BuildPackage,tor))
