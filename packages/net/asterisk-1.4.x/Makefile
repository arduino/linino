#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk
PKG_VERSION:=1.4.11
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.digium.com/pub/asterisk/old-releases/
PKG_MD5SUM:=3ba9b399fedc68de4845b1c5603d167c

PKG_BUILD_DEPENDS:= libopenh323 pwlib

include $(INCLUDE_DIR)/package.mk

define Package/asterisk14/Default
  SUBMENU:=asterisk14 (Complete Open Source PBX), v1.4.x
  SECTION:=net
  CATEGORY:=Network
endef

define Package/asterisk14/Default/description
 Asterisk is a complete PBX in software. It provides all of the features 
 you would expect from a PBX and more. Asterisk does voice over IP in three 
 protocols, and can interoperate with almost all standards-based telephony 
 equipment using relatively inexpensive hardware.
  URL:=http://www.asterisk.org/
endef


define Package/asterisk14
$(call Package/asterisk14/Default)
  TITLE:=Complete open source PBX
  DEPENDS:= +libltdl +libncurses +libpopt +libpthread
endef

define Package/asterisk14/description
$(call Package/asterisk14/Default/description)
endef


define Package/asterisk14-mini
$(call Package/asterisk14/Default)
  TITLE:=Minimal open source PBX
  DEPENDS:=+libncurses +libpthread
endef

define Package/asterisk14-mini/description
$(call Package/asterisk14/Default/description)
 This package contains only the following modules:
 - app_dial
 - chan_iax2
 - chan_local
 - chan_sip
 - codec_gsm
 - codec_ulaw
 - format_gsm
 - format_pcm
 - format_wav
 - format_wav_gsm
 - pbx_config
 - res_features
 - res_musiconhold
endef


define Package/asterisk14-chan-alsa
$(call Package/asterisk14/Default)
  TITLE:=ALSA soundcards support
  DEPENDS:= +asterisk14 +alsa-lib
endef

define Package/asterisk14-chan-alsa/description
$(call Package/asterisk14/Default/description)
 This package provides the channel driver for ALSA sound cards support to 
 Asterisk.
endef


define Package/asterisk14-chan-gtalk
$(call Package/asterisk14/Default)
  TITLE:=GTalk support
  DEPENDS:= +asterisk14 +libiksemel
endef

define Package/asterisk14-chan-gtalk/description
$(call Package/asterisk14/Default/description)
 This package provides the channel chan_gtalk and res_jabber for GTalk 
 support to Asterisk.
endef


define Package/asterisk14-chan-h323
$(call Package/asterisk14/Default)
  TITLE:=H.323 support for Asterisk
  DEPENDS:= +asterisk14 +uclibcxx
endef

define Package/asterisk14-chan-h323/description
$(call Package/asterisk14/Default/description)
 This package provides H.323 support to Asterisk.
endef


define Package/asterisk14-chan-mgcp
$(call Package/asterisk14/Default)
  TITLE:=MGCP support
  DEPENDS:= +asterisk14
endef

define Package/asterisk14-chan-mgcp/description
$(call Package/asterisk14/Default/description)
 This package provides MGCP (Media Gateway Control Protocol) support \\\
 to Asterisk.
endef


define Package/asterisk14-chan-skinny
$(call Package/asterisk14/Default)
  TITLE:=Skinny Client Control Protocol support
  DEPENDS:= +asterisk14
endef

define Package/asterisk14-chan-skinny/description
$(call Package/asterisk14/Default/description)
 This package provided Skinny Client Control Protocol support to \\\
 Asterisk.
endef


define Package/asterisk14-codec-ilbc
$(call Package/asterisk14/Default)
  TITLE:=ILBC Translator
  DEPENDS:= +asterisk14
endef

define Package/asterisk14-codec-ilbc/description
$(call Package/asterisk14/Default/description)
 This package contains the ILBC (Internet Low Bitrate Codec) translator 
 for Asterisk.
endef


define Package/asterisk14-codec-lpc10
$(call Package/asterisk14/Default)
  TITLE:=LPC10 2.4kbps voice codec Translator
  DEPENDS:= +asterisk14
endef

define Package/asterisk14-chan-lpc10/description
$(call Package/asterisk14/Default/description)
 This package contains the LPC10 (Linear Predictor Code) 2.4kbps voice 
 codec translator for Asterisk.
endef


define Package/asterisk14-codec-speex
$(call Package/asterisk14/Default)
  TITLE:=Speex/PCM16 Codec Translator
  DEPENDS:= +asterisk14 +libspeex
endef

define Package/asterisk14-chan-speex/description
$(call Package/asterisk14/Default/description)
 This package contains the Speex speech compression codec translator for 
 Asterisk.
endef


define Package/asterisk14-pbx-dundi
$(call Package/asterisk14/Default)
  TITLE:=DUNDi support
  DEPENDS:= +asterisk14
endef

define Package/asterisk14-pbx-dundi/description
$(call Package/asterisk14/Default/description)
 This package provides DUNDi (Distributed Universal Number Discovery) 
 support to Asterisk.
endef


define Package/asterisk14-res-agi
$(call Package/asterisk14/Default)
  TITLE:=AGI support
  DEPENDS:= +asterisk14
endef

define Package/asterisk14-res-agi/description
$(call Package/asterisk14/Default/description)
 This package provides AGI (Asterisk Gateway Interface) support to 
 Asterisk.
endef


define Package/asterisk14-res-crypto
$(call Package/asterisk14/Default)
  TITLE:=Cryptographic Digital Signatures support
  DEPENDS:= +asterisk14 +libopenssl
endef

define Package/asterisk14-res-crypto/description
$(call Package/asterisk14/Default/description)
 This package provides Cryptographic Digital Signatures support to 
 Asterisk.
endef


define Package/asterisk14-pgsql
$(call Package/asterisk14/Default)
  TITLE:=PostgreSQL support
  DEPENDS:= +asterisk14 +libpq
endef

define Package/asterisk14-pgsql/description
$(call Package/asterisk14/Default/description)
 This package contains PostgreSQL support modules for Asterisk.
endef


define Package/asterisk14-sqlite
$(call Package/asterisk14/Default)
  TITLE:=SQLite modules
  DEPENDS:= +asterisk14 +libsqlite2
endef

define Package/asterisk14-sqlite/description
$(call Package/asterisk14/Default/description)
 This package contains SQLite support modules for Asterisk.
endef


define Package/asterisk14-sounds
$(call Package/asterisk14/Default)
  TITLE:=Sound files
  DEPENDS:= +asterisk14
endef

define Package/asterisk14-sounds/description
$(call Package/asterisk14/Default/description)
 This package contains sound files for Asterisk.
endef


define Package/asterisk14-voicemail
$(call Package/asterisk14/Default)
  TITLE:=Voicemail support
  DEPENDS:= +asterisk14
endef

define Package/asterisk14-voicemail/description
$(call Package/asterisk14/Default/description)
 This package contains voicemail related modules for Asterisk.
endef


CONFIGURE_ARGS+= \
	--without-curl \
	--without-curses \
	--without-gsm \
	--without-imap \
	--without-isdnnet \
	--without-kde \
	--with-ltdl="$(STAGING_DIR)/usr" \
	--without-misdn \
	--without-nbs \
	--with-ncurses="$(STAGING_DIR)/usr" \
	--without-netsnmp \
	--without-newt \
	--without-odbc \
	--without-ogg \
	--without-osptk \
	--without-oss \
	--with-popt="$(STAGING_DIR)/usr" \
	--without-pri \
	--without-qt \
	--without-radius \
	--without-spandsp \
	--without-suppserv \
	--without-tds \
	--without-termcap \
	--without-tinfo \
	--without-tonezone \
	--without-vorbis \
	--without-vpb \
	--with-z="$(STAGING_DIR)/usr" \
	--without-zaptel \

EXTRA_CFLAGS:= $(TARGET_CPPFLAGS)
EXTRA_LDFLAGS:= $(TARGET_LDFLAGS)

ifneq ($(SDK)$(CONFIG_PACKAGE_asterisk14-chan-alsa),)
  CONFIGURE_ARGS+= \
	--with-asound="$(STAGING_DIR)/usr"
else
  CONFIGURE_ARGS+= \
	--without-asound
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_asterisk14-chan-gtalk),)
  CONFIGURE_ARGS+= \
	--with-gnutls="$(STAGING_DIR)/usr" \
	--with-iksemel="$(STAGING_DIR)/usr"
else
  CONFIGURE_ARGS+= \
	--without-gnutls \
	--without-iksemel
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_asterisk14-chan-h323),)
  CONFIGURE_ARGS+= \
	--with-h323="$(BUILD_DIR)/openh323" \
	--with-pwlib="$(BUILD_DIR)/pwlib"
  CONFIGURE_VARS+= \
	LIBS="$$$$LIBS -luClibc++ -ldl -lpthread"

  define Build/Compile/chan-h323
	$(MAKE) -C "$(PKG_BUILD_DIR)/channels/h323" \
		$(TARGET_CONFIGURE_OPTS) \
		CXXLIBS="-nodefaultlibs -luClibc++" \
		optnoshared
  endef
else
  CONFIGURE_ARGS+= \
	--without-h323 \
	--without-pwlib
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_asterisk14-codec-speex),)
  CONFIGURE_ARGS+= \
	--with-speex="$(STAGING_DIR)/usr"
  EXTRA_CFLAGS+= -I$(STAGING_DIR)/usr/include/speex
else
  CONFIGURE_ARGS+= \
	--without-speex
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_asterisk14-res-crypto),)
  CONFIGURE_ARGS+= \
	--with-ssl="$(STAGING_DIR)/usr"
else
  CONFIGURE_ARGS+= \
	--without-ssl
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_asterisk14-pgsql),)
  CONFIGURE_ARGS+= \
	--with-postgres="$(STAGING_DIR)/usr"
else
  CONFIGURE_ARGS+= \
	--without-postgres
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_asterisk14-sqlite),)
  CONFIGURE_ARGS+= \
	--with-sqlite="$(STAGING_DIR)/usr"
else
  CONFIGURE_ARGS+= \
	--without-sqlite
endif


define Build/Configure
	( cd $(PKG_BUILD_DIR); ./bootstrap.sh )
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		include/asterisk/version.h \
		include/asterisk/buildopts.h defaults.h \
		makeopts.embed_rules
	$(call Build/Compile/chan-h323)
	ASTCFLAGS="$(EXTRA_CFLAGS) -DLOW_MEMORY $(TARGET_CFLAGS)" \
	ASTLDFLAGS="$(EXTRA_LDFLAGS)" \
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		ASTVARLIBDIR="/usr/lib/asterisk" \
		NOISY_BUILD="1" \
		DEBUG="" \
		OPTIMIZE="" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install samples
	$(SED) 's|/var/lib/asterisk|/usr/lib/asterisk|g' $(PKG_INSTALL_DIR)/etc/asterisk/musiconhold.conf
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include/asterisk/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/asterisk/*.h $(1)/usr/include/asterisk/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/asterisk.h $(1)/usr/include/
endef


define Package/asterisk14/conffiles
/etc/asterisk/agents.conf
/etc/asterisk/alarmreceiver.conf
/etc/asterisk/amd.conf
/etc/asterisk/asterisk.conf
/etc/asterisk/cdr.conf
/etc/asterisk/cdr_custom.conf
/etc/asterisk/cdr_manager.conf
/etc/asterisk/codecs.conf
/etc/asterisk/dnsmgr.conf
/etc/asterisk/enum.conf
/etc/asterisk/extconfig.conf
/etc/asterisk/extensions.ael
/etc/asterisk/extensions.conf
/etc/asterisk/features.conf
/etc/asterisk/followme.conf
/etc/asterisk/http.conf
/etc/asterisk/iax.conf
/etc/asterisk/iaxprov.conf
/etc/asterisk/indications.conf
/etc/asterisk/logger.conf
/etc/asterisk/manager.conf
/etc/asterisk/misdn.conf
/etc/asterisk/modules.conf
/etc/asterisk/musiconhold.conf
/etc/asterisk/muted.conf
/etc/asterisk/osp.conf
/etc/asterisk/privacy.conf
/etc/asterisk/queues.conf
/etc/asterisk/rtp.conf
/etc/asterisk/say.conf
/etc/asterisk/sip.conf
/etc/asterisk/sip_notify.conf
/etc/asterisk/sla.conf
/etc/asterisk/smdi.conf
/etc/asterisk/udptl.conf
/etc/asterisk/users.conf
endef

define Package/asterisk14/postinst
#!/bin/sh
ROOT=`echo $${PKG_ROOT} | sed 's:[\/]:\\\&:g' -`
/bin/sed -i 's/\ \/etc/\ '$${ROOT}'etc/g' $${PKG_ROOT}/etc/asterisk/asterisk.conf
/bin/sed -i 's/\ \/var/\ '$${ROOT}'var/g' $${PKG_ROOT}/etc/asterisk/asterisk.conf
/bin/sed -i 's/\ \/usr/\ '$${ROOT}'usr/g' $${PKG_ROOT}/etc/asterisk/asterisk.conf
/bin/sed -i 's/^DEST=/DEST='$${ROOT}'/g' $${PKG_ROOT}/etc/init.d/asterisk
/bin/sed -i 's/OPTIONS=\"\"/OPTIONS=\"-C\ '$${ROOT}'etc\/asterisk\/asterisk.conf\"/g' $${PKG_ROOT}/etc/default/asterisk
endef

define Package/asterisk14/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
	rm -rf $(1)/usr/sbin/astgenkey
	rm -rf $(1)/usr/sbin/aelparse
	rm -rf $(1)/usr/sbin/autosupport
	rm -rf $(1)/usr/sbin/muted
	rm -rf $(1)/usr/sbin/stereorize
	rm -rf $(1)/usr/bin
	rm -rf $(1)/usr/man
	rm -rf $(1)/usr/include
	rm -rf $(1)/var/spool/asterisk/meetme
	rm -rf $(1)/var/spool/asterisk/voicemail
	(cd $(1)/usr/lib/asterisk; \
		rm -rf agi-bin; \
		rm -rf images; \
		rm -rf keys/*; \
		rm -rf moh/*.wav; \
		rm -rf sounds/*; \
		cd modules; \
		rm -rf	*adsi* *festival* *modem* *oss* *phone* *intercom* \
			*mp3* *nbscat* *sqlite* *mysql* *postgres* *pgsql* \
			*voicemail* *speex* *flash* *page* *zap* *jpeg* \
			*snmp* \
			chan_alsa.so \
			chan_gtalk.so \
			chan_h323.so \
			chan_mgcp.so \
			chan_skinny.so \
			{codec,format}_ilbc.so \
			codec_lpc10.so \
			pbx_dundi.so \
			res_agi.so \
			res_crypto.so \
			res_jabber.so \
	)
	(cd $(1)/etc/asterisk; \
		rm -f 	*odbc* *mysql* *postgres* *pgsql* *voicemail* \
			*adsi* *oss* *alsa* *festival* *modem* *phone* \
			*tds* *vofr* *rpt* *vpb* *snmp* \
			*zapata* \
			alsa.conf \
			dundi.conf \
			gtalk.conf \
			h323.conf \
			jabber.conf \
			mgcp.conf \
			skinny.conf \
	)
	$(INSTALL_DATA) ./files/modules.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_DATA)  ./files/asterisk.default $(1)/etc/default/asterisk
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN)  ./files/asterisk.init $(1)/etc/init.d/asterisk
endef


define Package/asterisk14-mini/conffiles
/etc/asterisk/asterisk.conf
/etc/asterisk/enum.conf
/etc/asterisk/extconfig.conf
/etc/asterisk/extensions.conf
/etc/asterisk/features.conf
/etc/asterisk/http.conf
/etc/asterisk/iax.conf
/etc/asterisk/iaxprov.conf
/etc/asterisk/logger.conf
/etc/asterisk/manager.conf
/etc/asterisk/modules.conf
/etc/asterisk/musiconhold.conf
/etc/asterisk/rtp.conf
/etc/asterisk/sip.conf
/etc/asterisk/sip_notify.conf
/etc/asterisk/users.conf
endef

define Package/asterisk14-mini/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	for f in asterisk enum extconfig extensions features http \
		iax iaxprov logger manager modules musiconhold rtp \
		sip sip_notify users; do \
	  $(CP) $(PKG_INSTALL_DIR)/etc/asterisk/$$$$f.conf $(1)/etc/asterisk/ ; \
	done
	$(INSTALL_DATA) ./files/modules.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/asterisk/firmware $(1)/usr/lib/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/keys
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	for f in app_dial chan_iax2 chan_local chan_sip codec_gsm \
		codec_ulaw format_gsm format_pcm format_wav format_wav_gsm \
		pbx_config res_features res_musiconhold; do \
	  $(CP) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/$$$$f.so $(1)/usr/lib/asterisk/modules/ ; \
	done
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/moh
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/sounds
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/asterisk $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/safe_asterisk $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_DATA)  ./files/asterisk.default $(1)/etc/default/asterisk
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN)  ./files/asterisk.init $(1)/etc/init.d/asterisk
endef


define Package/asterisk14-chan-alsa/conffiles
/etc/asterisk/alsa.conf
endef

define Package/asterisk14-chan-alsa/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/alsa.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/chan_alsa.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-chan-gtalk/conffiles
/etc/asterisk/gtalk.conf
/etc/asterisk/jabber.conf
endef

define Package/asterisk14-chan-gtalk/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/gtalk.conf $(1)/etc/asterisk/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/jabber.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/chan_gtalk.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/res_jabber.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-chan-h323/conffiles
/etc/asterisk/h323.conf
endef

define Package/asterisk14-chan-h323/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/h323.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/chan_h323.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-chan-mgcp/install
/etc/asterisk/mgcp.conf
endef

define Package/asterisk14-chan-mgcp/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/mgcp.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/chan_mgcp.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-chan-skinny/conffiles
/etc/asterisk/skinny.conf
endef

define Package/asterisk14-chan-skinny/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/skinny.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/chan_skinny.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-codec-ilbc/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/codec_ilbc.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/format_ilbc.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-codec-lpc10/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/codec_lpc10.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-codec-speex/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/codec_speex.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-pbx-dundi/conffiles
/etc/asterisk/dundi.conf
endef

define Package/asterisk14-pbx-dundi/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/dundi.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/pbx_dundi.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-res-agi/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/agi-bin
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/res_agi.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-res-crypto/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/res_crypto.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-pgsql/conffiles
/etc/asterisk/cdr_pgsql.conf
/etc/asterisk/res_pgsql.conf
endef

define Package/asterisk14-pgsql/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	install -m0600 $(PKG_INSTALL_DIR)/etc/asterisk/cdr_pgsql.conf $(1)/etc/asterisk/
	install -m0600 $(PKG_INSTALL_DIR)/etc/asterisk/res_pgsql.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/cdr_pgsql.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/res_config_pgsql.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-sqlite/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/cdr_sqlite.so $(1)/usr/lib/asterisk/modules/
endef


define Package/asterisk14-sounds/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/sounds
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/asterisk/sounds/* $(1)/usr/lib/asterisk/sounds/
	rm -f $(1)/usr/lib/asterisk/sounds/vm-*
	rm -f $(1)/usr/lib/asterisk/sounds/x
endef


define Package/asterisk14-voicemail/conffiles
/etc/asterisk/voicemail.conf
endef

define Package/asterisk14-voicemail/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/voicemail.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/*voicemail.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/res_adsi.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/sounds
	$(CP) $(PKG_INSTALL_DIR)//usr/lib/asterisk/sounds/vm-*.gsm $(1)/usr/lib/asterisk/sounds/
endef


$(eval $(call BuildPackage,asterisk14))
$(eval $(call BuildPackage,asterisk14-mini))
$(eval $(call BuildPackage,asterisk14-chan-alsa))
$(eval $(call BuildPackage,asterisk14-chan-gtalk))
$(eval $(call BuildPackage,asterisk14-chan-h323))
$(eval $(call BuildPackage,asterisk14-chan-mgcp))
$(eval $(call BuildPackage,asterisk14-chan-skinny))
$(eval $(call BuildPackage,asterisk14-codec-ilbc))
$(eval $(call BuildPackage,asterisk14-codec-lpc10))
$(eval $(call BuildPackage,asterisk14-codec-speex))
$(eval $(call BuildPackage,asterisk14-pbx-dundi))
$(eval $(call BuildPackage,asterisk14-res-agi))
$(eval $(call BuildPackage,asterisk14-res-crypto))
$(eval $(call BuildPackage,asterisk14-pgsql))
$(eval $(call BuildPackage,asterisk14-sqlite))
$(eval $(call BuildPackage,asterisk14-voicemail))
$(eval $(call BuildPackage,asterisk14-sounds))
