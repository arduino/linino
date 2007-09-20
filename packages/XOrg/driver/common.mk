# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.2/src/driver

_CATEGORY:=driver
_DEPEND+=+xorg-server-X11R7.2
include ../../common.mk

define Build/Compile
	make -C $(PKG_BUILD_DIR)
endef

EXTRA_CFLAGS+= -I${STAGING_DIR}/usr/include/xorg -I${STAGING_DIR}/usr/include/X11/

define Build/Configure
	(cd $(PKG_BUILD_DIR)/$(CONFIGURE_PATH); \
	if [ -x $(CONFIGURE_CMD) ]; then \
		$(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
		$(CONFIGURE_VARS) \
		$(CONFIGURE_CMD) \
		$(CONFIGURE_ARGS_XTRA) \
		$(CONFIGURE_ARGS) \
		as_ac_File=no \
		--enable-malloc0returnsnull; \
	fi \
	)
endef

define Package/${PKG_NAME}/install
	DESTDIR=$(PKG_INSTALL_DIR) $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
	find $(1)/usr/lib/ -name *a | xargs rm -rf
endef
