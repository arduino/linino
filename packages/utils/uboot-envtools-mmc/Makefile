#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=uboot-envtools-mmc
PKG_VERSION:=20081215
PKG_RELEASE:=1.1

PKG_SOURCE:=uboot-envtools_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=http://ftp.de.debian.org/debian/pool/main/u/uboot-envtools/

include $(INCLUDE_DIR)/package.mk

TAR_CMD=$(HOST_TAR) --strip-components 1 -C "$(PKG_BUILD_DIR)" $(TAR_OPTIONS)

TARGET_CFLAGS += -DCONFIG_ENV_IS_IN_MMC

define Package/uboot-envtools-mmc
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=read/modify U-Boot bootloader environment in MMC flash
  DEPENDS:= +zlib
  URL:=http://www.denx.de/wiki/U-Boot
endef

define Package/uboot-envtools-mmc/description
 This package includes tools to read and modify U-Boot bootloader environment.
 This package is patched to to allow reading/writing to block devices.
endef

define Package/uboot-envtools-mmc/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/fw_printenv $(1)/usr/sbin/
	ln -sf fw_printenv $(1)/usr/sbin/fw_setenv
endef

$(eval $(call BuildPackage,uboot-envtools-mmc))
