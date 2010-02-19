#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=eterm
PKG_VERSION:=0.9.4
PKG_RELEASE:=2

PKG_SOURCE:=Eterm-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.eterm.org/download/
PKG_BUILD_DIR:=$(BUILD_DIR)/Eterm-$(PKG_VERSION)

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/eterm/Default
  SECTION:=xorg-extra
  CATEGORY:=Xorg
  SUBMENU:=terminals

endef

define Package/eterm
$(call Package/eterm/Default)
  TITLE:=eterm
  DEPENDS:=+libX11 +libXcursor +imlib2 +libast +libiconv
endef

define Package/esetroot
$(call Package/eterm/Default)
  TITLE:=esetroot
  DEPENDS:=eterm
endef

CONFIGURE_ARGS += \
	--with-imlib=$(STAGING_DIR)/usr/

CONFIGURE_VARS += \
	LIBS="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib"

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)\
		CPPFLAGS="$(TARGET_CPPFLAGS) -I$(STAGING_DIR)/usr/lib/libiconv/include/" \
		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib/libiconv/lib/"
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Package/eterm/install
	$(INSTALL_DIR) $(1)/usr/{bin,lib}
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/Eterm $(1)/usr/bin
endef

define Package/esetroot/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/Esetroot $(1)/usr/bin
endef

$(eval $(call BuildPackage,esetroot))
$(eval $(call BuildPackage,eterm))
