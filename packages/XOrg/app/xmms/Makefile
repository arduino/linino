# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=xmms
PKG_VERSION:=1.2.10
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.xmms.org/files/1.2.x/

include $(INCLUDE_DIR)/package.mk

define Package/xmms
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=+xorg-server-essentials +alsa-lib +gtk-1.2.10 +libnotimpl
  TITLE:=XMMS audio player
endef

define Package/xmms/description
	Popular music player for X
endef

CONFIGURE_ARGS+=LIBS="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib -lnotimpl" \
	sys_lib_dlsearch_path_spec="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
	sys_lib_search_path_spec="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
	--disable-mikmod \
	--disable-vorbis

define Build/Configure
	(cd $(PKG_BUILD_DIR)/$(CONFIGURE_PATH); \
		if [ -x $(CONFIGURE_CMD) ]; then \
			$(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
			$(TARGET_CONFIGURE_OPTS) \
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

define Package/xmms/install
	$(call pkg_install_files,$(1),/usr/bin/xmms /usr/share/xmms/)
endef

$(eval $(call BuildPackage,xmms))
