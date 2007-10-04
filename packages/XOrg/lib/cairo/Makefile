# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=cairo
PKG_VERSION:=1.2.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:= http://cairographics.org/releases/

include $(INCLUDE_DIR)/package.mk

EXTRA_LDFLAGS:="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib"

define Package/cairo
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=2D graphics library with support for multiple output devices
  DEPENDS:=+xorg-server-essentials +fontconfig
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
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(STAGING_DIR)/
	$(SED) "s,"prefix\=.*",prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/lib/pkgconfig/{cairo-ft,cairo,cairo-pdf,cairo-png,cairo-ps,cairo-svg,cairo-xlib,cairo-xlib-xrender}.pc
	$(SED) "s,"exec_prefix\=.*",exec_prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/lib/pkgconfig/{cairo-ft,cairo,cairo-pdf,cairo-png,cairo-ps,cairo-svg,cairo-xlib,cairo-xlib-xrender}.pc
	$(SED) "s,-L/usr/local/lib,,g" $(STAGING_DIR)/usr/lib/libcairo.la
	$(SED) "s,/usr/lib/libfontconfig.la,$(STAGING_DIR)/usr/lib/libfontconfig.la,g" $(STAGING_DIR)/usr/lib/libcairo.la
	$(SED)  "s,$(STAGING_DIR)$(STAGING_DIR),$(STAGING_DIR),g" $(STAGING_DIR)/usr/lib/libcairo.la
	$(SED)  "s,"libdir\=\'/usr/lib\'",libdir='$(STAGING_DIR)/usr/lib\'," $(STAGING_DIR)/usr/lib/libcairo.la
endef

define Package/cairo/Install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,cairo))
