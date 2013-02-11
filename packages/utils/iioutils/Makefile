#
# Copyright (C) 2012-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=iioutils
PKG_VERSION:=0.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=8a88b711d3d6a7fedd75af833c5470cb

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/iioutils
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+sysfsutils
  TITLE:=Linux IIO Utilities
  URL:=http://sourceforge.net/projects/iioutils/
endef

define Package/iioutils/description
	lsiio is a utility for displaying information about IndustrialIO devices in the system and
	the sensors provided by them.
endef

TAR_CMD:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components 1 $(TAR_OPTIONS)

define Package/iioutils/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/{lsiio,iio_ring} $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,iioutils))
