#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=freeswitch
PKG_VERSION:=1.0.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://files.freeswitch.org/
PKG_MD5SUM:=86e34bdd8cc027d71772cb0dc51388da

PKG_FIXUP:=libtool

FS_MOD_AVAILABLE:= \
	alsa \
	amr \
	amrwb \
	cdr-csv \
	celt \
	cepstral \
	cluechoo \
	commands \
	conference \
	console \
	curl \
	dahdi-codec \
	dialplan-asterisk \
	dialplan-directory \
	dialplan-xml \
	dingaling \
	dptools \
	easyroute \
	enum \
	erlang-event \
	esf \
	event-multicast \
	event-socket \
	expr \
	fax \
	fifo \
	file-string \
	flite \
	fsv \
	g723-1 \
	g729 \
	h26x \
	iax \
	ilbc \
	lcr \
	ldap \
	limit \
	local-stream \
	logfile \
	loopback \
	lua \
	memcache \
	native-file \
	nibblebill \
	opal \
	openzap \
	perl \
	pocketsphinx \
	portaudio \
	python \
	radius-cdr \
	rss \
	say-de \
	say-en \
	say-es \
	say-fr \
	say-it \
	say-nl \
	say-ru \
	say-zh \
	shout \
	siren \
	skypiax \
	sndfile \
	snom \
	sofia \
	soundtouch \
	speex \
	spidermonkey \
	spidermonkey-core-db \
	spidermonkey-curl \
	spidermonkey-odbc \
	spidermonkey-socket \
	spidermonkey-teletone \
	spy \
	syslog \
	tone-stream \
	unimrcp \
	vmd \
	voicemail \
	voipcodecs \
	xml-cdr \
	xml-curl \
	xml-ldap \
	xml-rpc \
	yaml \

PKG_CONFIG_DEPENDS:= \
	$(patsubst %,CONFIG_PACKAGE_freeswitch-mod-%,$(FS_MOD_AVAILABLE)) \

include $(INCLUDE_DIR)/package.mk

define Package/freeswitch/Default
  SECTION:=net
  CATEGORY:=Network
  URL:=http://www.freeswitch.org/
endef


define Package/freeswitch
$(call Package/freeswitch/Default)
  TITLE:=FreeSWITCH open source telephony platform
  DEPENDS:=+libopenssl +libreadline +libncurses +libpthread
  MENU:=1
endef

define Package/freeswitch/description
  FreeSWITCH is an open source telephony platform designed to 
  facilitate the creation of voice and chat driven products scaling 
  from a soft-phone up to a soft-switch.
endef


define Package/freeswitch-default
$(call Package/freeswitch/Default)
  TITLE:=FreeSWITCH default config
  DEPENDS:=freeswitch \
		+freeswitch-mod-cdr-csv \
		+freeswitch-mod-commands \
		+freeswitch-mod-conference \
		+freeswitch-mod-console \
		+freeswitch-mod-dialplan-xml \
		+freeswitch-mod-dptools \
		+freeswitch-mod-enum \
		+freeswitch-mod-event-socket \
		+freeswitch-mod-expr \
		+freeswitch-mod-fifo \
		+freeswitch-mod-file-string \
		+freeswitch-mod-esf \
		+freeswitch-mod-fsv \
		+freeswitch-mod-iax \
		+freeswitch-mod-limit \
		+freeswitch-mod-local-stream \
		+freeswitch-mod-logfile \
		+freeswitch-mod-loopback \
		+freeswitch-mod-native-file \
		+freeswitch-mod-rss \
		+freeswitch-mod-say-en \
		+freeswitch-mod-sndfile \
		+freeswitch-mod-sofia \
		+freeswitch-mod-syslog \
		+freeswitch-mod-tone-stream \
		+freeswitch-mod-voicemail \
		+freeswitch-mod-voipcodecs \
		+freeswitch-mod-xml-cdr \
		+freeswitch-mod-xml-rpc
endef


define Package/freeswitch-minimal
$(call Package/freeswitch/Default)
  TITLE:=FreeSWITCH minimal config
  DEPENDS:=freeswitch \
	+freeswitch-mod-commands \
	+freeswitch-mod-console \
	+freeswitch-mod-dialplan-xml \
	+freeswitch-mod-dptools \
	+freeswitch-mod-sofia \
	+freeswitch-mod-voipcodecs
endef


define Package/freeswitch-tools
$(call Package/freeswitch/Default)
  TITLE:=FreeSWITCH control tools
  DEPENDS:=freeswitch
endef


CONFIGURE_ARGS+= \
	--prefix="/usr/freeswitch" \
	--bindir="/usr/bin" \
	--libdir="/usr/lib" \
	--sysconfdir="/etc/freeswitch" \
	--with-modinstdir="/usr/lib/freeswitch" \
	--enable-ipv6 \
	\
	--with-libcurl="$(STAGING_DIR)/usr" \
	--with-openssl="$(STAGING_DIR)/usr" \
	--with-random="/dev/urandom" \
	--without-erlang \
	--without-java \
	--without-odbc \
	--without-mysql \
	--without-pgsql \
	--without-python \
	--disable-zrtp \

CONFIGURE_VARS+= \
	config_BUILD_CC="$(HOSTCC)" \
	config_BUILD_CFLAGS="$(HOST_CFLAGS)" \
	config_TARGET_CC="$(TARGET_CC)" \
	config_TARGET_CFLAGS="$(TARGET_CFLAGS)" \
	config_TARGET_READLINE_INC="$(TARGET_CPPFLAGS)" \
	config_TARGET_READLINE_LIBS="$(TARGET_LDFLAGS) -lreadline -lncurses" \
	config_TARGET_LIBS="$(TARGET_LDFLAGS) -lpthread" \
	CC_FOR_BUILD="$(HOSTCC)" \
	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
	LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS) -Wl,-rpath-link=\"$(STAGING_DIR)/usr/lib\"" \
	ac_cv_file_dbd_apr_dbd_mysql_c="no" \
	apr_cv_process_shared_works="no" \
	apr_cv_tcp_nodelay_with_cork="yes" \

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./rebootstrap.sh; )
$(call Build/Configure/Default)
	$(foreach m,$(FS_MOD_AVAILABLE),
		$(if $(CONFIG_PACKAGE_freeswitch-mod-$(m)),
			$(SED) 's|^[ #]*\([^#]*/mod_$(subst -,_,$(m))\)$$$$|\1|g' $(PKG_BUILD_DIR)/modules.conf
		,
			$(SED) 's|^\([^#]*/mod_$(subst -,_,$(m))\)$$$$|#\1|g' $(PKG_BUILD_DIR)/modules.conf
		)
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/freeswitch
	$(CP) $(PKG_INSTALL_DIR)/usr/freeswitch/include/* $(1)/usr/include/freeswitch/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfreeswitch.{a,so*} $(1)/usr/lib/
endef

define Package/freeswitch/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/freeswitch $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfreeswitch.so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/freeswitch
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_DATA) ./files/freeswitch.default $(1)/etc/default/freeswitch
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/freeswitch.init $(1)/etc/init.d/freeswitch
endef

define Package/freeswitch-default/install
	$(INSTALL_DIR) $(1)/etc/freeswitch
	$(CP) $(PKG_INSTALL_DIR)/etc/freeswitch/* $(1)/etc/freeswitch/
endef

define Package/freeswitch-minimal/install
	$(INSTALL_DIR) $(1)/etc/freeswitch
	$(CP) $(PKG_INSTALL_DIR)/etc/freeswitch/* $(1)/etc/freeswitch/
endef

define Package/freeswitch-tools/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/fs_cli $(1)/usr/bin/
endef

# 1. Name
# 2. Title
# 3. Files
# 4. Inter Depends
# 5. Extra Depends
define BuildPlugin
  define Package/freeswitch-mod-$(1)
    $$(call Package/freeswitch/Default)
    TITLE:= FS $(2) module
    DEPENDS:=freeswitch $$(foreach m,$(4),+freeswitch-mod-$$m) $(5)
  endef

  define Package/freeswitch-mod-$(1)/install
	[ -z "$(3)" ] || $(INSTALL_DIR) $$(1)/usr/lib/freeswitch
	for f in $(3); do \
		$(CP) \
			$(PKG_INSTALL_DIR)/usr/lib/freeswitch/$$$$$$$${f}.so \
			$$(1)/usr/lib/freeswitch/ ; \
	done
  endef

  $$(eval $$(call BuildPackage,freeswitch-mod-$(1)))
endef

$(eval $(call BuildPackage,freeswitch))
$(eval $(call BuildPackage,freeswitch-default))
$(eval $(call BuildPackage,freeswitch-minimal))
$(eval $(call BuildPackage,freeswitch-tools))

#$(eval $(call BuildPlugin,Name,Title,Files,Depends))
$(eval $(call BuildPlugin,alsa,Alsa endpoint,mod_alsa,,+alsa-lib))
$(eval $(call BuildPlugin,amr,GSM-AMR codec,mod_amr,,))
$(eval $(call BuildPlugin,amrwb,GSM-AMRWB,mod_amrwb,,))
$(eval $(call BuildPlugin,cdr-csv,CSV-CDR handler,mod_cdr_csv,,))
$(eval $(call BuildPlugin,celt,CELT ultra-low delay codec,mod_celt,,))
$(eval $(call BuildPlugin,cepstral,Cepstral interface,mod_cepstral,,@BROKEN)) # needs <swift.h>
$(eval $(call BuildPlugin,cluechoo,Framework Demo,mod_cluechoo,,))
$(eval $(call BuildPlugin,commands,API commands,mod_commands,,))
$(eval $(call BuildPlugin,conference,Conference room,mod_conference,,))
$(eval $(call BuildPlugin,console,Console logger,mod_console,,))
$(eval $(call BuildPlugin,curl,HTTP request,mod_curl,,))
$(eval $(call BuildPlugin,dahdi-codec,DAHDI codecs,mod_dahdi_codec,,))
$(eval $(call BuildPlugin,dialplan-asterisk,Asterisk dialplan parser,mod_dialplan_asterisk,,))
$(eval $(call BuildPlugin,dialplan-directory,Dialplan-Directory interface,mod_dialplan_directory,,))
$(eval $(call BuildPlugin,dialplan-xml,Dialplan-XML interface,mod_dialplan_xml,,))
$(eval $(call BuildPlugin,dingaling,Jabber interface,mod_dingaling,,))
$(eval $(call BuildPlugin,dptools,Dialplan tools,mod_dptools,,))
$(eval $(call BuildPlugin,easyroute,DID routing,mod_easyroute,,))
$(eval $(call BuildPlugin,enum,ENUM routing,mod_enum,,))
$(eval $(call BuildPlugin,erlang-event,Erlang event handler,mod_erlang_event,,@BROKEN)) # needs <ei.h>
$(eval $(call BuildPlugin,esf,Extra SIP Functionality,mod_esf,,))
$(eval $(call BuildPlugin,event-multicast,Multicast event handler,mod_event_multicast,,))
$(eval $(call BuildPlugin,event-socket,Socket event handler,mod_event_socket,,))
$(eval $(call BuildPlugin,expr,Expression evaluation,mod_expr,,))
$(eval $(call BuildPlugin,fax,Fax,mod_fax,,@BROKEN)) # fails in spandsp
$(eval $(call BuildPlugin,fifo,FIFO,mod_fifo,,))
$(eval $(call BuildPlugin,file-string,File streaming,mod_file_string,,))
$(eval $(call BuildPlugin,flite,Festival TTS,mod_flite,,))
$(eval $(call BuildPlugin,fsv,Video,mod_fsv,,))
$(eval $(call BuildPlugin,g723-1,G.723.1 codec,mod_g723_1,,))
$(eval $(call BuildPlugin,g729,G.729 codec,mod_g729,,))
$(eval $(call BuildPlugin,h26x,H26X linear codec,mod_h26x,,))
$(eval $(call BuildPlugin,iax,IAX2 interface,mod_iax,,))
$(eval $(call BuildPlugin,ilbc,ILBC codec,mod_ilbc,,))
$(eval $(call BuildPlugin,lcr,Least Cost Routing,mod_lcr,,))
$(eval $(call BuildPlugin,ldap,LDAP interface,mod_ldap,,@BROKEN)) # fails in openldap
$(eval $(call BuildPlugin,limit,Resource limitation,mod_limit,,))
$(eval $(call BuildPlugin,local-stream,Local streaming,mod_local_stream,,))
$(eval $(call BuildPlugin,logfile,File logger,mod_logfile,,))
$(eval $(call BuildPlugin,loopback,Loopback endpoint,mod_loopback,,))
$(eval $(call BuildPlugin,lua,Lua language interface,mod_lua,,@BROKEN)) # needs C++
$(eval $(call BuildPlugin,memcache,MemCached interface,mod_memcache,,@BROKEN)) # fails in libmemcached
$(eval $(call BuildPlugin,native-file,Native files,mod_native_file,,))
$(eval $(call BuildPlugin,nibblebill,Billing,mod_nibblebill,,))
$(eval $(call BuildPlugin,opal,Multi-Protocol endpoint,mod_opal,,@BROKEN)) # needs Opal
$(eval $(call BuildPlugin,openzap,Zaptel harware interface,mod_openzap ozmod_analog ozmod_analog_em ozmod_isdn ozmod_skel ozmod_ss7_boost ozmod_zt,,))
$(eval $(call BuildPlugin,perl,Perl language interface,mod_perl,,+perl @BROKEN)) # needs Perl
$(eval $(call BuildPlugin,pocketsphinx,PocketSphinx SR,mod_pocketsphinx,,@BROKEN)) # fails in sphinxbase
$(eval $(call BuildPlugin,portaudio,Local audio endpoint,mod_portaudio,,+alsa-lib))
$(eval $(call BuildPlugin,python,Python language interface,mod_python,,+python @BROKEN)) # needs Python
$(eval $(call BuildPlugin,radius-cdr,Radius-CDR interface,mod_radius_cdr,,@BROKEN)) # fails in freeradius-client
$(eval $(call BuildPlugin,rss,RRS feeds via TTS,mod_rss,,))
$(eval $(call BuildPlugin,say-de,German say,mod_say_de,,))
$(eval $(call BuildPlugin,say-en,English say,mod_say_en,,))
$(eval $(call BuildPlugin,say-es,Spanish say,mod_say_es,,))
$(eval $(call BuildPlugin,say-fr,French say,mod_say_fr,,))
$(eval $(call BuildPlugin,say-it,Italian say,mod_say_it,,))
$(eval $(call BuildPlugin,say-nl,Dutch say,mod_say_nl,,))
$(eval $(call BuildPlugin,say-ru,Russian say,mod_say_ru,,))
$(eval $(call BuildPlugin,say-zh,Chineese say,mod_say_zh,,))
$(eval $(call BuildPlugin,shout,MP3 and Shoutcast stream,mod_shout,,@BROKEN)) # needs Ogg/Vorbis
$(eval $(call BuildPlugin,siren,G.722.1 codec,mod_siren,,@BROKEN)) # fails in libg722_1
$(eval $(call BuildPlugin,skypiax,Skype compatible endpoint,mod_skypiax,,@BROKEN)) # needs <X11/Xlib.h>
$(eval $(call BuildPlugin,sndfile,Multi-Format file transcoder,mod_sndfile,,))
$(eval $(call BuildPlugin,snom,SNOM specific features,mod_snom,,))
$(eval $(call BuildPlugin,sofia,SIP,mod_sofia,,))
$(eval $(call BuildPlugin,soundtouch,Sound effects,mod_soundtouch,,@BROKEN)) # needs C++
$(eval $(call BuildPlugin,speex,Speex codec,mod_speex,,))
$(eval $(call BuildPlugin,spidermonkey,JavaScript,mod_spidermonkey,,@BROKEN)) # fails in js
$(eval $(call BuildPlugin,spidermonkey-core_db,JavaScript DB,mod_spidermonkey_core_db,,@BROKEN))
$(eval $(call BuildPlugin,spidermonkey-curl,JavaScript Curl,mod_spidermonkey_curl,,@BROKEN))
$(eval $(call BuildPlugin,spidermonkey-odbc,JavaScript ODBC,mod_spidermonkey_odbc,,@BROKEN))
$(eval $(call BuildPlugin,spidermonkey-socket,JavaScript socket,mod_spidermonkey_socket,,@BROKEN))
$(eval $(call BuildPlugin,spidermonkey-teletone,JavaScript teletone,mod_spidermonkey_teletone,,@BROKEN))
$(eval $(call BuildPlugin,spy,User spy,mod_spy,,))
$(eval $(call BuildPlugin,syslog,SysLog logger,mod_syslog,,))
$(eval $(call BuildPlugin,tone-stream,Tone generation stream,mod_tone_stream,,))
$(eval $(call BuildPlugin,unimrcp,MRCP interface,mod_unimrcp,,))
$(eval $(call BuildPlugin,vmd,VoiceMail beep detection,mod_vmd,,))
$(eval $(call BuildPlugin,voicemail,VoiceMail,mod_voicemail,,))
$(eval $(call BuildPlugin,voipcodecs,VoIP codecs,mod_voipcodecs,,))
$(eval $(call BuildPlugin,xml-cdr,XML-CDR handler,mod_xml_cdr,,+libcurl))
$(eval $(call BuildPlugin,xml-curl,XML-Curl gateway,mod_xml_curl,,+libcurl))
$(eval $(call BuildPlugin,xml-ldap,LDAP-XML gateway,mod_xml_ldap,,@BROKEN)) # fails in openldap
$(eval $(call BuildPlugin,xml-rpc,XML-RPC interface,mod_xml_rpc,,))
$(eval $(call BuildPlugin,yaml,YAML dialplans,mod_yaml,,))
