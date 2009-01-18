#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id:$

include $(TOPDIR)/rules.mk

PKG_NAME:=petitboot
PKG_VERSION:=0.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ozlabs.org/~jk/projects/petitboot/downloads/
PKG_MD5SUM:=b320c434f38d57c1fcc6980e51d934a8

include $(INCLUDE_DIR)/package.mk

define Package/petitboot
  SECTION:=boot
  CATEGORY:=Boot Loaders
  DEPENDS:=+libtwin +udev +udevextras +kexec-tools @TARGET_ps3
  TITLE:=Graphical bootloader
  URL:=http://ozlabs.org/~jk/projects/petitboot/
endef

define Build/Configure

endef

TARGET_CPPFLAGS += -I$(PKG_BUILD_DIR)

define Build/Compile
	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
	PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS)" \
		all install
endef

define Package/petitboot/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/petitboot $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/petitboot-udev-helper \
		$(1)/usr/sbin/
	$(INSTALL_BIN) files/petitboot-wrapper $(1)/usr/sbin/petitboot-wrapper
	$(INSTALL_DIR) $(1)/usr/share/petitboot/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/petitboot/artwork \
		$(1)/usr/share/petitboot/
	$(INSTALL_DIR) $(1)/etc/udev/rules.d
	$(CP) $(PKG_BUILD_DIR)/utils/99-petitboot.rules $(1)/etc/udev/rules.d/
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/petitboot.init $(1)/etc/init.d/petitboot

endef

$(eval $(call BuildPackage,petitboot))
