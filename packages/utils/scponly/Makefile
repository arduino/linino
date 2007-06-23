#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=scponly
PKG_VERSION:=4.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://sublimation.org/scponly
PKG_MD5SUM:=0425cb868cadd026851238452f1db907
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS+= \
  --enable-winscp-compat \
  --enable-scp-compat \
  --disable-rsync-compat \
  --with-sftp-server="/usr/libexec/sftp-server"

define Package/scponly
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE=:alternative 'shell' (of sorts) for sysadmins
  URL:=http://sublimation.org/scponly
endef

define Package/scponly/postinst
#!/bin/sh
echo "/usr/bin/scponly" >> $${IPKG_INSTROOT}/etc/shells
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/scponly/install  
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/scponly $(1)/usr/bin/
endef

$(eval $(call BuildPackage,scponly))
