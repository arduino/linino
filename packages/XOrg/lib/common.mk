# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org 

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.2/src/lib/

_CATEGORY:=libraries
_DEPEND+=+xorg-headers-native +util-macros-X11R7.2 
include ../../common.mk

define Build/Compile
	make -C $(PKG_BUILD_DIR)
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR)/$(CONFIGURE_PATH); \
	if [ -x $(CONFIGURE_CMD) ]; then \
		$(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
		$(CONFIGURE_VARS) \
		$(CONFIGURE_CMD) \
		$(CONFIGURE_ARGS_XTRA) \
		$(CONFIGURE_ARGS) \
		--enable-malloc0returnsnull; \
	fi \
	)
endef

define libXaw-X11R7.1/install
	rm -f $(1)/usr/lib/libXaw.so.*
	cd $(1)/usr/lib; ln -s libXaw7.so.7.0.0 libXaw.so.7; ln -s libXaw6.so.6.0.1 libXaw.so.6
endef

define Package/${PKG_NAME}/install
	$(INSTALL_DIR) $(1)/usr/lib
	if [ -d $(PKG_BUILD_DIR)/src/.libs/ ]; then \
		cp -f $(PKG_BUILD_DIR)/src/.libs/lib*so* $(1)/usr/lib ; \
	fi
	if [ -d $(PKG_BUILD_DIR)/.libs/ ]; then \
		cp -f $(PKG_BUILD_DIR)/.libs/lib*so* $(1)/usr/lib ; \
	fi
	$(call $(PKG_NAME)/install,$(1))
endef

define Build/InstallDev
	DESTDIR=$(STAGING_DIR) $(MAKE) -C $(PKG_BUILD_DIR)/$(SUBPACKAGE)  $(MAKE_FLAGS) install
	rm -rf $(STAGING_DIR)/usr/lib/*.la
endef

