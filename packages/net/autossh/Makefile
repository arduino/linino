#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=autossh
PKG_VERSION:=1.4a
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://www.harding.motd.ca/autossh/
PKG_MD5SUM:=a5497938986f0c179926f1ebba603767
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/autossh
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+openssh-client
  TITLE:=Autossh client
  URL:=http://www.harding.motd.ca/autossh/
endef

define Build/Compile
	$(call Build/Compile/Default, -f Makefile \
		CFLAGS="$(TARGET_CFLAGS) -Wall -D\"SSH_PATH=\\\"\$$$$(SSH)\\\"\" -D\"VER=\\\"\$$$$(VER)\\\"\"" \
		all \
	)
endef

define Package/autossh/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/autossh $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,autossh))
