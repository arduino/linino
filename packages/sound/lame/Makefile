#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=lame
PKG_VERSION:=398
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/lame
PKG_MD5SUM:=f44b9f8e1b5d8835d0a77f9cc9cedd1c

include $(INCLUDE_DIR)/package.mk

define Package/lame/Default
  SECTION:=sound
  CATEGORY:=Sound
  URL:=http://sourceforge.net/projects/lame
endef

define Package/lame
$(call Package/lame/Default)
  TITLE:=lame
  MENU:=1
endef

define Package/lame/description
lame mp3 encoder
endef

define Package/lame-lib
$(call Package/lame/Default)
  TITLE:=lame-lib
  DEPENDS:=lame
endef

define Package/lame-lib/description
lame mp3 encoder libs
endef


define Build/Configure
	$(call Build/Configure/Default) 
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/lame/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/lame $(1)/usr/bin/
endef

define Package/lame-lib/install	
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(1)/usr/{lib,include}
	${CP} $(PKG_INSTALL_DIR)/usr/{lib,include} $(1)/usr/
 
endef

$(eval $(call BuildPackage,lame-lib))
$(eval $(call BuildPackage,lame))
