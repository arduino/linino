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

ifeq ("$(PKG_NAME)","libX11-X11R7.2")
 CONFIGURE_ARGS_XTRA=--without-xcb
endif

define libX11-X11R7.2/Compile
	$(MAKE_VARS) \
		$(MAKE) -C $(PKG_BUILD_DIR)/src/util CFLAGS="" LDFLAGS="" CC="cc" makekeys 
endef

define libXt-X11R7.2/Compile
	$(MAKE_VARS) \
		$(MAKE) -C $(PKG_BUILD_DIR)/util CFLAGS="" LDFLAGS="" CC="cc" 
endef

define Build/Compile
	$(call $(PKG_NAME)/Compile)
	make -C $(PKG_BUILD_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	DESTDIR=$(PKG_INSTALL_DIR) $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
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
	find $(PKG_INSTALL_DIR)/usr/lib/ -name lib*so* | $(XARGS) -i -t cp -P {} $(1)/usr/lib 
	$(call $(PKG_NAME)/install,$(1))
endef

define Build/InstallDev
	DESTDIR=$(STAGING_DIR) $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
	rm -rf $(STAGING_DIR)/usr/lib/*.la
endef

