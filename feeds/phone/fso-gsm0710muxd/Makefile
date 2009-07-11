# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fso-gsm0710muxd
PKG_VERSION:=20090121
PKG_REV:=aae188c6b03d1fac8e4b5e4abe99235210ae6e25
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://git.freesmartphone.org/gsm0710muxd.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include -I$(STAGING_DIR)/usr/lib/libiconv/include
EXTRA_LDFLAGS+=-lintl -L$(STAGING_DIR)/usr/lib/libintl/lib -liconv -L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/fso-gsm0710muxd
	SECTION:=phone
	CATEGORY:=Phone
	TITLE:=GSM multiplexing daemon
	URL:=http://www.freesmartphone.org
	DEPENDS:=+glib2 +dbus +libdbus-glib
endef

define Package/fso-gsm0710muxd/description
	gsm0710muxd is a user space multiplexer for GSM according to the GSM 07.10 specification.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR) && \
		$(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
		$(CONFIGURE_VARS) \
		./autogen.sh \
		$(CONFIGURE_ARGS_XTRA) \
		$(CONFIGURE_ARGS) \
	);
endef

define Build/Compile
	DESTDIR=$(PKG_INSTALL_DIR) $(MAKE) -C $(PKG_BUILD_DIR) install
	rm -f $(STAGING_DIR_HOST)/usr/bin/dbus-binding-tool
endef

define Package/fso-gsm0710muxd/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
	$(INSTALL_BIN) ./files/gsm0710muxd.init $(1)/etc/init.d/gsm0710muxd
endef

$(eval $(call BuildPackage,fso-gsm0710muxd))
$(eval $(call RequireCommand,dbus-binding-tool, \
	Command <dbus-binding-tool> not found - please install dbus-binding-tool \
))
