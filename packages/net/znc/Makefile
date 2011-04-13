#
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=znc
PKG_VERSION:=0.098
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://znc.in/releases
PKG_MD5SUM:=5667b4acb1f01309d6eded77abac700c

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/znc/default
  SUBMENU:=Instant Messaging
  SECTION:=net
  CATEGORY:=Network
  TITLE:=ZNC
  URL:=http://en.znc.in/
  MAINTAINER:=Jonas Gorski <jonas.gorski+openwrt@gmail.com>
endef

define Package/znc
  $(Package/znc/default)
  DEPENDS:=+libopenssl +uclibcxx
  MENU:=1
endef

define Package/znc/description
	ZNC is an IRC bouncer with many advanced features like detaching,
	multiple users, per channel playback buffer, SSL, IPv6, transparent DCC
	bouncing, and c++ module support to name a few.
endef

define Package/znc/conffiles
/etc/config/znc
endef


CONFIGURE_VARS += \
	CXX="$(STAGING_DIR)/host/bin/g++-uc" \
	CXXFLAGS="$(TARGET_CFLAGS) -fno-builtin -fno-rtti -nostdinc++" \
	CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
	LDFLAGS="-nodefaultlibs -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
	LIBS="-luClibc++ -lm -lssl -lcrypto $(LIBGCC_S) -lc"

CONFIGURE_ARGS += \
	--disable-c-ares \
	--enable-extra \
	--disable-perl

MAKE_FLAGS += \
	CXX="$(STAGING_DIR)/host/bin/g++-uc"

define Build/Configure
	$(call Build/Configure/Default,)
	$(call libtool_disable_rpath)
endef

define Build/Compile
	$(call Build/Compile/Default,znc modules)
endef

define Package/znc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/znc $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/znc.init $(1)/etc/init.d/znc
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/znc.conf $(1)/etc/config/znc
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/extra/droproot.so $(1)/usr/lib/znc/
endef


ZNC_MODULES :=

define module
  define Package/znc-mod-$(strip $(1))
    $(Package/znc/default)
    TITLE+= ($(strip $(1)) plugin)
    DEPENDS:=znc
  endef

  define Package/znc-mod-$(strip $(1))/description
   $(strip $(2))
  endef

  define Package/znc-mod-$(strip $(1))/install
	$(INSTALL_DIR) $$(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/$(strip $(3))$(subst -,_,$(strip $(1))).so $$(1)/usr/lib/znc/
  endef

  ZNC_MODULES += znc-mod-$(strip $(1))
endef


, := ,

$(eval $(call module,admin,Allows you to add/remove/edit users and settings on \
	the fly via IRC messages.))

$(eval $(call module,adminlog,Log user connects and disconnects and failed \
	logins to file or syslog.))

$(eval $(call module,autoattach,Reattaches you to channels on activity.))

$(eval $(call module,autocycle,Cycles a channel when you are the only one in \
	there and you don't have op.))

$(eval $(call module,autoop,Auto op the good guys.))

$(eval $(call module,autoreply,Gives a automatic reply if someone messages you \
	if you are away.))

$(eval $(call module,away,Stores messages while away$(,) also auto away.))

$(eval $(call module,awaynick,Change your nick while you are away.))

$(eval $(call module,blockuser,Blocks certain users from using ZNC saying \
	their account was disabled.))

$(eval $(call module,buffextras,Add nick changes$(,) joins$(,) parts$(,) topic \
	changes etc. to your playback buffer.))

$(eval $(call module,certauth,This module allows users to log in via SSL \
	client keys.))

$(eval $(call module,chansaver,Keeping config up to date when user joins and \
	parts.))

$(eval $(call module,clientnotify,Notify about new incoming connections to \
	your user.))

$(eval $(call module,crypt,Encryption for channel/private messages.))

$(eval $(call module,disconkick,This module will kick your client from all \
	channels where you are$(,) in case if ZNC disconnects from server.))

$(eval $(call module,fail2ban,Block IPs for some time after a failed login.))

$(eval $(call module,fixfreenode,This module blocks some freenode-specific \
	feature which results in plus (+) and minus (-) signs being displayed in \
	front of every message from a client.))

$(eval $(call module,keepnick,Tries to get you your primary nick.))

$(eval $(call module,kickrejoin,Implements auto-rejoin-on-kick.))

$(eval $(call module,lastseen,Logs when a user last logged in to ZNC.))

$(eval $(call module,nickserv,Auths you with NickServ.))

$(eval $(call module,notes,This modules stores and displays short notes using \
	a key/note pairs and shows them to you on connect.))

$(eval $(call module,partyline,Allows ZNC users to join internal channels and \
	query other ZNC users on the same ZNC.))

$(eval $(call module,perform,Performs commands on connect.))

$(eval $(call module,q,Auths you with Q (and a little more).))

$(eval $(call module,raw,View all of the raw traffic.))

$(eval $(call module,route-replies,Routes back answers to the right client \
	when connected with multiple clients.))

$(eval $(call module,savebuff,Saves your channel buffers into an encrypted \
	file so they can survive restarts and reboots.))

$(eval $(call module,schat,SSL (encrypted) DCC chats.))

$(eval $(call module,simple-away,This module will automatically set you away \
	on IRC while you are disconnected from the bouncer.))

$(eval $(call module,stickychan,Keeps you sticked to specific channels.))

$(eval $(call module,watch,Monitor activity for specific text patterns from \
	specific users and have the text sent to a special query window.))

$(eval $(call module,webadmin,Allows you to add/remove/edit users and settings \
	on the fly via a web browser.))

$(eval $(call module,antiidle,Hides your idle time.,extra/))

$(eval $(call module,autovoice,Autovoices everyone who joins some channel., \
	extra/))

$(eval $(call module,block-motd,This module blocks the server's Message of the \
	Day.,extra/))

$(eval $(call module,clearbufferonmsg,This module keeps the buffer until the \
	next message from the client.,extra/))

$(eval $(call module,ctcpflood,This module tries to block ctcp floods.,extra/))

$(eval $(call module,fakeonline,This module fakes the online status of \
	ZNC-*users.,extra/))

$(eval $(call module,flooddetach,This module detaches you from channels which \
	are flooded.,extra/))

$(eval $(call module,listsockets,This module displays a list of all open \
	sockets in ZNC.,extra/))

$(eval $(call module,log,Log conversations to file.,extra/))

$(eval $(call module,motdfile,Reads a MOTD from a file and displays it to \
	users when they login.,extra/))

$(eval $(call module,notify-connect,Sends a notice to all admins when a user \
	logs in or out.,extra/))

$(eval $(call module,send-raw,Allows you to send raw traffic to IRC from \
	other users.,extra/))

$(eval $(call module,shell,Have your unix shell in a query window right inside \
	of your IRC client.,extra/))

$(eval $(call BuildPackage,znc))

PKG_CONFIG_DEPENDS := $(patsubst %,CONFIG_PACKAGE_%,$(ZNC_MODULES))
$(foreach m,$(ZNC_MODULES),$(eval $(call BuildPackage,$(m))))
