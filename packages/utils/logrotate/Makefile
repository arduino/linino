# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=logrotate
PKG_VERSION:=3.7.1
PKG_RELEASE:=1
PKG_MD5SUM:=552639142e163745f6bcd4f1f3816d8a

PKG_SOURCE_URL:=http://ftp.debian.org/debian/pool/main/l/logrotate
PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_CAT:=zcat
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/logrotate
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libpopt
  TITLE:=rotates, compresses, and mails system logs
  DESCRIPTION:=logrotate  is  designed to ease administration of systems that generate\\\
large numbers of log files.  It allows auto-matic rotation, compression,\\\
removal, and mailing of log files. Each  log  file  may  be  handled\\\
daily,  weekly,monthly, or when it grows too large.\\\
  URL:=http://packages.debian.org/unstable/admin/logrotate
endef

define Package/logrotate/conffiles
/etc/logrotate.conf
endef

define Build/Compile
	make -C ${PKG_BUILD_DIR} \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
		CC=$(TARGET_CC) logrotate
endef

define Package/logrotate/install	
	mkdir -p $(1)/usr/sbin
	$(CP) ${PKG_BUILD_DIR}/logrotate $(1)/usr/sbin
	mkdir -p $(1)/etc/logrotate.d
	$(CP) ./files/logrotate.conf $(1)/etc
endef

$(eval $(call BuildPackage,logrotate))
