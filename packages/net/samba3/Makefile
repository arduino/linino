#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=samba3
PKG_VERSION:=3.0.24
PKG_RELEASE:=1
#PKG_MD5SUM:=b51b2975f21006f85f7297f3fb1acde1

PKG_SOURCE_URL:=ftp://ftp.samba.org/pub/samba/old-versions/
PKG_SOURCE:=samba-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/samba-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS+=$(if $(CONFIG_SAMBA3_DEBUG),-DSAMBA_DEBUG)

define Package/samba3
  SECTION:=net
  CATEGORY:=Network
  TITLE:=samba3
  DEPENDS:=+libpthread
  URL:=http://www.samba.org/
endef

define Package/samba3/Description
  Samba3 - made small with patches taken from AVM GPL releases and freetz 
endef

define Package/samba3/config
	source "$(SOURCE)/Config.in"
endef

define Build/Compile
	CFLAGS="$(TARGET_CFLAGS) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE" \
	CC="$(TARGET_CC)" \
	CPPFLAGS="$(TARGET_CPPFLAGS) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE" \
	LDFLAGS="$(TARGET_LDFLAGS)" \
		$(MAKE) -C $(PKG_BUILD_DIR)/source \
			all bin/smbpasswd	
endef

define Package/samba3/install
	$(INSTALL_DIR) $(1)/etc/{samba,init.d,config}
	$(INSTALL_BIN) ./files/samba.init $(1)/etc/init.d/samba
	$(INSTALL_DATA) ./files/samba.config $(1)/etc/config/samba
	$(INSTALL_DATA) ./files/smb.conf.template $(1)/etc/samba/
	cd $(1)/etc/samba; rm -r smb.conf; ln -s /tmp/smb.conf
	touch $(1)/etc/samba/smbpasswd
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/bin/smbpasswd $(1)/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/bin/smbd $(1)/bin/
endef

$(eval $(call BuildPackage,samba3))
