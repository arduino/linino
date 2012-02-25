#
# Copyright (C) 2010-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=less
PKG_VERSION:=436
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.greenwoodsoftware.com/less
PKG_MD5SUM:=817bf051953ad2dea825a1cdf460caa4

include $(INCLUDE_DIR)/package.mk

define Package/less
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Pager program similar to more
  DEPENDS:= +libncurses
  URL:=http://www.greenwoodsoftware.com/less/
endef

define Package/less/description
  Full version of GNU less utility
endef

define Package/less/install
	$(INSTALL_DIR) $(1)/bin
	$(CP) $(PKG_BUILD_DIR)/less $(1)/bin/less
endef

define Package/less/postinst
#!/bin/sh
[ -L "$${IPKG_INSTROOT}/usr/bin/less" ] && rm -f "$${IPKG_INSTROOT}/usr/bin/less"
exit 0
endef

define Package/less/postrm
#!/bin/sh
/bin/busybox less -h 2>&1 | grep -q BusyBox && ln -sf ../../bin/busybox /usr/bin/less
exit 0
endef

$(eval $(call BuildPackage,less))
