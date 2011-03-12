#
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=freeswitch
PKG_VERSION:=1.0.6
PKG_RELEASE:=11

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=http://files.freeswitch.org/
PKG_MD5SUM:=388effee587887a81fe7f411b7350590

PKG_FIXUP:=libtool no-autoreconf

FS_MOD_AVAILABLE:= \
	alsa \
	amr \
	amrwb \
	bv \
	cdr-csv \
	celt \
	cepstral \
	cidlookup \
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
	directory \
	distributor \
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
	h323 \
	ilbc \
	lcr \
	ldap \
	limit \
	local-stream \
	logfile \
	loopback \
	lua \
	managed \
	memcache \
	native-file \
	nibblebill \
	opal \
	openzap \
	perl \
	pocketsphinx \
	portaudio \
	portaudio-stream \
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
	say-th \
	say-zh \
	shell-stream \
	shout \
	silk \
	siren \
	skinny \
	skypopen \
	sangoma-codec \
	snapshot \
	snipe-hunt \
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
	stress \
	syslog \
	tone-stream \
	unimrcp \
	valet-parking \
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
  SUBMENU:=Telephony
  URL:=http://www.freeswitch.org/
endef


define Package/freeswitch
$(call Package/freeswitch/Default)
  TITLE:=FreeSWITCH open source telephony platform
  DEPENDS:= +libopenssl +libreadline +libncurses +libpthread +libstdcpp
  MENU:=1
endef

define Package/freeswitch/description
  FreeSWITCH is an open source telephony platform designed to 
  facilitate the creation of voice and chat driven products scaling 
  from a soft-phone up to a soft-switch.  See http://wiki.freeswitch.org
endef

define Package/freeswitch-example-config
$(call Package/freeswitch/Default)
  TITLE:=FreeSWITCH example config (commented)
  DEPENDS:= freeswitch
endef

define Package/freeswitch-example-config/description
  The default configuration included with FreeSWITCH. It is not intended to be
  a final product, and is thus moved to /usr/share/freeswitch/examples/conf to
  be an example of how FreeSWITCH can be configured.
endef

define Package/freeswitch-config-upstream-defaults
$(call Package/freeswitch/Default)
  TITLE:=FreeSWITCH upstream config
  DEPENDS:= freeswitch
endef

define Package/freeswitch-config-upstream-defaults/description
  The default configuration included with FreeSWITCH. It is not intended to be
  a final product, and but is included for those who don't want to use the 
  OpenWRT configuration and/or want to try things as prepared by upstream.
endef

define Package/freeswitch-config-minimal
$(call Package/freeswitch/Default)
  TITLE:=FreeSWITCH a minimal FS config
  DEPENDS:= freeswitch
endef

define Package/freeswitch-config-minimal/description
  A minimal configuration of FreeSWITCH for OpenWRT devices.  Is what the UCI 
  configuration began with.
endef

define Package/freeswitch-collection-upstream-defaults
$(call Package/freeswitch/Default)
  TITLE:=FreeSWITCH upstream default (sample) config
  DEPENDS:= freeswitch \
		+freeswitch-config-upstream-defaults \
		+freeswitch-mod-commands \
		+freeswitch-mod-conference \
		+freeswitch-mod-syslog \
		+freeswitch-mod-curl \
		+freeswitch-mod-dialplan-xml \
		+freeswitch-mod-dptools \
		+freeswitch-mod-event-socket \
		+freeswitch-mod-g723-1 \
		+freeswitch-mod-ilbc \
		+freeswitch-mod-limit \
		+freeswitch-mod-local-stream \
		+freeswitch-mod-logfile \
		+freeswitch-mod-lua \
		+freeswitch-mod-native-file \
		+freeswitch-mod-sndfile \
		+freeswitch-mod-sofia \
		+freeswitch-mod-speex \
		+freeswitch-mod-tone-stream \
		+freeswitch-mod-voipcodecs \
		+freeswitch-mod-xml-curl \
		+freeswitch-mod-xml-rpc \
		+freeswitch-tools
endef

define Package/freeswitch-collection-minimal
$(call Package/freeswitch/Default)
  TITLE:=A FreeSWITCH minimal package collection
  DEPENDS:= freeswitch \
		+freeswitch-config-minimal \
		+freeswitch-mod-commands \
		+freeswitch-mod-syslog \
		+freeswitch-mod-dialplan-xml \
		+freeswitch-mod-dptools \
		+freeswitch-mod-event-socket \
		+freeswitch-mod-local-stream \
		+freeswitch-mod-sndfile \
		+freeswitch-mod-sofia \
		+freeswitch-mod-tone-stream \
		+freeswitch-mod-voipcodecs \
		+freeswitch-tools
endef

define Package/freeswitch-sounds-en
$(call Package/freeswitch/Default)
  TITLE:=FreeSWITCH english sounds
  DEPENDS:= freeswitch
endef


define Package/freeswitch-sounds-moh
$(call Package/freeswitch/Default)
  TITLE:=FreeSWITCH music-on-hold sounds
  DEPENDS:= freeswitch
endef


define Package/freeswitch-tools
$(call Package/freeswitch/Default)
  TITLE:=FreeSWITCH control tools
  DEPENDS:= freeswitch
endef


define Download/files
 define Download/$(1)
  FILE:=$(2)
  URL:=http://files.freeswitch.org/$(4)
  MD5SUM:=$(3)
 endef
 define Prepare/$(1)
  $(CP) $(DL_DIR)/$(2) $(PKG_BUILD_DIR)/$(5)
 endef
 $$(eval $$(call Download,$(1)))
endef

MAKE_INSTALL_TARGETS:=install

ifneq ($(CONFIG_PACKAGE_freeswitch-mod-celt),)
 $(eval $(call Download/files,celt,celt-0.7.1.tar.gz,c7f6b8346e132b1a48dae0eff77ea9f0,downloads/libs/,libs/))
endif

ifneq ($(CONFIG_PACKAGE_freeswitch-mod-curl),)
 $(eval $(call Download/files,json-c,json-c-0.9.tar.gz,4653b3b9c568bb9c782178abfaac128d,downloads/libs/,libs/))
endif

ifneq ($(CONFIG_PACKAGE_freeswitch-mod-flite),)
 $(eval $(call Download/files,flite,flite-1.3.99-latest.tar.gz,,downloads/libs/,libs/))
endif

ifneq ($(CONFIG_PACKAGE_freeswitch-sounds-en),)
 $(eval $(call Download/files,sounds-en,freeswitch-sounds-en-us-callie-8000-1.0.12.tar.gz,d700439027dd95dd118e5e85f38e4d81,,))
	MAKE_INSTALL_TARGETS+= sounds-install
endif

ifneq ($(CONFIG_PACKAGE_freeswitch-sounds-moh),)
 $(eval $(call Download/files,sounds-moh,freeswitch-sounds-music-8000-1.0.8.tar.gz,f63ef3cc3507af079ae5c7b8b8a01e42,,))
	MAKE_INSTALL_TARGETS+= moh-install
endif

# XXX: -fgnu89-inline is not supported on all compiler versions, so only enable it on avr32 where it solves build issues
ifneq ($(CONFIG_avr32),)
  TARGET_CFLAGS += -fgnu89-inline
  TARGET_CXXFLAGS += -fgnu89-inline
endif

ifneq ($(CONFIG_USE_EGLIBC),)
  ifeq ($(CONFIG_EGLIBC_OPTION_EGLIBC_UTMP),)
    TARGET_CFLAGS += -DNO_GETLOGIN
  endif
endif

FS_TARGET_CFLAGS:= ${TARGET_CFLAGS} -DLUA_USE_LINUX $(FPIC) -std=gnu99 -Wno-format
FS_TARGET_CXXFLAGS:= ${TARGET_CXXFLAGS} -DLUA_USE_LINUX $(FPIC) -Wno-format
FS_TARGET_CPPFLAGS:= -I. -I./lua ${TARGET_CPPFLAGS}

CONFIGURE_ARGS+= \
	--prefix="/usr/share/freeswitch" \
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
	--without-mysql \
	--without-pgsql \
	--without-python \
	--disable-zrtp \

CONFIGURE_VARS+= \
	config_TARGET_CC="${TARGET_CC}" \
	config_TARGET_CFLAGS="${FS_TARGET_CPPFLAGS} ${FS_TARGET_CFLAGS}" \
	config_TARGET_CXX="${TARGET_CXX}" \
	config_TARGET_CXXFLAGS="${FS_TARGET_CPPFLAGS} ${FS_TARGET_CXXFLAGS}" \
	config_TARGET_CPPFLAGS="${FS_TARGET_CPPFLAGS}" \
	config_BUILD_CC="${HOSTCC}" \
	config_TARGET_READLINE_INC="${FS_TARGET_CPPFLAGS}" \
	config_TARGET_READLINE_LIBS="${TARGET_LDFLAGS} -lreadline -lncurses" \
	config_TARGET_LIBS="${TARGET_LDFLAGS} -lpthread" \
	CC_FOR_BUILD="${HOSTCC}" \
	LDFLAGS_FOR_BUILD="${HOST_LDFLAGS}" \
	CC="${TARGET_CC}" \
	CXX="${TARGET_CXX}" \
	CFLAGS="${FS_TARGET_CPPFLAGS} ${FS_TARGET_CFLAGS}" \
	CXXFLAGS="${FS_TARGET_CPPFLAGS} ${FS_TARGET_CXXFLAGS}" \
	CPPFLAGS="${FS_TARGET_CPPFLAGS}" \
	LDFLAGS="${TARGET_LDFLAGS} -Wl,-rpath-link=\"${STAGING_DIR}/usr/lib\"" \
	ac_cv_dev_urandom="yes" \
	ac_cv_file_dbd_apr_dbd_mysql_c="no" \
	ac_cv_file__dev_random="no" \
	ac_cv_file__dev_urandom="yes" \
	ac_cv_file___dev_urandom_="yes" \
	ac_cv_func_mmap_fixed_mapped="yes" \
	ac_cv_func_pthread_rwlock_init="yes" \
	ac_cv_struct_rlimit="yes" \
	apr_cv_mutex_recursive="yes" \
	apr_cv_process_shared_works="no" \
	apr_cv_tcp_nodelay_with_cork="yes" \
	apr_cv_type_rwlock_t="yes" \
	ac_cv_path_LIBGNUTLS_CONFIG="no" \


define Build/Prepare
$(call Build/Prepare/Default)
	$(call Prepare/celt)
	$(call Prepare/flite)
	$(call Prepare/json-c)
	$(call Prepare/sounds-en)
	$(call Prepare/sounds-moh)
endef

define Build/Configure
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
		all $(MAKE_INSTALL_TARGETS)
	$(SED) 's|^\([ \t]*\)\(.*\)"mod_console"\(.*\)$$$$|\1<!-- \2"mod_console"\3 -->|' $(PKG_INSTALL_DIR)/etc/freeswitch/autoload_configs/modules.conf.xml
	$(SED) 's|^\([ \t]*\)<!-- *\(.*\)"mod_syslog"\(.*\) *-->\(.*\)$$$$|\1\2"mod_syslog"\3\4|' $(PKG_INSTALL_DIR)/etc/freeswitch/autoload_configs/modules.conf.xml
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/freeswitch
	$(CP) $(PKG_INSTALL_DIR)/usr/share/freeswitch/include/* $(1)/usr/include/freeswitch/
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
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_DATA) ./files/freeswitch.hotplug $(1)/etc/hotplug.d/iface/90-freeswitch
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/freeswitch.config $(1)/etc/config/freeswitch
endef

define Package/freeswitch-collection-upstream-defaults/install
	$(INSTALL_DIR) $(1)/etc/freeswitch
endef

define Package/freeswitch-example-config/install
	$(INSTALL_DIR) $(1)/usr/share/freeswitch/examples/conf
	$(CP) $(PKG_INSTALL_DIR)/etc/freeswitch/* $(1)/usr/share/freeswitch/examples/conf/
endef

define Package/freeswitch-config-upstream-defaults/install
	$(INSTALL_DIR) $(1)/etc/freeswitch
	$(CP) $(PKG_INSTALL_DIR)/etc/freeswitch/* $(1)/etc/freeswitch/
endef

define Package/freeswitch-collection-minimal/install
	$(INSTALL_DIR) $(1)/etc/freeswitch
endef

define Package/freeswitch-collection-uci-minimal/install
	$(INSTALL_DIR) $(1)/etc/freeswitch
endef

define Package/freeswitch-config-minimal/install
	$(INSTALL_DIR) $(1)/etc/freeswitch
	$(CP) ./files/etc.minimal/* $(1)/etc/freeswitch/
endef

define Package/freeswitch-sounds-en/install
	$(INSTALL_DIR) $(1)/usr/share/freeswitch/sounds
	$(CP) $(PKG_INSTALL_DIR)/usr/share/freeswitch/sounds/en $(1)/usr/share/freeswitch/sounds/
endef

define Package/freeswitch-sounds-moh/install
	$(INSTALL_DIR) $(1)/usr/share/freeswitch/sounds
	$(CP) $(PKG_INSTALL_DIR)/usr/share/freeswitch/sounds/music $(1)/usr/share/freeswitch/sounds/
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
    DEPENDS:= freeswitch $$(foreach m,$(4),+freeswitch-mod-$$m) $(5)
  endef

  define Package/freeswitch-mod-$(1)/install
	[ -z "$(3)" ] || $(INSTALL_DIR) $$(1)/usr/lib/freeswitch
	for f in $(3); do \
		$(CP) \
			$(PKG_INSTALL_DIR)/usr/lib/freeswitch/$$$$$$$${f}.so \
			$$(1)/usr/lib/freeswitch/ ; \
	done
	if [ -d "./files/etc.packages/$(1)" ]; then \
		$(INSTALL_DIR) $$(1)/etc/freeswitch ; \
		$(CP) \
			./files/etc.packages/$(1)/* \
			$$(1)/etc/freeswitch/ ; \
        fi
  endef

  define Package/freeswitch-mod-$(1)/postinst
#!/bin/sh
sed -i -e 's|^\([ \t]*\)<!-- *\(.*\)"mod_$(subst -,_,$(1))"\(.*\) *-->\(.*\)$$$$|\1\2"mod_$(subst -,_,$(1))"\3\4|' $$$${IPKG_INSTROOT}/etc/freeswitch/autoload_configs/modules.conf.xml
  endef

  define Package/freeswitch-mod-$(1)/postrm
#!/bin/sh
sed -i -e 's|^\([ \t]*\)\(.*\)"mod_$(subst -,_,$(1))"\(.*\)$$$$|\1<!-- \2"mod_$(subst -,_,$(1))"\3 -->|' $$$${IPKG_INSTROOT}/etc/freeswitch/autoload_configs/modules.conf.xml
  endef

  $$(eval $$(call BuildPackage,freeswitch-mod-$(1)))
endef

$(eval $(call BuildPackage,freeswitch))
$(eval $(call BuildPackage,freeswitch-collection-upstream-defaults))
$(eval $(call BuildPackage,freeswitch-collection-minimal))
$(eval $(call BuildPackage,freeswitch-sounds-en))
$(eval $(call BuildPackage,freeswitch-sounds-moh))
$(eval $(call BuildPackage,freeswitch-tools))
$(eval $(call BuildPackage,freeswitch-example-config))
$(eval $(call BuildPackage,freeswitch-config-upstream-defaults))
$(eval $(call BuildPackage,freeswitch-config-minimal))

#$(eval $(call BuildPlugin,Name,Title,Files,Depends))
$(eval $(call BuildPlugin,alsa,Alsa endpoint,mod_alsa,,))
$(eval $(call BuildPlugin,amr,GSM-AMR codec,mod_amr,,))
$(eval $(call BuildPlugin,amrwb,GSM-AMRWB,mod_amrwb,,))
$(eval $(call BuildPlugin,bv,codec mod_bv,mod_bv,,))
$(eval $(call BuildPlugin,cdr-csv,CSV-CDR handler,mod_cdr_csv,,))
$(eval $(call BuildPlugin,celt,CELT ultra-low delay codec,mod_celt,,+libogg))
$(eval $(call BuildPlugin,cepstral,Cepstral interface,mod_cepstral,,@BROKEN)) # needs <swift.h>
$(eval $(call BuildPlugin,cidlookup,applications mod_cidlookup,mod_cidlookup,,))
$(eval $(call BuildPlugin,cluechoo,Framework Demo,mod_cluechoo,,))
$(eval $(call BuildPlugin,commands,API commands,mod_commands,,))
$(eval $(call BuildPlugin,conference,Conference room,mod_conference,,))
$(eval $(call BuildPlugin,console,Console logger,mod_console,,))
$(eval $(call BuildPlugin,curl,HTTP request,mod_curl,,+libcurl))
$(eval $(call BuildPlugin,dahdi-codec,DAHDI codecs,mod_dahdi_codec,,))
$(eval $(call BuildPlugin,dialplan-asterisk,Asterisk dialplan parser,mod_dialplan_asterisk,,))
$(eval $(call BuildPlugin,dialplan-directory,Dialplan-Directory interface,mod_dialplan_directory,,))
$(eval $(call BuildPlugin,dialplan-xml,Dialplan-XML interface,mod_dialplan_xml,,))
$(eval $(call BuildPlugin,dingaling,Jabber interface,mod_dingaling,,+libgnutls-openssl)) 
$(eval $(call BuildPlugin,directory,application mod_directory,mod_directory,,))
$(eval $(call BuildPlugin,distributor,application mod_distributor,mod_distributor,,))
$(eval $(call BuildPlugin,dptools,Dialplan tools,mod_dptools,,))
$(eval $(call BuildPlugin,easyroute,DID routing,mod_easyroute,,))
$(eval $(call BuildPlugin,enum,ENUM routing,mod_enum,,))
$(eval $(call BuildPlugin,erlang-event,Erlang event handler,mod_erlang_event,,@BROKEN)) # needs <ei.h>
$(eval $(call BuildPlugin,esf,Extra SIP Functionality,mod_esf,,))
$(eval $(call BuildPlugin,event-multicast,Multicast event handler,mod_event_multicast,,))
$(eval $(call BuildPlugin,event-socket,Socket event handler,mod_event_socket,,))
$(eval $(call BuildPlugin,expr,Expression evaluation,mod_expr,,))
$(eval $(call BuildPlugin,fax,Fax,mod_fax,,+libjpeg @(!(powerpc)||BROKEN))) # fails in spandsp
$(eval $(call BuildPlugin,fifo,FIFO,mod_fifo,,))
$(eval $(call BuildPlugin,file-string,File streaming,mod_file_string,,))
$(eval $(call BuildPlugin,flite,Festival TTS,mod_flite,,@(!(armeb||avr32)||BROKEN)))
$(eval $(call BuildPlugin,fsv,Video,mod_fsv,,))
$(eval $(call BuildPlugin,g723-1,G.723.1 codec,mod_g723_1,,))
$(eval $(call BuildPlugin,g729,G.729 codec,mod_g729,,))
$(eval $(call BuildPlugin,h26x,H26X linear codec,mod_h26x,,))
$(eval $(call BuildPlugin,h323,h323 endpoint,mod_h323,,@BROKEN)) # missing header files (other packages needed)
$(eval $(call BuildPlugin,java,Java language interface,mod_java,,@BROKEN)) # needs java
$(eval $(call BuildPlugin,ilbc,ILBC codec,mod_ilbc,,))
$(eval $(call BuildPlugin,lcr,Least Cost Routing,mod_lcr,,))
$(eval $(call BuildPlugin,ldap,LDAP interface,mod_ldap,,@BROKEN)) # fails in openldap
$(eval $(call BuildPlugin,limit,Resource limitation,mod_limit,,))
$(eval $(call BuildPlugin,local-stream,Local streaming,mod_local_stream,,))
$(eval $(call BuildPlugin,logfile,File logger,mod_logfile,,))
$(eval $(call BuildPlugin,loopback,Loopback endpoint,mod_loopback,,))
$(eval $(call BuildPlugin,lua,Lua language interface,mod_lua,,+libstdcpp))
$(eval $(call BuildPlugin,managed,language mod_managed,mod_managed,,@BROKEN)) # needs Mono
$(eval $(call BuildPlugin,memcache,MemCached interface,mod_memcache,,@BROKEN)) # fails in libmemcached
$(eval $(call BuildPlugin,native-file,Native files,mod_native_file,,))
$(eval $(call BuildPlugin,nibblebill,Billing,mod_nibblebill,,))
$(eval $(call BuildPlugin,opal,Multi-Protocol endpoint,mod_opal,,@BROKEN)) # needs Opal
$(eval $(call BuildPlugin,openzap,Zaptel hardware interface,mod_openzap ozmod_analog ozmod_analog_em ozmod_isdn ozmod_skel ozmod_zt,,+libpcap))
$(eval $(call BuildPlugin,perl,Perl language interface,mod_perl,,+perl @BROKEN)) # needs Perl
$(eval $(call BuildPlugin,pocketsphinx,PocketSphinx SR,mod_pocketsphinx,,@BROKEN)) # fails in sphinxbase
$(eval $(call BuildPlugin,portaudio,Local audio endpoint,mod_portaudio,,+alsa-lib))
$(eval $(call BuildPlugin,portaudio-stream,format mod_portaudio_stream,mod_portaudio_stream,,))
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
$(eval $(call BuildPlugin,say-th,mod_th say,mod_say_th,,))
$(eval $(call BuildPlugin,say-zh,Chineese say,mod_say_zh,,))
$(eval $(call BuildPlugin,shell-stream,,mod_shell_stream,,))
$(eval $(call BuildPlugin,shout,MP3 and Shoutcast stream,mod_shout,,@BROKEN)) # needs Ogg/Vorbis
$(eval $(call BuildPlugin,silk,codec mod_silk,mod_silk,,))
$(eval $(call BuildPlugin,siren,G.722.1 codec,mod_siren,,@BROKEN)) # fails in libg722_1 - attempts to execute cross-compiled binary on host
$(eval $(call BuildPlugin,skinny,endpoint mod_skinny,mod_skinny,,))
$(eval $(call BuildPlugin,skypopen,Skype compatible endpoint,mod_skypopen,,@BROKEN)) # needs <X11/Xlib.h>
$(eval $(call BuildPlugin,sangoma-codec,codec sangoma-codec,mod_sangoma_codec,,@BROKEN)) # Untested
$(eval $(call BuildPlugin,snapshot,application mod_snapshot,mod_snapshot,,))
$(eval $(call BuildPlugin,snipe-hunt,application mod_snipe_hunt,mod_snipe_hunt,,))
$(eval $(call BuildPlugin,sndfile,Multi-Format file transcoder,mod_sndfile,,))
$(eval $(call BuildPlugin,snom,SNOM specific features,mod_snom,,))
$(eval $(call BuildPlugin,sofia,SIP,mod_sofia,,))
$(eval $(call BuildPlugin,soundtouch,Sound effects,mod_soundtouch,,@BROKEN)) # fails in soundtouch
$(eval $(call BuildPlugin,speex,Speex codec,mod_speex,,))
$(eval $(call BuildPlugin,spidermonkey,JavaScript,mod_spidermonkey,,@BROKEN)) # fails in js
$(eval $(call BuildPlugin,spidermonkey-core_db,JavaScript DB,mod_spidermonkey_core_db,,@BROKEN))
$(eval $(call BuildPlugin,spidermonkey-curl,JavaScript Curl,mod_spidermonkey_curl,,@BROKEN))
$(eval $(call BuildPlugin,spidermonkey-odbc,JavaScript ODBC,mod_spidermonkey_odbc,,@BROKEN))
$(eval $(call BuildPlugin,spidermonkey-socket,JavaScript socket,mod_spidermonkey_socket,,@BROKEN))
$(eval $(call BuildPlugin,spidermonkey-teletone,JavaScript teletone,mod_spidermonkey_teletone,,@BROKEN))
$(eval $(call BuildPlugin,spy,User spy,mod_spy,,))
$(eval $(call BuildPlugin,stress,application mod_stress,mod_stress,,))
$(eval $(call BuildPlugin,syslog,SysLog logger,mod_syslog,,))
$(eval $(call BuildPlugin,tone-stream,Tone generation stream,mod_tone_stream,,))
$(eval $(call BuildPlugin,unimrcp,MRCP interface,mod_unimrcp,,))
$(eval $(call BuildPlugin,valet-parking,application mod_valet_parking,mod_valet_parking,,))
$(eval $(call BuildPlugin,vmd,VoiceMail beep detection,mod_vmd,,))
$(eval $(call BuildPlugin,voicemail,VoiceMail,mod_voicemail,,))
$(eval $(call BuildPlugin,voipcodecs,VoIP codecs,mod_voipcodecs,,@(!(powerpc)||BROKEN))) # fails in spandsp
$(eval $(call BuildPlugin,xml-cdr,XML-CDR handler,mod_xml_cdr,,+libcurl))
$(eval $(call BuildPlugin,xml-curl,XML-Curl gateway,mod_xml_curl,,+libcurl))
$(eval $(call BuildPlugin,xml-ldap,LDAP-XML gateway,mod_xml_ldap,,@BROKEN)) # fails in openldap
$(eval $(call BuildPlugin,xml-rpc,XML-RPC interface,mod_xml_rpc,,))
$(eval $(call BuildPlugin,yaml,YAML dialplans,mod_yaml,,))

