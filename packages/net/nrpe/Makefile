#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nrpe
PKG_VERSION:=2.8.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/nagios
PKG_MD5SUM:=

include $(INCLUDE_DIR)/package.mk

define Package/nrpe
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl
  TITLE:=Daemon to execute Nagios check commands on remote hosts
  URL:=http://www.nagios.org/download
endef

define Package/nrpe/description
 NOTE: several assumptions are made:
 1) As openssl is used to generate some stuff during "configure" it is 
 assumed that openssl is installed on compiling PC in its default
 location (i.e. accessible as /usr/bin/openssl).
 2) "nagios" user and group should exist on your openwrt installation.
endef

define Package/nrpe/postinst
#!/bin/sh

id=50
name=nagios
home=/var/run/nagios
shell=/bin/false

# do not change below
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
        # create copies of passwd and group, if we use squashfs
        rootfs=`mount |awk '/root/ { print $$5 }'`
        if [ "$$rootfs" = "squashfs" ]; then
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
if [ -z "$$(grep ^\\$${name}: $${IPKG_INSTROOT}/etc/group)" ]; then
        echo "adding group $$name to /etc/group"
        echo "$${name}:x:$${id}:" >> $${IPKG_INSTROOT}/etc/group
fi
if [ -z "$$(grep ^\\$${name}: $${IPKG_INSTROOT}/etc/passwd)" ]; then
        echo "adding user $$name to /etc/passwd"
        echo "$${name}:x:$${id}:$${id}:$${name}:$${home}:$${shell}" >> $${IPKG_INSTROOT}/etc/passwd
fi
endef

CONFIGURE_ARGS += \
	--with-ssl="$(STAGING_DIR)/usr" \

define Package/nrpe/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DATA) ./files/nrpe.cfg $(1)/etc/nrpe.cfg
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/nrpe $(1)/usr/sbin
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
endef

$(eval $(call BuildPackage,nrpe))
