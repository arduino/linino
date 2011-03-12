#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

RELEASEVER:=3.2.0

PKG_NAME:=yate
PKG_VERSION:=$(RELEASEVER)-1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://yate.null.ro/tarballs/yate3/
PKG_MD5SUM:=8ef5f0c420cb41ad2b5828fdba28c4ee
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)/Default
  SUBMENU:=Telephony
  SECTION:=net
  CATEGORY:=Network
  URL:=http://yate.null.ro/
  MAINTAINER:=Daniel Dickinson <openwrt@cshore.neomailbox.net>
endef

define Package/$(PKG_NAME)
  $(call Package/yate/Default)
  DEPENDS:=+libpthread @BROKEN
  TITLE:=Yet Another Telphony Engine
  MENU:=1
endef

define Package/$(PKG_NAME)/Default/description
  Is a next-generation telephony engine focused on the VoIP and PSTN.  It does
  SIP, H.323, IAX, PSTN, and more.
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include

CONFIGURE_ARGS+= \
	--sysconfdir=/etc/$(PKG_NAME) \
	--without-libqt4 \
	--without-qtstatic \
	--without-pwlib	\
	--without-coredumper \
	--without-doxygen \
	--without-kdoc \
	--with-spandsp="$(STAGING_DIR)/usr/include" \
	--with-libgsm="$(STAGING_DIR)/usr/include/gsm" \
	--with-mysql="$(STAGING_DIR)/usr" \
	--with-openssl="$(STAGING_DIR)/usr" \
	--with-libpq="$(STAGING_DIR)/usr" \
	--with-libspeex="$(STAGING_DIR)/usr/include/speex" \
	--with-zaptel="$(STAGING_DIR)/usr/include" \
	--with-zlib="$(STAGING_DIR)/usr"

CONFIGURE_VARS+= \
	LIBS="-lpthread -lresolv"

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib
	
	for yatelib in "" sig mgcp jabber; do \
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/libyate$$$${yatelib}.so.$(RELEASEVER) $(1)/usr/lib ;\
		$(LN) ./libyate$$$${yatelib}.so.$(RELEASEVER) $(1)/usr/lib/libyate$$$${yatelib}.so ;\
	done
	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/yate $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/$(PKG_NAME)
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/conf.d/yate.conf.sample $(1)/etc/$(PKG_NAME)/yate.conf
endef

define BuildPlugin
  define Package/$(PKG_NAME)-mod-$(1)
    $(call Package/yate/Default)
    DEPENDS:= $(PKG_NAME) $(4)
    TITLE:=$(3)
  endef
  
  define Package/$(PKG_NAME)-mod-$(1)/description
    $(3) module for $(PKG_NAME)
  endef
  
  define Package/$(PKG_NAME)-mod-$(1)/install
	$$(INSTALL_DIR) $$(1)/usr/lib/$(PKG_NAME)/$(2)
	$$(INSTALL_BIN) $$(PKG_BUILD_DIR)/modules/$(2)/$(1).yate $$(1)/usr/lib/yate/$(2)/$(1).yate
	if [ -f $$(PKG_BUILD_DIR)/conf.d/$(1).conf.sample ]; then \
		$$(INSTALL_DIR) $$(1)/etc/$(PKG_NAME) ;\
		$$(INSTALL_DATA) $$(PKG_BUILD_DIR)/conf.d/$(1).conf.sample $$(1)/etc/$(PKG_NAME)/$(1).conf ;\
	fi
  endef

  $$(eval $$(call BuildPackage,$(PKG_NAME)-mod-$(1)))
endef

$(eval $(call BuildPackage,yate))
$(eval $(call BuildPlugin,accfile,server,SIP or H.323 client (from file),))
$(eval $(call BuildPlugin,alsachan,client,ALSA Sound Channel,+alsa-lib))
$(eval $(call BuildPlugin,amrnbcodec,,AMR-NB Codec,@BROKEN)) # Missing amr-nb library
$(eval $(call BuildPlugin,analog,server,Analog (e.g. POTS) Channel,))
$(eval $(call BuildPlugin,analogdetect,server,Analog Data Detector,))
$(eval $(call BuildPlugin,analyzer,,Test Call Generator and AQ Analyzer,))
$(eval $(call BuildPlugin,callcounters,server,Count Active Call Legs,))
$(eval $(call BuildPlugin,callfork,,Call Forker,))
$(eval $(call BuildPlugin,callgen,,Call Generator,))
$(eval $(call BuildPlugin,ccongestion,server,Accept Status from Installed Engine Monitors,))
$(eval $(call BuildPlugin,cdrbuild,,Call Detail Record Builder,))
$(eval $(call BuildPlugin,cdrfile,,Call Detail Record to File,))
$(eval $(call BuildPlugin,ciscosm,server,SS7 Support,))
$(eval $(call BuildPlugin,clustering,server,Clustering Server Support,))
$(eval $(call BuildPlugin,conference,,Conference Room Mixer,))
$(eval $(call BuildPlugin,cpuload,server,Monitor CPU load and Inform Yate,))
$(eval $(call BuildPlugin,dbpbx,server,PBX IVR and Multi-routing from Database,))
$(eval $(call BuildPlugin,dbwave,server,Wav Media for DB Storage,+$(PKG_NAME)-mod-wavfile))
$(eval $(call BuildPlugin,dumbchan,,Dummy Channel,))
$(eval $(call BuildPlugin,enumroute,,ENUM Routing,))
$(eval $(call BuildPlugin,extmodule,,External Module Handler,))
$(eval $(call BuildPlugin,faxchan,,Spandsp Fax Channel,+libspandsp))
$(eval $(call BuildPlugin,filetransfer,,File Transfer Driver,))
$(eval $(call BuildPlugin,gsmcodec,,GSM Codec,+libgsm))
$(eval $(call BuildPlugin,h323chan,,Open H.323 Channel,+libopenh323 @BROKEN)) # libopenh323 doesn't create package or stagin_dir includes or libs
$(eval $(call BuildPlugin,heartbeat,server,Linux-HA compatible heartbeat,))
$(eval $(call BuildPlugin,ilbccodec,,iLBC Codec,))
$(eval $(call BuildPlugin,isupmangler,server,ISUP paramter mangling in a STP,))
$(eval $(call BuildPlugin,jabberclient,client,Jabber Client,))
$(eval $(call BuildPlugin,jabberserver,jabber,Jabber Server,))
$(eval $(call BuildPlugin,jbfeatures,jabber,Jabber Server Features,))
$(eval $(call BuildPlugin,lateroute,server,Last Chance Routing,))
$(eval $(call BuildPlugin,lksctp,server,SCTP sockets using linux kernel,@BROKEN)) # Missing libraries/header files
$(eval $(call BuildPlugin,mgcpca,server,Media Gateway Control Protocol Agent,))
$(eval $(call BuildPlugin,mgcpgw,server,Media Gateway Control Protocol Gateway,))
$(eval $(call BuildPlugin,moh,,On Hold (music) Generator,))
$(eval $(call BuildPlugin,monitoring,server,Monitoring/gathering Information,))
$(eval $(call BuildPlugin,mrcpspeech,server,MRCP v2 Voice/Tone Detector and Synthesizer,))
$(eval $(call BuildPlugin,msgsniff,,Sample Message Sniffer,))
$(eval $(call BuildPlugin,mux,,Data Multiplexor,))
$(eval $(call BuildPlugin,mysqldb,server,MySQL Backend DB,+libmysqlclient))
$(eval $(call BuildPlugin,openssl,,Encrypted transport (OpenSSL),+libopenssl))
$(eval $(call BuildPlugin,osschan,client,OSS Sound Channel,))
$(eval $(call BuildPlugin,park,server,Call Parking,))
$(eval $(call BuildPlugin,pbx,,PBX Message Handlers,))
$(eval $(call BuildPlugin,pbxassist,server,Full featured PBX and IVR,))
$(eval $(call BuildPlugin,pgsqldb,server,PostgrestSQL Backend DB,+libpq))
$(eval $(call BuildPlugin,presence,server,Presence,))
$(eval $(call BuildPlugin,regfile,server,Registration based on users in file,))
$(eval $(call BuildPlugin,queues,server,Call Distribution and Queues from Database,))
$(eval $(call BuildPlugin,queuesnotify,server,Notify when queued call status changes,))
$(eval $(call BuildPlugin,regexroute,,Regular Expression Based Routing,))
$(eval $(call BuildPlugin,rmanager,,Yate Remote Management,))
$(eval $(call BuildPlugin,sip_cnam_lnp,sip,Query CNAM and LNP databases using SIP INVITE,))
$(eval $(call BuildPlugin,sigtransport,server,SIGTRAN (SS7 over IP) connection provider,))
$(eval $(call BuildPlugin,sipfeatures,server,SIP Features (SUBSCRIBE/NOTIFY),))
$(eval $(call BuildPlugin,speexcodec,,Speex Codec,+libspeex))
$(eval $(call BuildPlugin,subscription,server,Subcription handler and presence notifier,))
$(eval $(call BuildPlugin,tdmcard,server,TDM Cards Signalling and Data Driver,@BROKEN)) # Missing TDM libraries
$(eval $(call BuildPlugin,tonedetect,,Detectors for Various Tones,))
$(eval $(call BuildPlugin,tonegen,,Tones Generator,))
$(eval $(call BuildPlugin,users,server,Users,))
$(eval $(call BuildPlugin,wavefile,,Wav file Record and Playback,))
$(eval $(call BuildPlugin,wpcard,server,Wanpipe PRI cards Signalling and Data Driver,@BROKEN)) # Mising wanpipe and PRI libraries
$(eval $(call BuildPlugin,yiaxchan,,IAX Channel,))
$(eval $(call BuildPlugin,yjinglechan,,Jingle Channel,))
$(eval $(call BuildPlugin,yrtpchan,,RTP Channel and Other Data Helper,))
$(eval $(call BuildPlugin,yradius,server,RADIUS Client,))
$(eval $(call BuildPlugin,ysigchan,server,SS7/ISDN Protocols - Yate Signalling Library,))
$(eval $(call BuildPlugin,ysipchan,,SIP Channel,))
$(eval $(call BuildPlugin,ysockschan,,SOCKS Channel,))
$(eval $(call BuildPlugin,ysnmpagent,server,SNMP Protocol Agent,))
$(eval $(call BuildPlugin,ystunchan,,STUN Support,))
$(eval $(call BuildPlugin,zapcard,server,Zaptel Card Signalling and Data Driver,+zaptel14-libtonezone))
$(eval $(call BuildPlugin,zlibcompress,,Zlib Compression,+zlib))
