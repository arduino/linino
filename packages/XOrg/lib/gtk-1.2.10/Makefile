# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=gtk-1.2.10
PKG_VERSION:=1.2.10
PKG_RELEASE:=1

PKG_SOURCE:=gtk+-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://gd.tuwien.ac.at/graphics/gimp/gtk/v1.2/
PKG_BUILD_DIR=$(BUILD_DIR)/gtk+-1.2.10

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS_XTRA+=--x-includes=$(STAGING_DIR)/usr/include/ \
		--x-libraries=$(STAGING_DIR)/usr/lib \
		--with-glib-prefix=$(STAGING_DIR)/usr/ \
		--enable-static=yes \
		--enable-static=yes

EXTRA_CFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

EXTRA_LDFLAGS+=-lnotimpl

define Package/gtk-1.2.10
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=GTK+ 1.2.10 package
  DEPENDS:=+glib1
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
endef

$(eval $(call BuildPackage,gtk-1.2.10))
