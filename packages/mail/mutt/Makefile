#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mutt
PKG_VERSION:=1.5.20
PKG_RELEASE:=1

PKG_SOURCE_URL:=@SF/mutt
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=027cdd9959203de0c3c64149a7ee351c

include $(INCLUDE_DIR)/package.mk

define Package/mutt
  SECTION:=mail
  CATEGORY:=Mail
  DEPENDS:=+libopenssl +libncurses
  TITLE:=Console mail client
  URL:=http://www.mutt.org/
endef

define Package/mutt/description
	Mutt is a small but very powerful text-based mail client for Unix
	operating systems.
endef

CONFIGURE_ARGS += \
	--includedir=$(PKG_BUILD_DIR)/. \
	--oldincludedir=$(PKG_BUILD_DIR)/. \
	--enable-pop \
	--enable-imap \
	--with-ssl

define Package/mutt/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mutt $(1)/usr/bin/
endef

$(eval $(call BuildPackage,mutt))
