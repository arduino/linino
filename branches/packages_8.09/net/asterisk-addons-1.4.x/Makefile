#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk-addons
PKG_VERSION:=1.4.7
PKG_RELEASE:=1.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.digium.com/pub/asterisk/releases/
PKG_MD5SUM:=3b14c147101c13ca6146c41870bad97a

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/asterisk-addons/Default
  SUBMENU:=asterisk14 (Complete Open Source PBX), v1.4.x
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Asterisk addons
  URL:=http://www.asterisk.org/
endef

define Package/asterisk-addons/Default/description
 Asterisk addons contains additional modules for Asterisk which are, for 
 one reason or another, not included in the normal base distribution.
endef


define Package/asterisk14-chan-mobile
$(call Package/asterisk-addons/Default)
  DEPENDS:= +asterisk14 +bluez-libs
  TITLE+= Mobile channel support
endef

define Package/asterisk14-chan-mobile/description
$(call Package/asterisk-addons/Default/description)
 This package contains the chan_mobile module for Asterisk.
endef


define Package/asterisk14-chan-ooh323
$(call Package/asterisk-addons/Default)
  DEPENDS:= +asterisk14
  TITLE+= OO H.323 channel support
endef

define Package/asterisk14-chan-ooh323/description
$(call Package/asterisk-addons/Default/description)
 This package contains the Objective Open H.323 support module for Asterisk.
endef


define Package/asterisk14-format-mp3
$(call Package/asterisk-addons/Default)
  DEPENDS:= +asterisk14
  TITLE+= MP3 format support
endef

define Package/asterisk14-format-mp3/description
$(call Package/asterisk-addons/Default/description)
 This package contains the MP3 support module for Asterisk.
endef


define Package/asterisk14-mysql
$(call Package/asterisk-addons/Default)
  DEPENDS:= +asterisk14 +libmysqlclient
  TITLE+= MySQL support
endef

define Package/asterisk14-mysql/description
$(call Package/asterisk-addons/Default/description)
 This package contains MySQL support modules for Asterisk.
endef


EXTRA_CFLAGS:=$(TARGET_CFLAGS) $(TARGET_CPPFLAGS)
EXTRA_LDFLAGS:=$(TARGET_LDFLAGS)

ifneq ($(SDK)$(CONFIG_PACKAGE_asterisk14-mysql),)
  EXTRA_CFLAGS+= -I$(STAGING_DIR)/usr/include/mysql
  EXTRA_LDFLAGS+= -L$(STAGING_DIR)/usr/lib/mysql
endif

CONFIGURE_ARGS += \
	--with-asterisk="$(STAGING_DIR)/usr" \
	--with-bluetooth="$(STAGING_DIR)/usr" \
	--with-ncurses="$(STAGING_DIR)/usr" \
	--with-mysqlclient="$(STAGING_DIR)/usr" \

CONFIGURE_VARS += \
	ac_cv_file__usr_include_asterisk_channel_h="yes" \

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./bootstrap.sh )
	$(call Build/Configure/Default,,,)
	$(call Build/Configure/Default,,,asterisk-ooh323c)
endef

# XXX: explanations
# - use AM_CFLAGS for asterisk-ooh323c
# - use OPTIMIZE & OPTIONS for format_mp3

MAKE_ARGS:= \
	AM_CFLAGS="$(TARGET_CFLAGS)" \
	OPTIMIZE="$(TARGET_CFLAGS) -DLOW_MEMORY" \
	OPTIONS="" \
	NOISY_BUILD="yes" \
	BLUETOOTH_LIB="$(TARGET_LDFLAGS) -lbluetooth" \

MAKE_VARS:= \
	CFLAGS="$(EXTRA_CFLAGS)" \
	LDFLAGS="$(EXTRA_LDFLAGS)" \

define Build/Compile
	mkdir -p $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules
	$(MAKE_VARS) \
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		$(MAKE_ARGS) \
		all
	$(MAKE_VARS) \
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		$(MAKE_ARGS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install samples
endef


define Package/asterisk14-chan-mobile/conffiles
/etc/asterisk/mobile.conf
endef

define Package/asterisk14-chan-mobile/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/mobile.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/chan_mobile.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-chan-ooh323/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/chan_ooh323.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-format-mp3/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/format_mp3.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-mysql/conffiles
/etc/asterisk/cdr_mysql.conf
/etc/asterisk/res_mysql.conf
endef

define Package/asterisk14-mysql/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/cdr_mysql.conf $(1)/etc/asterisk/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/res_mysql.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/app_addon_sql_mysql.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/cdr_addon_mysql.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/res_config_mysql.so $(1)/usr/lib/asterisk/modules/
endef


$(eval $(call BuildPackage,asterisk14-chan-mobile))
$(eval $(call BuildPackage,asterisk14-chan-ooh323))
$(eval $(call BuildPackage,asterisk14-format-mp3))
$(eval $(call BuildPackage,asterisk14-mysql))
