# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=xine-lib
PKG_VERSION:=1.1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.sourceforge.net/xine/

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS_XTRA+=--enable-static --disable-vcd
EXTRA_LDLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/xine-lib
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=xine libraries
  DEPENDS:=+xorg-server-essentials +alsa-lib
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
	$(MAKE) -C $(PKG_BUILD_DIR)/ install DESTDIR=$(PKG_INSTALL_DIR)
	find $(PKG_INSTALL_DIR) -name lib*.*a | xargs rm -rf
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
	$(SED) 's,-I$$$${prefix}/include,-I$(1)/usr/include/,g' $(1)/usr/bin/xine-config 
	$(SED) 's,-L$$$${exec_prefix}/lib,-L$(1)/usr/lib/,g' $(1)/usr/bin/xine-config
	$(INSTALL_DIR) $(2)/bin
	mv $(1)/usr/bin/xine-config $(2)/bin
endef

define Package/xine-lib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,xine-lib))
