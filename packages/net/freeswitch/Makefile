#
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=freeswitch
PKG_VERSION:=1.0.7
PKG_RELEASE:=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://git.$(PKG_NAME).org/$(PKG_NAME).git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=86d757d61bd82a73a13fbc387f788c33436c295d
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_FIXUP:=libtool

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
	codec2 \
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
	fifo \
	file-string \
	flite \
	fsv \
	g723-1 \
	g729 \
	h26x \
	h323 \
	hash \
	ilbc \
	lcr \
	ldap \
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
	spandsp \
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
	xml-cdr \
	xml-curl \
	xml-ldap \
	xml-rpc \
	yaml \

PKG_CONFIG_DEPENDS:= \
	$(patsubst %,CONFIG_PACKAGE_$(PKG_NAME)-mod-%,$(FS_MOD_AVAILABLE)) \

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Telephony
  URL:=http://www.$(PKG_NAME).org/
  MAINTAINER:=Mazilo <OpenWRT@slickdeals.endjunk.com>
endef


define Package/$(PKG_NAME)
$(call Package/$(PKG_NAME)/Default)
  TITLE:=FreeSWITCH open source telephony platform
  DEPENDS:= +libopenssl +libreadline +libncurses +libpthread +libstdcpp
  MENU:=1
endef

define Package/$(PKG_NAME)/description
  FreeSWITCH is an open source telephony platform designed to 
  facilitate the creation of voice and chat driven products scaling 
  from a soft-phone up to a soft-switch.  See http://wiki.$(PKG_NAME).org
endef

define Package/$(PKG_NAME)-example-config
$(call Package/$(PKG_NAME)/Default)
  TITLE:=FreeSWITCH example config (commented)
  DEPENDS:= $(PKG_NAME)
endef

define Package/$(PKG_NAME)-example-config/description
  The default configuration included with FreeSWITCH. It is not intended to be
  a final product, and is thus moved to /usr/share/$(PKG_NAME)/examples/conf to
  be an example of how FreeSWITCH can be configured.
endef

define Package/$(PKG_NAME)-config-upstream-defaults
$(call Package/$(PKG_NAME)/Default)
  TITLE:=FreeSWITCH upstream config
  DEPENDS:= $(PKG_NAME)
endef

define Package/$(PKG_NAME)-config-upstream-defaults/description
  The default configuration included with FreeSWITCH. It is not intended to be
  a final product, and but is included for those who don't want to use the 
  OpenWRT configuration and/or want to try things as prepared by upstream.
endef

define Package/$(PKG_NAME)-config-minimal
$(call Package/$(PKG_NAME)/Default)
  TITLE:=FreeSWITCH a minimal FS config
  DEPENDS:= $(PKG_NAME)
endef

define Package/$(PKG_NAME)-config-minimal/description
  A minimal configuration of FreeSWITCH for OpenWRT devices.  Is what the UCI 
  configuration began with.
endef

define Package/$(PKG_NAME)-collection-upstream-defaults
$(call Package/$(PKG_NAME)/Default)
  TITLE:=FreeSWITCH upstream default (sample) config
  DEPENDS:= $(PKG_NAME) \
		+$(PKG_NAME)-config-upstream-defaults \
		+$(PKG_NAME)-mod-callcenter \
		+$(PKG_NAME)-mod-codec2 \
		+$(PKG_NAME)-mod-commands \
		+$(PKG_NAME)-mod-conference \
		+$(PKG_NAME)-mod-syslog \
		+$(PKG_NAME)-mod-curl \
		+$(PKG_NAME)-mod-dialplan-xml \
		+$(PKG_NAME)-mod-dptools \
		+$(PKG_NAME)-mod-event-socket \
		+$(PKG_NAME)-mod-g723-1 \
		+$(PKG_NAME)-mod-hash \
		+$(PKG_NAME)-mod-ilbc \
		+$(PKG_NAME)-mod-local-stream \
		+$(PKG_NAME)-mod-logfile \
		+$(PKG_NAME)-mod-lua \
		+$(PKG_NAME)-mod-native-file \
		+$(PKG_NAME)-mod-sndfile \
		+$(PKG_NAME)-mod-sofia \
		+$(PKG_NAME)-mod-speex \
		+$(PKG_NAME)-mod-tone-stream \
		+$(PKG_NAME)-mod-xml-curl \
		+$(PKG_NAME)-mod-xml-rpc \
		+$(PKG_NAME)-tools
endef

define Package/$(PKG_NAME)-collection-minimal
$(call Package/$(PKG_NAME)/Default)
  TITLE:=A FreeSWITCH minimal package collection
  DEPENDS:= $(PKG_NAME) \
		+$(PKG_NAME)-config-minimal \
		+$(PKG_NAME)-mod-codec2 \
		+$(PKG_NAME)-mod-commands \
		+$(PKG_NAME)-mod-syslog \
		+$(PKG_NAME)-mod-dialplan-xml \
		+$(PKG_NAME)-mod-dptools \
		+$(PKG_NAME)-mod-event-socket \
		+$(PKG_NAME)-mod-hash \
		+$(PKG_NAME)-mod-local-stream \
		+$(PKG_NAME)-mod-sndfile \
		+$(PKG_NAME)-mod-sofia \
		+$(PKG_NAME)-mod-tone-stream \
		+$(PKG_NAME)-tools
endef

define Package/$(PKG_NAME)-sounds-en
$(call Package/$(PKG_NAME)/Default)
  TITLE:=FreeSWITCH english sounds
  DEPENDS:= $(PKG_NAME)
endef


define Package/$(PKG_NAME)-sounds-moh
$(call Package/$(PKG_NAME)/Default)
  TITLE:=FreeSWITCH music-on-hold sounds
  DEPENDS:= $(PKG_NAME)
endef


define Package/$(PKG_NAME)-tools
$(call Package/$(PKG_NAME)/Default)
  TITLE:=FreeSWITCH control tools
  DEPENDS:= $(PKG_NAME)
endef


define Download/files
 define Download/$(1)
  FILE:=$(2)
  URL:=http://files.$(PKG_NAME).org/$(4)
  MD5SUM:=$(3)
 endef
 define Prepare/$(1)
  $(LN) $(DL_DIR)/$(2) $(PKG_BUILD_DIR)/$(5)
 endef
 $$(eval $$(call Download,$(1)))
endef

MAKE_INSTALL_TARGETS:=install

ifneq ($(CONFIG_PACKAGE_$(PKG_NAME)-mod-celt),)
 $(eval $(call Download/files,celt,celt-0.10.0.tar.gz,a656f6176e9be84027c0e51ceedd710f,downloads/libs/,libs/))
endif

ifneq ($(CONFIG_PACKAGE_$(PKG_NAME)-mod-curl),)
 $(eval $(call Download/files,json-c,json-c-0.9.tar.gz,4653b3b9c568bb9c782178abfaac128d,downloads/libs/,libs/))
endif

ifneq ($(CONFIG_PACKAGE_$(PKG_NAME)-mod-flite),)
 $(eval $(call Download/files,flite,flite-1.3.99-latest.tar.gz,365b60881715c5e13c0d8bc37d9be6ff,downloads/libs/,libs/))
endif

ifneq ($(CONFIG_PACKAGE_$(PKG_NAME)-sounds-en),)
 $(eval $(call Download/files,sounds-en,$(PKG_NAME)-sounds-en-us-callie-8000-1.0.15.tar.gz,80738b255c89c5f4b229946f03d921c1,,))
	MAKE_INSTALL_TARGETS+= sounds-install
endif

ifneq ($(CONFIG_PACKAGE_$(PKG_NAME)-sounds-moh),)
 $(eval $(call Download/files,sounds-moh,$(PKG_NAME)-sounds-music-8000-1.0.8.tar.gz,f63ef3cc3507af079ae5c7b8b8a01e42,,))
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
	--prefix="/usr/share/$(PKG_NAME)" \
	--bindir="/usr/bin" \
	--libdir="/usr/lib" \
	--sysconfdir="/etc/$(PKG_NAME)" \
	--with-modinstdir="/usr/lib/$(PKG_NAME)" \
	--enable-ipv6 \
	--disable-zrtp \
	--with-random="/dev/urandom" \
	--without-mysql \
	$(if $(CONFIG_PACKAGE_$(PKG_NAME)-mod-cdr-pg-csv),--with-pgsql="$(STAGING_DIR)/usr",--without-pgsql) \
	$(if $(CONFIG_PACKAGE_$(PKG_NAME)-mod-celt),--with-ogg="$(STAGING_DIR)/usr",--without-iogg) \
	$(if $(CONFIG_PACKAGE_$(PKG_NAME)-mod-curl),--with-libcurl="$(STAGING_DIR)/usr",--without-libcurl) \
	$(if $(CONFIG_PACKAGE_$(PKG_NAME)-mod-dingaling),--with-openssl="$(STAGING_DIR)/usr",--without-openssl) \
	$(if $(CONFIG_PACKAGE_$(PKG_NAME)-mod-java),--with-java="$(STAGING_DIR)/usr",--without-java) \
	$(if $(CONFIG_PACKAGE_$(PKG_NAME)-mod-xml-cdr),--with-libcurl="$(STAGING_DIR)/usr",--without-libcurl) \
	$(if $(CONFIG_PACKAGE_$(PKG_NAME)-mod-xml-curl),--with-libcurl="$(STAGING_DIR)/usr",--without-libcurl) \

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
	(cd $(PKG_BUILD_DIR); [ -h noreg ] || touch noreg)	# Just to shut up Cluecon reg.
	(cd $(PKG_BUILD_DIR); $(AM_TOOL_PATHS) ./bootstrap.sh)
endef

define Build/Configure
	$(call Build/Configure/Default,)
	$(foreach m,$(FS_MOD_AVAILABLE),
		$(if $(CONFIG_PACKAGE_$(PKG_NAME)-mod-$(m)),
			$(SED) 's|^[ #]*\([^#]*/mod_$(subst -,_,$(m))\)$$$$|\1|g' $(PKG_BUILD_DIR)/modules.conf
		,
			$(SED) 's|^\([^#]*/mod_$(subst -,_,$(m))\)$$$$|#\1|g' $(PKG_BUILD_DIR)/modules.conf
		)
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		AR="$(TARGET_CROSS)ar" \
		RANLIB="$(TARGET_CROSS)ranlib" \
		CC="$(TARGET_CC)" \
		CXX="$(TARGET_CXX)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
		all $(MAKE_INSTALL_TARGETS)
	$(SED) 's|^\([ \t]*\)\(.*\)"mod_console"\(.*\)$$$$|\1<!-- \2"mod_console"\3 -->|' $(PKG_INSTALL_DIR)/etc/$(PKG_NAME)/autoload_configs/modules.conf.xml
	$(SED) 's|^\([ \t]*\)<!-- *\(.*\)"mod_syslog"\(.*\) *-->\(.*\)$$$$|\1\2"mod_syslog"\3\4|' $(PKG_INSTALL_DIR)/etc/$(PKG_NAME)/autoload_configs/modules.conf.xml
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/$(PKG_NAME)
	$(CP) $(PKG_INSTALL_DIR)/usr/share/$(PKG_NAME)/include/* $(1)/usr/include/$(PKG_NAME)/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib$(PKG_NAME).{a,so*} $(1)/usr/lib/
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/$(PKG_NAME) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib$(PKG_NAME).so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_DATA) ./files/$(PKG_NAME).default $(1)/etc/default/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_DATA) ./files/$(PKG_NAME).hotplug $(1)/etc/hotplug.d/iface/90-$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/$(PKG_NAME).config $(1)/etc/config/$(PKG_NAME)
endef

define Package/$(PKG_NAME)-collection-upstream-defaults/install
	$(INSTALL_DIR) $(1)/etc/$(PKG_NAME)
endef

define Package/$(PKG_NAME)-example-config/install
	$(INSTALL_DIR) $(1)/usr/share/$(PKG_NAME)/examples/conf
	$(CP) $(PKG_INSTALL_DIR)/etc/$(PKG_NAME)/* $(1)/usr/share/$(PKG_NAME)/examples/conf/
endef

define Package/$(PKG_NAME)-config-upstream-defaults/install
	$(INSTALL_DIR) $(1)/etc/$(PKG_NAME)
	$(CP) $(PKG_INSTALL_DIR)/etc/$(PKG_NAME)/* $(1)/etc/$(PKG_NAME)/
endef

define Package/$(PKG_NAME)-collection-minimal/install
	$(INSTALL_DIR) $(1)/etc/$(PKG_NAME)
endef

define Package/$(PKG_NAME)-collection-uci-minimal/install
	$(INSTALL_DIR) $(1)/etc/$(PKG_NAME)
endef

define Package/$(PKG_NAME)-config-minimal/install
	$(INSTALL_DIR) $(1)/etc/$(PKG_NAME)
	$(CP) ./files/etc.minimal/* $(1)/etc/$(PKG_NAME)/
endef

define Package/$(PKG_NAME)-sounds-en/install
	$(INSTALL_DIR) $(1)/usr/share/$(PKG_NAME)/sounds
	$(CP) $(PKG_INSTALL_DIR)/usr/share/$(PKG_NAME)/sounds/en $(1)/usr/share/$(PKG_NAME)/sounds/
endef

define Package/$(PKG_NAME)-sounds-moh/install
	$(INSTALL_DIR) $(1)/usr/share/$(PKG_NAME)/sounds
	$(CP) $(PKG_INSTALL_DIR)/usr/share/$(PKG_NAME)/sounds/music $(1)/usr/share/$(PKG_NAME)/sounds/
endef

define Package/$(PKG_NAME)-tools/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/fs_cli $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/fs_encode $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/fs_ivrd $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/tone2wav $(1)/usr/bin/
endef

# 1. Name
# 2. Title
# 3. Files
# 4. Inter Depends
# 5. Extra Depends
define BuildPlugin
  define Package/$(PKG_NAME)-mod-$(1)
    $$(call Package/$(PKG_NAME)/Default)
    TITLE:= FS $(2) module
    DEPENDS:= $(PKG_NAME) $$(foreach m,$(4),+$(PKG_NAME)-mod-$$m) $(5)
  endef

  define Package/$(PKG_NAME)-mod-$(1)/install
	[ -z "$(3)" ] || $(INSTALL_DIR) $$(1)/usr/lib/$(PKG_NAME)
	for f in $(3); do \
		$(CP) \
			$(PKG_INSTALL_DIR)/usr/lib/$(PKG_NAME)/$$$$$$$${f}.so \
			$$(1)/usr/lib/$(PKG_NAME)/ ; \
	done
	if [ -d "./files/etc.packages/$(1)" ]; then \
		$(INSTALL_DIR) $$(1)/etc/$(PKG_NAME) ; \
		$(CP) \
			./files/etc.packages/$(1)/* \
			$$(1)/etc/$(PKG_NAME)/ ; \
	fi
  endef

  define Package/$(PKG_NAME)-mod-$(1)/postinst
#!/bin/sh
sed -i -e 's|^\([ \t]*\)<!-- *\(.*\)"mod_$(subst -,_,$(1))"\(.*\) *-->\(.*\)$$$$|\1\2"mod_$(subst -,_,$(1))"\3\4|' $$$${IPKG_INSTROOT}/etc/$(PKG_NAME)/autoload_configs/modules.conf.xml
  endef

  define Package/$(PKG_NAME)-mod-$(1)/postrm
#!/bin/sh
sed -i -e 's|^\([ \t]*\)\(.*\)"mod_$(subst -,_,$(1))"\(.*\)$$$$|\1<!-- \2"mod_$(subst -,_,$(1))"\3 -->|' $$$${IPKG_INSTROOT}/etc/$(PKG_NAME)/autoload_configs/modules.conf.xml
  endef

  $$(eval $$(call BuildPackage,$(PKG_NAME)-mod-$(1)))
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
$(eval $(call BuildPackage,$(PKG_NAME)-collection-upstream-defaults))
$(eval $(call BuildPackage,$(PKG_NAME)-collection-minimal))
$(eval $(call BuildPackage,$(PKG_NAME)-sounds-en))
$(eval $(call BuildPackage,$(PKG_NAME)-sounds-moh))
$(eval $(call BuildPackage,$(PKG_NAME)-tools))
$(eval $(call BuildPackage,$(PKG_NAME)-example-config))
$(eval $(call BuildPackage,$(PKG_NAME)-config-upstream-defaults))
$(eval $(call BuildPackage,$(PKG_NAME)-config-minimal))

#$(eval $(call BuildPlugin,Name,Title,Files,Depends))
$(eval $(call BuildPlugin,alsa,Alsa endpoint,mod_alsa,,))
$(eval $(call BuildPlugin,amr,GSM-AMR codec,mod_amr,,))
$(eval $(call BuildPlugin,amrwb,GSM-AMRWB,mod_amrwb,,))
$(eval $(call BuildPlugin,bv,codec mod_bv,mod_bv,,))
$(eval $(call BuildPlugin,cdr-csv,CSV-CDR handler,mod_cdr_csv,,))
$(eval $(call BuildPlugin,cdr-pg-csv,Postgress CDR handler,mod_cdr_pg_csv,,+postgresql @BROKEN))
$(eval $(call BuildPlugin,celt,CELT ultra-low delay codec,mod_celt,,+libogg))
$(eval $(call BuildPlugin,cepstral,Cepstral interface,mod_cepstral,,@BROKEN)) # needs <swift.h>
$(eval $(call BuildPlugin,cidlookup,applications mod_cidlookup,mod_cidlookup,,))
$(eval $(call BuildPlugin,cluechoo,Framework Demo,mod_cluechoo,,))
$(eval $(call BuildPlugin,codec2,CoDec 2,mod_codec2,,))
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
$(eval $(call BuildPlugin,fifo,FIFO,mod_fifo,,))
$(eval $(call BuildPlugin,file-string,File streaming,mod_file_string,,@OBSOLETE))
$(eval $(call BuildPlugin,flite,Festival TTS,mod_flite,,@(!(armeb||avr32)||BROKEN)))
$(eval $(call BuildPlugin,fsv,Video,mod_fsv,,))
$(eval $(call BuildPlugin,g723-1,G.723.1 codec,mod_g723_1,,))
$(eval $(call BuildPlugin,g729,G.729 codec,mod_g729,,))
$(eval $(call BuildPlugin,h26x,H26X linear codec,mod_h26x,,))
$(eval $(call BuildPlugin,h323,h323 endpoint,mod_h323,,@BROKEN)) # missing header files (other packages needed)
$(eval $(call BuildPlugin,hash,API for manipulating a hash table,mod_hash,,))
$(eval $(call BuildPlugin,java,Java language interface,mod_java,,@BROKEN)) # needs java
$(eval $(call BuildPlugin,ilbc,ILBC codec,mod_ilbc,,))
$(eval $(call BuildPlugin,lcr,Least Cost Routing,mod_lcr,,))
$(eval $(call BuildPlugin,ldap,LDAP interface,mod_ldap,,@BROKEN)) # fails in openldap
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
$(eval $(call BuildPlugin,python,Python language interface,mod_python,,@BROKEN)) # needs Python
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
$(eval $(call BuildPlugin,spandsp,Span DSP,mod_spandsp,,@BROKEN))
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
$(eval $(call BuildPlugin,xml-cdr,XML-CDR handler,mod_xml_cdr,,+libcurl))
$(eval $(call BuildPlugin,xml-curl,XML-Curl gateway,mod_xml_curl,,+libcurl))
$(eval $(call BuildPlugin,xml-ldap,LDAP-XML gateway,mod_xml_ldap,,@BROKEN)) # fails in openldap
$(eval $(call BuildPlugin,xml-rpc,XML-RPC interface,mod_xml_rpc,,))
$(eval $(call BuildPlugin,yaml,YAML dialplans,mod_yaml,,))

