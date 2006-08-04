# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=autossh
PKG_VERSION:=1.3
PKG_RELEASE:=1
PKG_MD5SUM:=0e7ec62eeca5d1b197f3ef2d0f0d417f

PKG_SOURCE_URL:=http://www.harding.motd.ca/autossh
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/autossh
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+openssh-client
  TITLE:=Autossh client
  DESCRIPTION:=Autossh client
  URL:=http://www.harding.motd.ca/autossh
endef

define Build/Configure
$(CP) $(PKG_BUILD_DIR)/Makefile.linux $(PKG_BUILD_DIR)/Makefile
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -Wall -D\"SSH_PATH=\\\"$(SSH)\\\"\" -D\"VER=\\\"$(PKG_VERSION)\\\"\"" \
		BINDIR=/usr/bin MANDIR=/usr/man
endef

define Package/autossh/install
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,autossh))
