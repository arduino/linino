#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk-addons
PKG_VERSION:=1.4.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.digium.com/pub/asterisk/old-releases/
PKG_MD5SUM:=c080b02e6ddc81dab6a64691af890805

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
  DEFAULT:=n
  TITLE+= MySQL support
endef

define Package/asterisk14-mysql/description
$(call Package/asterisk-addons/Default/description)
 This package contains MySQL support modules for Asterisk.
endef


ifneq ($(SDK)$(CONFIG_PACKAGE_asterisk14-mysql),)
  EXTRA_CFLAGS+= -I$(STAGING_DIR)/usr/include/mysql
  EXTRA_LDFLAGS+= -L$(STAGING_DIR)/usr/lib/mysql
endif


define Build/Configure
	( cd $(PKG_BUILD_DIR); ./bootstrap.sh )
	$(call Build/Configure/Default)
	cd $(PKG_BUILD_DIR)/asterisk-ooh323c && \
		CPPFLAGS="-I$(STAGING_DIR)/host/include $(EXTRA_CFLAGS)" \
		LDFLAGS="-L$(STAGING_DIR)/host/lib" \
		./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		-build=$(GNU_HOST_NAME) \
		--prefix=/usr \
		--exec-prefix=/usr \
		--bindir=/usr/bin \
		--sbindir=/usr/sbin \
		--libexecdir=/usr/lib \
		--sysconfdir=/etc \
		--datadir=/usr/share \
		--localstatedir=/var \
		--mandir=/usr/man \
		--infodir=/usr/info \
		$(DISABLE_NLS) \
		ac_cv_file__usr_include_asterisk_channel_h="yes"
endef

define Build/Compile
	mkdir -p $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules
	CFLAGS="-DLOW_MEMORY $(EXTRA_CFLAGS)" \
	LDFLAGS="$(EXTRA_LDFLAGS)" \
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		BLUETOOTH_LIB="$(TARGET_LDFLAGS) -lbluetooth" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install samples
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
