#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk
PKG_VERSION:=1.2.14
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.digium.com/pub/asterisk/old-releases/ ftp://ftp.digium.com/pub/asterisk/old-releases/
PKG_MD5SUM:=2ce03466b99e0b9471e6c791ed14a5f2
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/asterisk/Default
  SECTION:=net
  CATEGORY:=Network
  DESCRIPTION:=\
	Asterisk is a complete PBX in software. It provides all of the features \\\
	you would expect from a PBX and more. Asterisk does voice over IP in three \\\
	protocols, and can interoperate with almost all standards-based telephony \\\
	equipment using relatively inexpensive hardware.
  URL:=http://www.asterisk.org/
  SUBMENU:=asterisk (Complete Open Source PBX)
endef

define Package/asterisk
  $(call Package/asterisk/Default)
  DEPENDS:=+libncurses +libpthread
  TITLE:=Complete Open Source PBX
endef

define Package/asterisk/conffiles
/etc/asterisk/asterisk.conf
/etc/asterisk/agents.conf
/etc/asterisk/alarmreceiver.conf
/etc/asterisk/cdr_manager.conf
/etc/asterisk/codecs.conf
/etc/asterisk/enum.conf
/etc/asterisk/extconfig.conf
/etc/asterisk/extensions.conf
/etc/asterisk/features.conf
/etc/asterisk/iax.conf
/etc/asterisk/iaxprov.conf
/etc/asterisk/indications.conf
/etc/asterisk/logger.conf
/etc/asterisk/manager.conf
/etc/asterisk/modules.conf
/etc/asterisk/musiconhold.conf
/etc/asterisk/osp.conf
/etc/asterisk/privacy.conf
/etc/asterisk/queues.conf
/etc/asterisk/rtp.conf
/etc/asterisk/sip.conf
endef

define Package/asterisk-mini
  $(call Package/asterisk/Default)
  DEPENDS:=+libncurses +libpthread
  PROVIDES:=asterisk
  TITLE:=Minimal Open Source PBX
  DESCRIPTION+=\\\
	\\\
	This package contains only the following modules: \\\
        - app_dial\\\
    	- chan_iax2\\\
    	- chan_local\\\
    	- chan_sip\\\
    	- codec_gsm\\\
    	- codec_ulaw\\\
    	- format_gsm\\\
    	- format_pcm\\\
    	- format_wav\\\
    	- format_wav_gsm\\\
    	- pbx_config\\\
    	- res_features\\\
    	- res_musiconhold
endef

define Package/asterisk-mini/conffiles
/etc/asterisk/asterisk.conf
/etc/asterisk/enum.conf
/etc/asterisk/extconfig.conf
/etc/asterisk/extensions.conf
/etc/asterisk/features.conf
/etc/asterisk/iax.conf
/etc/asterisk/iaxprov.conf
/etc/asterisk/logger.conf
/etc/asterisk/manager.conf
/etc/asterisk/modules.conf
/etc/asterisk/musiconhold.conf
/etc/asterisk/rtp.conf
/etc/asterisk/sip.conf
endef

define Package/asterisk-mysql
  $(call Package/asterisk/Default)
  DEPENDS:=asterisk +libmysqlclient
  TITLE:=MySQL support
  DESCRIPTION+=\\\
	\\\
	This package contains MySQL support modules for Asterisk.
endef

define Package/asterisk-mysql/conffiles
/etc/asterisk/cdr_mysql.conf
endef

define Package/asterisk-pgsql
  $(call Package/asterisk/Default)
  DEPENDS:=asterisk +libpq
  TITLE:=PostgreSQL support
  DESCRIPTION+=\\\
	\\\
	This package contains PostgreSQL support modules for Asterisk.
endef

define Package/asterisk-pgsql/conffiles
/etc/asterisk/cdr_pgsql.conf
endef

define Package/asterisk-sqlite
  $(call Package/asterisk/Default)
  DEPENDS:=asterisk +libsqlite2
  TITLE:=SQLite modules
  DESCRIPTION+=\\\
	\\\
	This package contains SQLite support modules for Asterisk.
endef

define Package/asterisk-sounds
  $(call Package/asterisk)
  MENU:=0
  DEPENDS:=asterisk
  TITLE:=Sound files
  DESCRIPTION+=\\\
    \\\
    This package contains sound files for Asterisk.
endef

define Package/asterisk-voicemail
  $(call Package/asterisk/Default)
  DEPENDS:=asterisk
  TITLE:=Voicemail support
  DESCRIPTION+=\\\
	\\\
	This package contains voicemail related modules for Asterisk.
endef

define Package/asterisk-voicemail/conffiles
/etc/asterisk/voicemail.conf
endef

define Package/asterisk-app-meetme
  $(call Package/asterisk/Default)
  DEPENDS:=asterisk +zaptel-libtonezone
  TITLE:=MeetMe Confererencing support
  DESCRIPTION+=\\\
        \\\
        This package provides the application MeetMe and conferencing support to \\\
        Asterisk.
endef

define Package/asterisk-app-meetme/conffiles
/etc/asterisk/meetme.conf
endef

define Package/asterisk-chan-bluetooth
  $(call Package/asterisk/Default)
  DEPENDS:=asterisk +bluez-libs
  TITLE:=Bluetooth HandsFreeProfile support for Asterisk
  DESCRIPTION+=\\\
	\\\
	This package provides Bluetooth HandsFreeProfile support to Asterisk.
endef

define Package/asterisk-chan-bluetooth/conffiles
/etc/asterisk/bluetooth.conf
endef

define Package/asterisk-chan-h323
  $(call Package/asterisk/Default)
  DEPENDS:=asterisk +libopenh323 +uclibcxx
  TITLE:=H.323 support for Asterisk
  DESCRIPTION+=\\\
	\\\
	This package provides H.323 support to Asterisk.
endef

define Package/asterisk-chan-h323/conffiles
/etc/asterisk/h323.conf
endef

define Package/asterisk-chan-mgcp
  $(call Package/asterisk/Default)
  DEPENDS:=asterisk
  TITLE:=MGCP support
  DESCRIPTION+=\\\
	\\\
	This package provides MGCP (Media Gateway Control Protocol) support \\\
	to Asterisk.
endef

define Package/asterisk-chan-mgcp/conffiles
/etc/asterisk/mgcp.conf
endef

define Package/asterisk-chan-skinny
  $(call Package/asterisk/Default)
  DEPENDS:=asterisk
  TITLE:=Skinny Client Control Protocol support
  DESCRIPTION+=\\\
	\\\
	This package provided Skinny Client Control Protocol support to \\\
	Asterisk.
endef

define Package/asterisk-chan-skinny/conffiles
/etc/asterisk/skinny.conf
endef

define Package/asterisk-codec-ilbc
  $(call Package/asterisk/Default)
  DEPENDS:=asterisk
  TITLE:=ILBC Translator
  DESCRIPTION+=\\\
	\\\
	This package contains the ILBC (Internet Low Bitrate Codec) translator \\\
	for Asterisk.
endef

define Package/asterisk-codec-lpc10
  $(call Package/asterisk/Default)
  DEPENDS:=asterisk
  TITLE:=LPC10 2.4kbps voice codec Translator
  DESCRIPTION+=\\\
	\\\
	This package contains the LPC10 (Linear Predictor Code) 2.4kbps voice \\\
	codec translator for Asterisk.
endef

define Package/asterisk-codec-speex
  $(call Package/asterisk/Default)
  DEPENDS:=asterisk +libspeex
  TITLE:=Speex/PCM16 Codec Translator
  DESCRIPTION+=\\\
	\\\
	This package contains the Speex speech compression codec translator for \\\
	Asterisk.
endef

define Package/asterisk-pbx-dundi
  $(call Package/asterisk/Default)
  DEPENDS:=asterisk
  TITLE:=DUNDi support
  DESCRIPTION+=\\\
	\\\
	This package provides DUNDi (Distributed Universal Number Discovery) \\\
	support to Asterisk.
endef

define Package/asterisk-pbx-dundi/conffiles
/etc/asterisk/dundi.conf
endef

define Package/asterisk-res-agi
  $(call Package/asterisk/Default)
  DEPENDS:=asterisk
  TITLE:=AGI support
  DESCRIPTION+=\\\
	\\\
	This package provides AGI (Asterisk Gateway Interface) support to \\\
	Asterisk.
endef

define Package/asterisk-res-crypto
  $(call Package/asterisk/Default)
  DEPENDS:=asterisk +libopenssl
  TITLE:=Cryptographic Digital Signatures support
  DESCRIPTION+=\\\
        \\\
        This package provides Cryptographic Digital Signatures support to \\\
        Asterisk.
endef


ifneq ($(SDK),)
# Make sure the options below are enabled when building with the SDK
  CONFIG_PACKAGE_asterisk-mysql:=m
  CONFIG_PACKAGE_asterisk-pgsql:=m
  CONFIG_PACKAGE_asterisk-sqlite:=m
  CONFIG_PACKAGE_asterisk-app-meetme:=m
  CONFIG_PACKAGE_asterisk-chan-bluetooth:=m
  CONFIG_PACKAGE_asterisk-chan-h323:=m
  CONFIG_PACKAGE_asterisk-codec-speex:=m
  CONFIG_PACKAGE_asterisk-res-crypto:=m
endif

EXTRA_CFLAGS:= -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
EXTRA_LDFLAGS:= -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib

ifneq ($(CONFIG_PACKAGE_asterisk-mysql),)
  EXTRA_CFLAGS+= -I$(STAGING_DIR)/usr/include/mysql
  EXTRA_LDFLAGS+= -L$(STAGING_DIR)/usr/lib/mysql
  EXTRA_APP_MODULES+= app_sql_mysql.so
  EXTRA_CDR_MODULES+= cdr_mysql.so
  EXTRA_RES_MODULES+= res_config_mysql.so
endif
ifneq ($(CONFIG_PACKAGE_asterisk-pgsql),)
  EXTRA_APP_MODULES+= app_sql_postgres.so
  EXTRA_CDR_MODULES+= cdr_pgsql.so
endif
ifneq ($(CONFIG_PACKAGE_asterisk-sqlite),)
  EXTRA_CDR_MODULES+= cdr_sqlite.so
endif
ifneq ($(CONFIG_PACKAGE_asterisk-app-meetme),)
  EXTRA_APP_MODULES+= app_meetme.so
endif
ifneq ($(CONFIG_PACKAGE_asterisk-chan-bluetooth),)
  EXTRA_CHAN_MODULES+= chan_bluetooth.so
endif
ifneq ($(CONFIG_PACKAGE_asterisk-chan-h323),)
  EXTRA_DEFINES+= \
	OPENH323DIR="$(BUILD_DIR)/openh323" \
	PWLIBDIR="$(BUILD_DIR)/pwlib" \
	CXXLIBS="-nodefaultlibs -luClibc++ -lc -lm -lgcc"
  EXTRA_CHAN_MODULES+= chan_h323.so
endif
ifneq ($(CONFIG_PACKAGE_asterisk-codec-speex),)
  EXTRA_CFLAGS+= -I$(STAGING_DIR)/usr/include/speex
  EXTRA_CODEC_MODULES+= codec_speex.so
endif
ifneq ($(CONFIG_PACKAGE_asterisk-res-crypto),)
  EXTRA_RES_MODULES+= res_crypto.so
endif

define Build/Configure
endef

ifneq ($(CONFIG_PACKAGE_asterisk-chan-h323),)
  define Build/Compile/chan-h323
	$(MAKE) -C "$(PKG_BUILD_DIR)/channels/h323" \
		$(TARGET_CONFIGURE_OPTS) \
		$(EXTRA_DEFINES) \
		optnoshared
  endef
endif

define Build/Compile
	$(call Build/Compile/chan-h323)
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		CROSS_ARCH="Linux" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		CROSS_COMPILE_BIN="/void/" \
		CROSS_COMPILE_TARGET="/void/" \
		$(TARGET_CONFIGURE_OPTS) \
		HOST_CC="$(HOSTCC)" \
		OPTIMIZE="$(TARGET_CFLAGS)" \
		PROC="$(ARCH)" \
		DEBUG="" \
		OPTIONS="-DLOW_MEMORY -Dlinux" \
		NOCRYPTO="yes" \
		EXTRA_CFLAGS="$(EXTRA_CFLAGS)" \
		EXTRA_LDFLAGS="$(EXTRA_LDFLAGS)" \
		EXTRA_APP_MODULES="$(EXTRA_APP_MODULES)" \
		EXTRA_CDR_MODULES="$(EXTRA_CDR_MODULES)" \
		EXTRA_CHAN_MODULES="$(EXTRA_CHAN_MODULES)" \
		EXTRA_CODEC_MODULES="$(EXTRA_CODEC_MODULES)" \
		EXTRA_RES_MODULES="$(EXTRA_RES_MODULES)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		ASTVARLIBDIR="/usr/lib/asterisk" \
		$(EXTRA_DEFINES) \
		all install samples
	$(SED) 's|/var/lib/asterisk|/usr/lib/asterisk|g' $(PKG_INSTALL_DIR)/etc/asterisk/musiconhold.conf
	rm -f $(PKG_INSTALL_DIR)/etc/asterisk/*.old
endef

define Package/asterisk/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
	rm -rf $(1)/usr/sbin/astgenkey
	rm -rf $(1)/usr/bin
	rm -rf $(1)/usr/share
	rm -rf $(1)/usr/include
	rm -rf $(1)/var
	(cd $(1)/usr/lib/asterisk; \
		rm -rf agi-bin; \
		rm -rf images; \
		rm -rf keys/*; \
		rm -rf mohmp3/*.mp3; \
		rm -rf sounds/*; \
		cd modules; \
		rm -rf	*adsi* *festival* *modem* *meetme* *oss* *phone* *intercom* \
			*mp3* *nbscat* *mysql* *postgres* *pgsql* *voicemail* *speex* \
			*zapateller* *jpeg*; \
		rm -f chan_bluetooth.so ; \
		rm -f chan_h323.so ; \
		rm -f chan_mgcp.so ; \
		rm -f chan_skinny.so ; \
		rm -f {codec,format}_ilbc.so ; \
		rm -f codec_lpc10.so ; \
		rm -f pbx_dundi.so ; \
		rm -f res_agi.so ; \
		rm -f res_crypto.so ; \
	)
	(cd $(1)/etc/asterisk; \
		rm -f 	*odbc* *mysql* *postgres* *pgsql* *voicemail* *adsi* *oss* *alsa* \
			*festival* *modem* *meetme* *phone* *tds* *vofr* *rpt* *vpb* \
			*zapata*; \
		rm -f bluetooth.conf ; \
		rm -f mgcp.conf ; \
		rm -f skinny.conf ; \
		rm -f dundi.conf ; \
	)
	$(INSTALL_DATA) ./files/modules.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_DATA)  ./files/asterisk.default $(1)/etc/default/asterisk
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN)  ./files/asterisk.init $(1)/etc/init.d/asterisk
endef

define Package/asterisk-mini/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	for f in asterisk enum extconfig extensions features iax iaxprov logger manager modules musiconhold rtp sip; do \
	  $(CP) $(PKG_INSTALL_DIR)/etc/asterisk/$$$$f.conf $(1)/etc/asterisk/ ; \
	done
	$(INSTALL_DATA) ./files/modules.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/asterisk/firmware $(1)/usr/lib/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/keys
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	for f in chan_iax2 chan_local chan_sip codec_gsm codec_ulaw format_gsm format_pcm format_wav \
	  format_wav_gsm pbx_config res_features res_musiconhold; do \
	  $(CP) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/$$$$f.so $(1)/usr/lib/asterisk/modules/ ; \
	done
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/mohmp3
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/sounds
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/asterisk $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/safe_asterisk $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_DATA)  ./files/asterisk.default $(1)/etc/default/asterisk
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN)  ./files/asterisk.init $(1)/etc/init.d/asterisk
endef

define Package/asterisk-mysql/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	install -m0600 $(PKG_BUILD_DIR)/configs/cdr_mysql.conf.sample $(1)/etc/asterisk/cdr_mysql.conf
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/apps/app_sql_mysql.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cdr/cdr_mysql.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk-pgsql/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	install -m0600 $(PKG_BUILD_DIR)/configs/cdr_pgsql.conf.sample $(1)/etc/asterisk/cdr_pgsql.conf
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/apps/app_sql_postgres.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cdr/cdr_pgsql.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk-sqlite/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cdr/cdr_sqlite.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk-sounds/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/sounds
	$(CP) $(PKG_BUILD_DIR)/sounds/* $(1)/usr/lib/asterisk/sounds/
	rm -f $(1)/usr/lib/asterisk/sounds/*.mp3
	rm -f $(1)/usr/lib/asterisk/sounds/vm-*
endef

define Package/asterisk-voicemail/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/configs/voicemail.conf.sample $(1)/etc/asterisk/voicemail.conf
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/apps/*voicemail.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/res/res_adsi.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/sounds
	$(CP) $(PKG_BUILD_DIR)/sounds/vm-*.gsm $(1)/usr/lib/asterisk/sounds/
endef

define Package/asterisk-app-meetme/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/configs/meetme.conf.sample $(1)/etc/asterisk/meetme.conf
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/apps/app_meetme.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk-chan-bluetooth/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/configs/bluetooth.conf $(1)/etc/asterisk/bluetooth.conf
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/channels/chan_bluetooth.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk-chan-h323/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/channels/h323/h323.conf.sample $(1)/etc/asterisk/h323.conf
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/channels/chan_h323.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk-chan-mgcp/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/configs/mgcp.conf.sample $(1)/etc/asterisk/mgcp.conf
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/channels/chan_mgcp.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk-chan-skinny/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/configs/skinny.conf.sample $(1)/etc/asterisk/skinny.conf
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/channels/chan_skinny.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk-code-ilbc/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/codecs/codec_ilbc.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/formats/format_ilbc.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk-codec-lpc10/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/codecs/codec_lpc10.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk-codec-speex/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/codecs/codec_speex.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk-pbx-dundi/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/configs/dundi.conf.sample $(1)/etc/asterisk/dundi.conf
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/pbx/pbx_dundi.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk-res-agi/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/agi-bin
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/res/res_agi.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk-res-crypto/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/res/res_crypto.so $(1)/usr/lib/asterisk/modules/
endef

$(eval $(call BuildPackage,asterisk))
$(eval $(call BuildPackage,asterisk-mysql))
$(eval $(call BuildPackage,asterisk-pgsql))
$(eval $(call BuildPackage,asterisk-sqlite))
$(eval $(call BuildPackage,asterisk-sounds))
$(eval $(call BuildPackage,asterisk-voicemail))
$(eval $(call BuildPackage,asterisk-app-meetme))
$(eval $(call BuildPackage,asterisk-chan-bluetooth))
$(eval $(call BuildPackage,asterisk-chan-h323))
$(eval $(call BuildPackage,asterisk-chan-mgcp))
$(eval $(call BuildPackage,asterisk-chan-skinny))
$(eval $(call BuildPackage,asterisk-codec-ilbc))
$(eval $(call BuildPackage,asterisk-codec-lpc10))
$(eval $(call BuildPackage,asterisk-codec-speex))
$(eval $(call BuildPackage,asterisk-pbx-dundi))
$(eval $(call BuildPackage,asterisk-res-agi))
$(eval $(call BuildPackage,asterisk-res-crypto))
$(eval $(call BuildPackage,asterisk-mini))
