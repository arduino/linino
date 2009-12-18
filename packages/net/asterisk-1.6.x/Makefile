#
# Copyright (C) 2008-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk
PKG_VERSION:=1.6.2.0-rc6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.digium.com/pub/asterisk/releases/
PKG_MD5SUM:=770a80d306ccc928481ff9030d7fec38

include $(INCLUDE_DIR)/package.mk

define Package/asterisk16/Default
  SUBMENU:=asterisk16 (Complete Open Source PBX), v1.6.x
  SECTION:=net
  CATEGORY:=Network
  URL:=http://www.asterisk.org/
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

define Package/asterisk16-chan-local
$(call Package/asterisk16/Default)
  TITLE:=chan_local support
  DEPENDS:= +asterisk16
endef

define Package/asterisk16-chan-local/description
$(call Package/asterisk16/Default/description)
 This package provides chan_local support to
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

define Package/asterisk16-format-g729
$(call Package/asterisk16/Default)
  TITLE:=G.729 support
  DEPENDS:= +asterisk16
endef

define Package/asterisk16-format-g729/description
$(call Package/asterisk16/Default/description)
 This package provides G.729 support to
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

define Package/asterisk16-app-system
$(call Package/asterisk16/Default)
  TITLE:=System exec support
  DEPENDS:= +asterisk16
endef

define Package/asterisk16-app-system/description
$(call Package/asterisk16/Default/description)
 This package provides support for executing system commands in Asterisk.
endef

CONFIGURE_ARGS+= \
	--without-curl \
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
	--disable-xmldoc \

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

EXTRA_CFLAGS:= $(TARGET_CPPFLAGS)
EXTRA_LDFLAGS:= $(TARGET_LDFLAGS)

define Build/Configure
	-rm $(PKG_BUILD_DIR)/menuselect.makeopts
	$(call Build/Configure/Default,,$(SITE_VARS))
endef

define Build/Compile
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		include/asterisk/version.h \
		include/asterisk/buildopts.h defaults.h \
		makeopts.embed_rules
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
/etc/asterisk/logger.conf
/etc/asterisk/manager.conf
/etc/asterisk/rtp.conf
/etc/default/asterisk
/etc/init.d/asterisk
endef

define Package/asterisk16/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	for f in asterisk extensions features \
		logger manager modules \
		sip sip_notify rtp; do \
		$(CP) $(PKG_INSTALL_DIR)/etc/asterisk/$$$$f.conf $(1)/etc/asterisk/ ; \
	done
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	for f in app_dial app_echo app_playback app_macro \
		chan_sip \
		codec_ulaw codec_gsm \
		format_gsm format_pcm format_wav format_wav_gsm \
		pbx_config \
		func_strings func_timeout func_callerid; do \
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

define Package/asterisk16-chan-local/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/chan_local.so $(1)/usr/lib/asterisk/modules/
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

define Package/asterisk16-format-g729/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/format_g729.so $(1)/usr/lib/asterisk/modules/
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

define Package/asterisk16-app-system/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/app_system.so $(1)/usr/lib/asterisk/modules/
endef

$(eval $(call BuildPackage,asterisk16))
$(eval $(call BuildPackage,asterisk16-voicemail))
$(eval $(call BuildPackage,asterisk16-sounds))
#$(eval $(call BuildPackage,asterisk16-app-meetme))
$(eval $(call BuildPackage,asterisk16-chan-iax2))
$(eval $(call BuildPackage,asterisk16-chan-local))
$(eval $(call BuildPackage,asterisk16-cdr))
$(eval $(call BuildPackage,asterisk16-res-musiconhold))
$(eval $(call BuildPackage,asterisk16-format-g729))
$(eval $(call BuildPackage,asterisk16-chan-gtalk))
$(eval $(call BuildPackage,asterisk16-app-system))
