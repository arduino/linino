# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pcmciautils
PKG_VERSION:=015
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.kernel.org/pub/linux/utils/kernel/pcmcia/
PKG_MD5SUM:=9e12435c8b6cf7bf59894e90e480b4aa

include $(INCLUDE_DIR)/package.mk

define Package/pcmciautils
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+sysfsutils @LINUX_2_6 @PCMCIA_SUPPORT
  TITLE:=PCMCIA Utilities
  URL:=http://www.kernel.org/pub/linux/utils/kernel/pcmcia/pcmcia.html
endef

define Build/Compile
	rm -rf "$(PKG_INSTALL_DIR)"
	mkdir -p "$(PKG_INSTALL_DIR)"
	$(call Build/Compile/Default, \
		LD="$(TARGET_CC)" UDEV=false \
		CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) \
		-DPCMCIAUTILS_VERSION=$(PKG_VERSION)" \
		prefix=/usr all \
	)
endef

define Package/pcmciautils/install
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(CP) $(PKG_BUILD_DIR)/pccardctl $(1)/usr/sbin/
	$(CP) $(PKG_BUILD_DIR)/pcmcia-check-broken-cis $(1)/usr/sbin/
	$(CP) $(PKG_BUILD_DIR)/pcmcia-socket-startup $(1)/usr/sbin/
	rm -f $(1)/usr/sbin/lspcmcia
	ln -s pccardctl $(1)/usr/sbin/lspcmcia
	$(INSTALL_DIR) $(1)/etc/pcmcia/
	$(CP) $(PKG_BUILD_DIR)/config/config.opts $(1)/etc/pcmcia/
	$(CP) files/* $(1)/
endef
$(eval $(call BuildPackage,pcmciautils))
