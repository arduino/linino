#
# Copyright (C) 2006-2010 OpenWrt.org
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
PKG_SOURCE_URL:=@SF/xine
PKG_MD5SUM:=b1f42602c776bb93e3cbf127e220cbfd

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS_XTRA+=--enable-static --disable-vcd --disable-imagemagick

define Package/xine-lib
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=xine libraries
  DEPENDS:=+libX11 +alsa-lib +zlib +libfreetype
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
	$(MAKE) -C $(PKG_BUILD_DIR)/ all install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
	$(SED) 's,-I$$$${prefix}/include,-I$(STAGING_DIR)/usr/include/,g' $(1)/usr/bin/xine-config 
	$(SED) 's,-L$$$${exec_prefix}/lib,-L$(STAGING_DIR)/usr/lib/,g' $(1)/usr/bin/xine-config
	$(INSTALL_DIR) $(2)/bin
	mv $(1)/usr/bin/xine-config $(2)/bin
endef

define Package/xine-lib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,xine-lib))
