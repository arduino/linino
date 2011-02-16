#
# Copyright (C) 2008-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk16
PKG_VERSION:=1.6.2.14
PKG_RELEASE:=1

PKG_SOURCE:=asterisk-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.digium.com/pub/asterisk/releases/
PKG_MD5SUM:=4f0414c9b2d449222b2fc7096cbaffe7

PKG_BUILD_DIR=$(BUILD_DIR)/asterisk-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/asterisk16/Default
  SUBMENU:=asterisk16 (Complete Open Source PBX), v1.6.x
  SECTION:=net
  CATEGORY:=Network
  URL:=http://www.asterisk.org/
  MAINTAINER:=Hans Zandbelt <hans.zandbelt@gmail.com>
endef

define Package/asterisk16/Default/description
 Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
endef


define Package/asterisk16
$(call Package/asterisk16/Default)
  TITLE:=Complete open source PBX
  DEPENDS:= +libopenssl +libncurses +libpopt +libpthread +zlib @!TARGET_avr32 @!PACKAGE_asterisk14
endef

define Package/asterisk16/description
$(call Package/asterisk16/Default/description)
endef

define Package/asterisk16-sounds
$(call Package/asterisk16/Default)
  TITLE:=Sound files
  DEPENDS:= +asterisk16
endef

define Package/asterisk16-sounds/description
$(call Package/asterisk16/Default/description)
 This package contains sound files for Asterisk.
endef


define Package/asterisk16-voicemail
$(call Package/asterisk16/Default)
  TITLE:=Voicemail support
  DEPENDS:= +asterisk16
endef

define Package/asterisk16-voicemail/description
$(call Package/asterisk16/Default/description)
 This package contains voicemail related modules for Asterisk.
endef

define Package/asterisk16-app-meetme
$(call Package/asterisk16/Default)
  TITLE:=conferencing support
  DEPENDS:= +asterisk16 +dahdi-tools-libtonezone +kmod-dahdi-linux
endef

define Package/asterisk16-app-meetme/description
$(call Package/asterisk16/Default/description)
 This package provides the MeetMe application driver Conferencing support to
 Asterisk.
endef

define Package/asterisk16-chan-iax2
$(call Package/asterisk16/Default)
  TITLE:=IAX support
  DEPENDS:= +asterisk16
endef

define Package/asterisk16-chan-iax2/description
$(call Package/asterisk16/Default/description)
 This package provides IAX support to
 Asterisk.
endef

define Package/asterisk16-cdr
$(call Package/asterisk16/Default)
  TITLE:=CDR support
  DEPENDS:= +asterisk16
endef

define Package/asterisk16-cdr/description
$(call Package/asterisk16/Default/description)
 This package provides Call Detail Record support to
 Asterisk.
endef

define Package/asterisk16-res-musiconhold
$(call Package/asterisk16/Default)
  TITLE:=MOH support
  DEPENDS:= +asterisk16
endef

define Package/asterisk16-res-musiconhold/description
$(call Package/asterisk16/Default/description)
 This package provides Music On Hold support to
 Asterisk.
endef

define Package/asterisk16-chan-gtalk
$(call Package/asterisk16/Default)
  TITLE:=GTalk support
  DEPENDS:= +asterisk16 +libiksemel
endef

define Package/asterisk16-chan-gtalk/description
$(call Package/asterisk16/Default/description)
 This package provides the channel chan_gtalk and res_jabber for GTalk
 support to Asterisk.
endef

define Package/asterisk16-curl
$(call Package/asterisk16/Default)
  TITLE:=CURL support
  DEPENDS:= +asterisk16 +libcurl
endef

define Package/asterisk16-curl/description
$(call Package/asterisk16/Default/description)
 This package provides CURL
 support to Asterisk.
endef
 
ifneq ($(SDK)$(CONFIG_PACKAGE_asterisk16-app-meetme),)
  CONFIGURE_ARGS+= \
	--with-dahdi="$(STAGING_DIR)/usr"
else
  CONFIGURE_ARGS+= \
	--without-dahdi
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_asterisk16-chan-gtalk),)
  CONFIGURE_ARGS+= \
	--with-gnutls="$(STAGING_DIR)/usr" \
	--with-iksemel="$(STAGING_DIR)/usr"
  SITE_VARS+= \
	ac_cv_lib_iksemel_iks_start_sasl=yes \
	ac_cv_lib_gnutls_gnutls_bye=yes
else
  CONFIGURE_ARGS+= \
	--without-gnutls \
	--without-iksemel
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_asterisk16-curl),)
  CONFIGURE_ARGS+= \
	--with-curl="$(STAGING_DIR)/usr"
else
  CONFIGURE_ARGS+= \
	--without-curl
endif

CONFIGURE_ARGS+= \
	--without-curses \
	--with-gsm=internal \
	--without-gtk \
	--without-gtk2 \
	--without-isdnnet \
	--without-kde \
	--without-misdn \
	--without-nbs \
	--with-ncurses="$(STAGING_DIR)/usr" \
	--without-netsnmp \
	--without-newt \
	--without-odbc \
	--without-ogg \
	--without-osptk \
	--with-popt="$(STAGING_DIR)/usr" \
	--without-pri \
	--without-qt \
	--without-radius \
	--without-sdl \
	--without-spandsp \
	--without-suppserv \
	--without-tds \
	--without-termcap \
	--without-tinfo \
	--without-vorbis \
	--without-vpb \
	--with-z="$(STAGING_DIR)/usr" \
	--disable-xmldoc

EXTRA_CFLAGS+= $(TARGET_CPPFLAGS)
EXTRA_LDFLAGS+= $(TARGET_LDFLAGS)

define Build/Configure
	-rm $(PKG_BUILD_DIR)/menuselect.makeopts
	$(call Build/Configure/Default,,$(SITE_VARS))
endef

define Build/Compile
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		include/asterisk/version.h \
		include/asterisk/buildopts.h defaults.h \
		makeopts.embed_rules
	ASTCFLAGS="$(EXTRA_CFLAGS) -DLOW_MEMORY" \
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

#define Build/InstallDev
#	$(INSTALL_DIR) $(1)/usr/include/asterisk/
#	$(CP) $(PKG_INSTALL_DIR)/usr/include/asterisk/*.h $(1)/usr/include/asterisk/
#	$(CP) $(PKG_INSTALL_DIR)/usr/include/asterisk.h $(1)/usr/include/
#endef

define Package/asterisk16/conffiles
/etc/asterisk/asterisk.conf
/etc/asterisk/modules.conf
/etc/asterisk/extensions.conf
/etc/asterisk/sip.conf
/etc/asterisk/sip_notify.conf
/etc/asterisk/features.conf
/etc/asterisk/indications.conf
/etc/asterisk/logger.conf
/etc/asterisk/manager.conf
/etc/asterisk/rtp.conf
/etc/default/asterisk
/etc/init.d/asterisk
endef

define Package/asterisk16/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	for f in asterisk extensions features \
		indications logger manager modules \
		sip sip_notify rtp; do \
		$(CP) $(PKG_INSTALL_DIR)/etc/asterisk/$$$$f.conf $(1)/etc/asterisk/ ; \
	done
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	for f in app_dial app_echo app_playback app_macro \
		chan_sip \
		codec_ulaw codec_gsm \
		format_gsm format_pcm format_wav format_wav_gsm \
		pbx_config \
		func_strings func_timeout func_callerid func_logic; do \
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/$$$$f.so $(1)/usr/lib/asterisk/modules/ ; \
	done
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/asterisk $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_DATA)  ./files/asterisk.default $(1)/etc/default/asterisk
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN)  ./files/asterisk.init $(1)/etc/init.d/asterisk
endef

define Package/asterisk16-sounds/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/sounds/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/asterisk/sounds/en/* $(1)/usr/lib/asterisk/sounds/
	rm -f $(1)/usr/lib/asterisk/sounds/vm-*
	rm -f $(1)/usr/lib/asterisk/sounds/conf-*
endef


define Package/asterisk16-voicemail/conffiles
/etc/asterisk/voicemail.conf
endef

define Package/asterisk16-voicemail/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/voicemail.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/*voicemail.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/res_adsi.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/sounds/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/asterisk/sounds/en/vm-*.gsm $(1)/usr/lib/asterisk/sounds/
endef

define Package/asterisk16-app-meetme/conffiles
/etc/asterisk/meetme.conf
endef

define Package/asterisk16-app-meetme/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/meetme.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/app_meetme.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/chan_dahdi.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/sounds/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/asterisk/sounds/en/conf-*.gsm $(1)/usr/lib/asterisk/sounds/
endef

define Package/asterisk16-chan-iax2/conffiles
/etc/asterisk/iax.conf
/etc/asterisk/iaxprov.conf
endef

define Package/asterisk16-cdr/conffiles
/etc/asterisk/cdr.conf
/etc/asterisk/cdr_custom.conf
/etc/asterisk/cdr_manager.conf
/etc/asterisk/cdr_odbc.conf
/etc/asterisk/cdr_pgsql.conf
/etc/asterisk/cdr_tds.conf
endef

define Package/asterisk16-res-musiconhold/conffiles
/etc/asterisk/musiconhold.conf
endef

define Package/asterisk16-chan-iax2/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/iax.conf $(1)/etc/asterisk/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/iaxprov.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/chan_iax2.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk16-cdr/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/cdr*.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/*cdr*.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk16-res-musiconhold/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/musiconhold.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/res_musiconhold.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk16-chan-gtalk/conffiles
/etc/asterisk/gtalk.conf
/etc/asterisk/jabber.conf
endef

define Package/asterisk16-chan-gtalk/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/gtalk.conf $(1)/etc/asterisk/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/asterisk/jabber.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/chan_gtalk.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/res_jabber.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk16-curl/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/func_curl.so $(1)/usr/lib/asterisk/modules/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/res_curl.so $(1)/usr/lib/asterisk/modules/
endef

define BuildAsterisk16ModuleTemplate

  define Package/asterisk16-$(subst _,-,$(1))
  $$(call Package/asterisk16/Default)
    TITLE:=$(2) support
    DEPENDS:= +asterisk16
  endef

  define Package/asterisk16-$(subst _,-,$(1))/description
  $$(call Package/asterisk16/Default/description)
    This package provides support $(3) in Asterisk.
  endef

  define Package/asterisk16-$(subst _,-,$(1))/install
	$(INSTALL_DIR) $$(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/$(1).so $$(1)/usr/lib/asterisk/modules/
  endef

  $$(eval $$(call BuildPackage,asterisk16-$(subst _,-,$(1))))
endef

$(eval $(call BuildPackage,asterisk16))
$(eval $(call BuildPackage,asterisk16-voicemail))
$(eval $(call BuildPackage,asterisk16-sounds))
#$(eval $(call BuildPackage,asterisk16-app-meetme))
$(eval $(call BuildPackage,asterisk16-chan-iax2))
$(eval $(call BuildPackage,asterisk16-cdr))
$(eval $(call BuildPackage,asterisk16-res-musiconhold))
$(eval $(call BuildPackage,asterisk16-chan-gtalk))
$(eval $(call BuildPackage,asterisk16-curl))
$(eval $(call BuildAsterisk16ModuleTemplate,app_authenticate,Authenticate,support for executing arbitrary authenticate commands))
$(eval $(call BuildAsterisk16ModuleTemplate,app_chanisavail,Channel availability check,support for checking if a channel is available))
$(eval $(call BuildAsterisk16ModuleTemplate,app_chanspy,Channel listen in,support for listening in on any channel))
$(eval $(call BuildAsterisk16ModuleTemplate,app_directed_pickup,Directed call pickup,support for directed call pickup))
$(eval $(call BuildAsterisk16ModuleTemplate,app_exec,Exec application,support for application execution))
$(eval $(call BuildAsterisk16ModuleTemplate,app_minivm,Minimal voicemail system,a voicemail system in small building blocks working together based on the Comedian Mail voicemail system))
$(eval $(call BuildAsterisk16ModuleTemplate,app_readexten,Extension to variable,a trivial application to read an extension into a variable))
$(eval $(call BuildAsterisk16ModuleTemplate,app_read,Variable read,a trivial application to read a variable))
$(eval $(call BuildAsterisk16ModuleTemplate,app_sayunixtime,Say Unix time,an application to say Unix time))
$(eval $(call BuildAsterisk16ModuleTemplate,app_sms,SMS,SMS support (ETSI ES 201 912 protocol 1)))
$(eval $(call BuildAsterisk16ModuleTemplate,app_stack,Stack applications, stack applications Gosub Return etc.))
$(eval $(call BuildAsterisk16ModuleTemplate,app_system,System exec,support for executing system commands))
$(eval $(call BuildAsterisk16ModuleTemplate,app_talkdetect,File playback with audio detect,for file playback with audio detect))
$(eval $(call BuildAsterisk16ModuleTemplate,app_waituntil,Sleep,support sleeping until the given epoch))
$(eval $(call BuildAsterisk16ModuleTemplate,app_while,While loop,a while loop implementation))
$(eval $(call BuildAsterisk16ModuleTemplate,chan_agent,Agents proxy channel, an implementation of agents proxy channel))
$(eval $(call BuildAsterisk16ModuleTemplate,chan_local,Local proxy channel, an implementation of local proxy channel))
$(eval $(call BuildAsterisk16ModuleTemplate,codec_ulaw,Signed linear to ulaw translation,translation between signed linear and ulaw codecs))
$(eval $(call BuildAsterisk16ModuleTemplate,codec_a_mu,Alaw to ulaw translation,translation between alaw and ulaw codecs))
$(eval $(call BuildAsterisk16ModuleTemplate,codec_g726,Signed linear to G.726 translation,translation between signed linear and ITU G.726-32kbps codecs))
$(eval $(call BuildAsterisk16ModuleTemplate,format_g726,G.726,support for headerless G.726 16/24/32/40kbps data format))
$(eval $(call BuildAsterisk16ModuleTemplate,format_g729,G.729,support for raw headerless G729 data))
$(eval $(call BuildAsterisk16ModuleTemplate,format_sln,Raw slinear format,support for raw slinear format))
$(eval $(call BuildAsterisk16ModuleTemplate,format_sln16,Raw slinear 16 format,support for Raw slinear 16 format))
$(eval $(call BuildAsterisk16ModuleTemplate,func_db,Database interaction,functions for interaction with the database))
$(eval $(call BuildAsterisk16ModuleTemplate,func_devstate,Blinky lights control,functions for manually controlled blinky lights))
$(eval $(call BuildAsterisk16ModuleTemplate,func_vmcount,vmcount dialplan,a vmcount dialplan function))
$(eval $(call BuildAsterisk16ModuleTemplate,func_extstate,Hinted extension state,retrieving the state of a hinted extension for dialplan control))
$(eval $(call BuildAsterisk16ModuleTemplate,func_global,Global variable,global variable dialplan functions))
$(eval $(call BuildAsterisk16ModuleTemplate,func_shell,Shell,support for shell execution))
$(eval $(call BuildAsterisk16ModuleTemplate,pbx_ael,Asterisk Extension Logic,support for symbolic Asterisk Extension Logic))
$(eval $(call BuildAsterisk16ModuleTemplate,res_ael_share,Shareable AEL code,support for shareable AEL code mainly between internal and external modules))
$(eval $(call BuildAsterisk16ModuleTemplate,pbx_spool,Call Spool,outgoing call spool support))
$(eval $(call BuildAsterisk16ModuleTemplate,res_agi,Asterisk Gateway Interface,support for the Asterisk Gateway Interface extension))
$(eval $(call BuildAsterisk16ModuleTemplate,app_alarmreceiver,Alarm receiver,Central Station Alarm receiver for Ademco Contact ID))
$(eval $(call BuildAsterisk16ModuleTemplate,app_setcallerid,Set callerid,support for setting callerid))
$(eval $(call BuildAsterisk16ModuleTemplate,app_verbose,Verbose logging,Verbose logging application))
$(eval $(call BuildAsterisk16ModuleTemplate,func_channel,Channel info,Channel info dialplan function))
$(eval $(call BuildAsterisk16ModuleTemplate,func_blacklist,Blacklist on callerid,looking up the callerid number, and see if it is blacklisted))
$(eval $(call BuildAsterisk16ModuleTemplate,app_originate,Originate a call,originating an outbound call and connecting it to a specified extension or application))
