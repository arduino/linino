# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org 

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.2/src/app

_CATEGORY:=app
_DEPEND+=xorg-server-X11R7.2-essentials
include ../../common.mk

ifeq ($(PKG_NAME),xdm-X11R7.2)
CONFIGURE_ARGS+=--with-random-device=/dev/urandom
endif

CONFIGURE_ARGS+=LIBS="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib" 

define Build/Compile
	make -C $(PKG_BUILD_DIR)
	make -C $(PKG_BUILD_DIR) DESTDIR=$(PKG_INSTALL_DIR) install
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
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
	rm -rf $(1)/usr/man/
endef

