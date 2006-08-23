#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=tor
PKG_VERSION:=0.1.0.17
PKG_RELEASE:=1
PKG_MD5SUM:=83c4afe29fa82473afcb2ec7e17771b9

PKG_SOURCE_URL:=http://tor.eff.org/dist/ \
	http://ftp.se.linux.org/crypto/tor/ \
	http://tor.meulie.net/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/tor
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libevent +libopenssl +libpthread +zlib
  TITLE:=An anonymous Internet communication system
  DESCRIPTION:=Tor is a toolset for a wide range of organizations and people that want\\\
  to improve their safety and security on the Internet. Using Tor can\\\
  help you anonymize web browsing and publishing, instant messaging,\\\
  IRC, SSH, and more. Tor also provides a platform on which software\\\
  developers can build new applications with built-in anonymity, safety,\\\
  and privacy features.\\\
  URL:=http://tor.eff.org/
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
# if [ -z "$${IPKG_INSTROOT}" ]; then
#         # create copies of passwd and group, if we use squashfs
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
        echo "$${name}:x:$${id}:" >> ${IPKG_INSTROOT}/etc/group
fi

if [ -z "$$(grep ^\\$${name}: $${IPKG_INSTROOT}/etc/passwd)" ]; then
        echo "adding user $name to /etc/passwd"
        echo "$${name}:x:$${id}:$${id}:$${name}:/tmp/.$${name}:/bin/false" >> $${IPKG_INSTROOT}/etc/passwd
fi
endef

define Build/Configure
$(call Build/Configure/Default,--enable-shared \
                  --disable-static,ac_cv_libevent_normal=yes \
		ac_cv_openssldir="$(STAGING_DIR)/usr" \
		tor_cv_null_is_zero=yes \
		tor_cv_unaligned_ok=yes)
endef

define Build/Compile
$(call Build/Compile/Default,DESTDIR="$(PKG_INSTALL_DIR)" \
		all install)
endef

define Package/tor/install	
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/tor.init $(1)/etc/init.d/tor
	install -d -m0755 $(1)/etc/tor
	install -m0644 ./files/torrc $(1)/etc/tor/torrc
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/tor $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,tor))

