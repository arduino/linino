#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=atftp
PKG_VERSION:=0.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.mirrorservice.org/sites/www.ibiblio.org/gentoo/distfiles/
PKG_MD5SUM:=3b27365772d918050b2251d98a9c7c82

PKG_BUILD_DEPENDS:=libncurses libpcre libreadline

include $(INCLUDE_DIR)/package.mk

define Package/atftp/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=TFTP
  SUBMENU:=File Transfer
endef

define Package/atftp
  $(call Package/atftp/Default)
  DEPENDS:=+libreadline +libncurses
  TITLE+= client
endef

define Package/atftpd
  $(call Package/atftp/Default)
  DEPENDS:=+libpcre +libpthread
  TITLE+= server
endef

define Package/atftpd/postinst
#!/bin/sh
grep -q '^tftp[[:space:]]*69/tcp' $${IPKG_INSTROOT}/etc/services 2>/dev/null
if [ $$? -ne 0 ]; then
	echo "tftp            69/tcp" >>$${IPKG_INSTROOT}/etc/services
	echo "tftp            69/udp" >>$${IPKG_INSTROOT}/etc/services
	echo "tftp-mcast    1758/tcp" >>$${IPKG_INSTROOT}/etc/services
	echo "tftp-mcast    1758/udp" >>$${IPKG_INSTROOT}/etc/services
fi
endef

CONFIGURE_ARGS += \
	--disable-libwrap 

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS) -Wall -D_REENTRANT" \
	all

define Package/atftp/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/atftp $(1)/usr/sbin/
endef

define Package/atftpd/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/atftpd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,atftp))
$(eval $(call BuildPackage,atftpd))
