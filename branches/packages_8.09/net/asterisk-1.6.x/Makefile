#
# Copyright (C) 2008-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

# TODO:
# - create smaller default config files (sip.conf and extensions.conf)
# - ldd /usr/sbin/asterisk result:
#   + libssl.so.0.9.8 dep. is missing (and zlib sub dep.) => libopenssl
#   + libcrypto.so.0.9.8 dep. is missing => libopenssl
#   => need 1063071 and 223551 bytes!
# - asterisk -cvvv
#   + load_dynamic_module: Error loading module 'func_strings.so': File not found 
#   + Unable to open Asterisk database '/var/lib/asterisk/astdb
#   + Error loading module 'res_musiconhold.so': File not found
# - mkdir -p /var/lib/asterisk/
# - app_echo.so need app_playback.so
# - I need app_macro.so
# - Function "CALLERID not registered
#
# Changelog:
# 20090111 nm build brcm47xx failde: add --without-sdl to CONFIGURE_ARGS
#             build x86: Package gtk+-2.0 was not found in the pkg-config search path.
#              => --without-gtk and --without-gtk2 added to CONFIGURE_ARGS but libpopt
#                 is needed

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk
PKG_VERSION:=1.6.1-rc1
PKG_RELEASE:=1.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.digium.com/pub/asterisk/releases/
PKG_MD5SUM:=29f7285b673d52b49d91c8e797acbbb0

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
  DEPENDS:= +libncurses +libpopt +libpthread +zlib @!TARGET_avr32 @!PACKAGE_asterisk14
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

ifneq ($(SDK)$(CONFIG_PACKAGE_asterisk16-app-meetme),)
  CONFIGURE_ARGS+= \
	--with-dahdi="$(STAGING_DIR)/usr"
else
  CONFIGURE_ARGS+= \
	--without-dahdi
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
#	mkdir -p $(1)/usr/include/asterisk/
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
	for f in app_dial chan_sip \
		codec_ulaw codec_gsm \
		format_gsm format_pcm format_wav format_wav_gsm \
		pbx_config func_timeout; do \
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

$(eval $(call BuildPackage,asterisk16))
$(eval $(call BuildPackage,asterisk16-voicemail))
$(eval $(call BuildPackage,asterisk16-sounds))
#$(eval $(call BuildPackage,asterisk16-app-meetme))
