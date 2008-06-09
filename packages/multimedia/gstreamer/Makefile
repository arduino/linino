#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gstreamer
PKG_VERSION:=0.10.12
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://gstreamer.freedesktop.org/src/gstreamer/
PKG_FIXUP:=libtool
PKG_MD5SUM:=82192b54a7a914609dfb97e2a44b311e

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS+= -I$(STAGING_DIR)/usr/lib/libintl/include/ -I$(STAGING_DIR)/usr/lib/libiconv/include/
EXTRA_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/usr/lib/libintl/lib/ -L$(STAGING_DIR)/usr/lib/libiconv/lib/

define Package/gstreamer
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=gstreamer
  URL:=http://gstreamer.freedesktop.org/
  DEPENDS:=+libxml2 +check
  MENU:=1
endef

define Package/gstreamer/description
	gnu streamer
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		if [ -x $(CONFIGURE_CMD) ]; then \
			$(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
			$(CONFIGURE_VARS) \
			$(CONFIGURE_CMD) \
			--disable-tests \
			$(CONFIGURE_ARGS) ;\
		fi \
	)
endef

define Build/Compile
	cd $(PKG_BUILD_DIR) ; DESTDIR=$(PKG_INSTALL_DIR) $(MAKE) all install
	cd $(PKG_INSTALL_DIR)/usr/include/; ln -s gstreamer-0.10/gst/
endef

define Build/InstallDev
	mkdir -p $(1)
	cp -r $(PKG_INSTALL_DIR)/* $(1)
endef

define Package/gstreamer/install
	mkdir -p $(1)
	cp -r $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,gstreamer))
