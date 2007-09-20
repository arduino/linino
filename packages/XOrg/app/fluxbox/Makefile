# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=fluxbox
PKG_VERSION:=1.0rc3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://prdownloads.sourceforge.net/fluxbox/

EXTRA_LDFLAGS:="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib"

include $(INCLUDE_DIR)/package.mk

CONFIGURE_VARS+=LIBS="-nodefaultlibs -luClibc++ -Wl,-Bstatic,-lstdc++,-Bdynamic -lm" \
		CXXLD="$(TARGET_CC)" 

CONFIGURE_ARGS+=--disable-static --disable-xmb

define Package/fluxbox
  SECTION:=xorg-wm
  CATEGORY:=Xorg
  DEPENDS:=+xorg-server-X11R7.2-essentials +uclibcxx +xterm @TARGET_x86
  TITLE:=fluxbox window manager
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
	$(INSTALL_DIR) $(1)/usr/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ $(1)/usr/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/ $(1)/usr/
endef

$(eval $(call BuildPackage,fluxbox))
