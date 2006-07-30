# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=atftp
PKG_VERSION:=0.7
PKG_RELEASE:=1
PKG_MD5SUM:=3b27365772d918050b2251d98a9c7c82

PKG_SOURCE_URL:=ftp://ftp.mamalinux.com/pub/atftp/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/atftp
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libreadline +libpcre
  MENU:=1
  TITLE:=TFTP client
  DESCRIPTION:=TFTP client
  URL:=ftp://ftp.mamalinux.com/pub/atftp/
endef

define Package/atftpd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=atftp +libreadline +libpcre
  TITLE:=TFTP server
  DESCRIPTION:=TFTP server
  URL:=ftp://ftp.mamalinux.com/pub/atftp/
endef

define Package/atftpd/postinst
#!/bin/sh
grep -q '^tftp[[:space:]]*69/tcp' ${IPKG_INSTROOT}/etc/services 2>/dev/null
if [ $? -ne 0 ]; then
	echo "tftp            69/tcp" >>${IPKG_INSTROOT}/etc/services
	echo "tftp            69/udp" >>${IPKG_INSTROOT}/etc/services
	echo "tftp-mcast    1758/tcp" >>${IPKG_INSTROOT}/etc/services
	echo "tftp-mcast    1758/udp" >>${IPKG_INSTROOT}/etc/services
fi
endef

define Build/Configure
$(call Build/Configure/Default)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -Wall -D_REENTRANT" \
		DESTDIR=$(PKG_INSTALL_DIR) \
		all install
endef

define Package/atftp/install
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/sbin
endef

define Package/atftpd/install
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,atftp))
$(eval $(call BuildPackage,atftpd))
