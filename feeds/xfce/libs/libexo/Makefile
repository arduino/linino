#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=exo
PKG_VERSION:=0.3.101
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.tx-us.xfce.org/archive/xfce-4.6.1/src/
PKG_MD5SUM:=1c0eebb360f53eab70454b70e1bde36e

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib

define Package/libexo
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=libexo
  DEPENDS:=+gtk2 +libxfce4util
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--libexecdir=/usr/lib/exo/ \
		--disable-hal \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR)	$(1)/usr/{lib/pkgconfig,include/exo-0.3}
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/exo-0.3/* \
		$(1)/usr/include/exo-0.3/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{la,so*,a} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libexo/install
	$(INSTALL_DIR) $(1)/etc/xdg/xfce4
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/etc/xdg/xfce4/* \
		$(1)/etc/xdg/xfce4/

	$(INSTALL_DIR) $(1)/usr/lib/exo
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/exo/exo-helper-0.3 \
		$(PKG_INSTALL_DIR)/usr/lib/exo/exo-compose-mail-0.3 \
		$(1)/usr/lib/exo/

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/share/applications/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/applications/* \
		$(1)/usr/share/applications/

	$(INSTALL_DIR) $(1)/usr/share/icons/hicolor
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/icons/hicolor/* \
		$(1)/usr/share/icons/hicolor

	$(INSTALL_DIR) $(1)/usr/share/pixmaps/exo-0.3
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pixmaps/exo-0.3/* \
		$(1)/usr/share/pixmaps/exo-0.3/

	$(INSTALL_DIR) $(1)/usr/share/xfce4/helpers
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/xfce4/helpers/* \
		$(1)/usr/share/xfce4/helpers/

endef

$(eval $(call BuildPackage,libexo))
