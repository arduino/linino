#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org
# $Id: Makefile 12575 2008-09-12 20:28:31Z lars $

include $(TOPDIR)/rules.mk

PKG_NAME:=libast
PKG_VERSION:=0.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.eterm.org/download/
PKG_MD5SUM:=a9ec3b2da317f35869316e6d9571d296
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/libast
  SECTION:=xorg-libraries
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=libast
  DEPENDS:=+libX11
endef

CONFIGURE_ARGS+=dps_cv_snprintf_bug=0 dps_cv_vsnprintf_bug=0 --without-imlib

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
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib"
	$(MAKE) -C $(PKG_BUILD_DIR) install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/include $(2)/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*{la,so}* $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(2)/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include
	$(SED) "s,-I/usr/include,,g" $(2)/bin/libast-config
	$(SED) "s,-L/usr/lib,,g" $(2)/bin/libast-config
	$(SED) "s,-L/usr/X11R6/lib,,g" $(2)/bin/libast-config
endef

define Package/libast/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libast))
