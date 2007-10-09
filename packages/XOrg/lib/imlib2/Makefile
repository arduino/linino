# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=imlib2
PKG_VERSION:=1.2.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.sourceforge.net/enlightenment/

include $(INCLUDE_DIR)/package.mk

define Package/imlib2
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Image library
  DEPENDS:=+xorg-server-essentials +giflib +libtiff +libjpeg +gtk-1.2.10 +libnotimpl +libfreetype
endef

CONFIGURE_ARGS+=--disable-gtktest LIBS="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib"

EXTRA_LDFLAGS+=-lnotimpl

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
	$(MAKE) -C $(PKG_BUILD_DIR) install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
	$(SED)  "s,"libdir\=\'/usr/lib\'",libdir='$(1)/usr/lib\'," $(1)/usr/lib/libImlib2.la
	$(SED)  "s,prefix.*,prefix=$(STAGING_DIR)/usr,g" $(1)/usr/bin/imlib2-config 
	$(SED)  "s,exec_prefix.*,exec_prefix=$(STAGING_DIR)/usr,g" $(1)/usr/bin/imlib2-config
	$(CP) $(PKG_BUILD_DIR)/src/modules/loaders/.libs/*.so $(1)/usr/lib/imlib2/loaders/
endef

define Package/imlib2/install
	$(INSTALL_DIR) $(1)/usr/lib/imlib2/loaders/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/src/modules/loaders/.libs/*.so $(1)/usr/lib/imlib2/loaders/
endef

$(eval $(call BuildPackage,imlib2))
