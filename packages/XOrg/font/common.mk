# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.2/src/font

_CATEGORY:=fonts
_DEPEND+="+xorg-server-X11R7.2 +font-util-X11R7.1"
include ../../common.mk

define Build/Compile
	UTIL_DIR="$(STAGING_DIR)/usr/lib/X11/fonts/util/" make -e -C $(PKG_BUILD_DIR)
	DESTDIR=$(PKG_INSTALL_DIR) $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
	if [ -f "$(find $(PKG_INSTALL_DIR) -name fonts.dir)" ]; then \
		mv `find $(PKG_INSTALL_DIR) -name fonts.dir` \
			`find $(PKG_INSTALL_DIR) -name fonts.dir`.$(PKG_NAME);\
	fi
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

define Package/${PKG_NAME}/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef
