#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=fluxbox
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/fluxbox
PKG_MD5SUM:=990e276ead0d04421dce4080f485caca

EXTRA_LDFLAGS:="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib"

include $(INCLUDE_DIR)/package.mk

CONFIGURE_VARS+=LIBS="-nodefaultlibs -luClibc++ -Wl,-Bstatic,-lstdc++,-Bdynamic -lm $(LIBGCC_S)" \
		CXXLD="$(TARGET_CC)" 

CONFIGURE_ARGS+=--disable-xmb

define Package/fluxbox/Default
  SECTION:=xorg-wm
  CATEGORY:=Xorg
  SUBMENU:=window manager
  URL:=http://fluxbox.org/
endef

define Package/fluxbox
$(call Package/fluxbox/Default)
  DEPENDS:=+uclibcxx +libXt +libXpm
  TITLE:=fluxbox window manager
  MENU:=1
endef

define Package/fbrun
$(call Package/fluxbox/Default)
  DEPENDS:=fluxbox
  TITLE:=fluxbox tool to run applications
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR)/$(CONFIGURE_PATH); \
		if [ -x $(CONFIGURE_CMD) ]; then \
			$(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
			$(CONFIGURE_VARS) \
			$(CONFIGURE_CMD) \
			$(CONFIGURE_ARGS_XTRA) \
			$(CONFIGURE_ARGS) ;\
		fi \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) 
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(PKG_INSTALL_DIR) install 
endef

define Package/fluxbox/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/share/fluxbox/styles/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/fluxbox $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/fluxbox/keys $(1)/usr/share/fluxbox/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/fluxbox/styles/* $(1)/usr/share/fluxbox/styles/
	$(CP) files/init $(1)/usr/share/fluxbox/
	$(CP) files/menu $(1)/usr/share/fluxbox/
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DATA) \
		./files/uci-defaults/x11 \
		$(1)/etc/uci-defaults/
endef

define Package/fbsetbg/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/fbsetbg $(1)/usr/bin/
endef

define Package/fbsetroot/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/fbsetroot $(1)/usr/bin/
endef

define Package/fbrun/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/fbrun $(1)/usr/bin/
endef

define Package/fluxbox/postinst
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit
	. /etc/functions.sh
	uci_apply_defaults
endef

$(eval $(call BuildPackage,fbrun))
$(eval $(call BuildPackage,fluxbox))
