#
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=znc
PKG_VERSION:=0.094
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/znc
PKG_MD5SUM:=db101f7a7756285d824b59e3b33e3ad5

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/znc/default
  SUBMENU:=Instant Messaging
  SECTION:=net
  CATEGORY:=Network
  TITLE:=ZNC
  URL:=http://en.znc.in/
endef

define Package/znc
  $(Package/znc/default)
  DEPENDS:=+libopenssl +uclibcxx +coreutils-su
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

define Package/znc-mod-admin
  $(Package/znc/default)
  TITLE+= (admin plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-admin/description
 Allows you to add/remove/edit users and settings on the fly via IRC messages.
endef

define Package/znc-mod-adminlog
  $(Package/znc/default)
  TITLE+= (adminlog plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-adminlog/description
 Log user connects and disconnects and failed logins to file or syslog.
endef

define Package/znc-mod-autoattach
  $(Package/znc/default)
  TITLE+= (autoattach plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-autoattach/description
 Reattaches you to channels on activity.
endef


define Package/znc-mod-autocycle
  $(Package/znc/default)
  TITLE+= (autocycle plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-autocycle/description
 Cycles a channel when you are the only one in there and you don't have op.
endef

define Package/znc-mod-autoop
  $(Package/znc/default)
  TITLE+= (autoop plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-autoop/description
 Auto op the good guys.
endef

define Package/znc-mod-autoreply
  $(Package/znc/default)
  TITLE+= (autoreply plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-autoreply/description
 Gives a automatic reply if someone messages you if you are away.
endef

define Package/znc-mod-away
  $(Package/znc/default)
  TITLE+= (away plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-away/description
 Stores messages while away, also auto away.
endef

define Package/znc-mod-awaynick
  $(Package/znc/default)
  TITLE+= (awaynick plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-awaynick/description
 Change your nick while you are away.
endef

define Package/znc-mod-blockuser
  $(Package/znc/default)
  TITLE+= (blockuser plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-blockuser/description
 Blocks certain users from using ZNC saying their account was disabled.
endef

define Package/znc-mod-buffextras
  $(Package/znc/default)
  TITLE+= (buffextras plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-buffextras/description
 Add nick changes, joins, parts, topic changes etc. to your playback buffer.
endef

define Package/znc-mod-certauth
  $(Package/znc/default)
  TITLE+= (certauth plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-certauth/description
 This module allows users to log in via SSL client keys.
endef

define Package/znc-mod-chansaver
  $(Package/znc/default)
  TITLE+= (chansaver plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-chansaver/description
 Keeping config up to date when user joins and parts.
endef

define Package/znc-mod-clientnotify
  $(Package/znc/default)
  TITLE+= (clientnotify plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-clientnotify/description
 Notify about new incoming connections to your user.
endef

define Package/znc-mod-crypt
  $(Package/znc/default)
  TITLE+= (crypt plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-crypt/description
 Encryption for channel/private messages.
endef

define Package/znc-mod-disconkick
  $(Package/znc/default)
  TITLE+= (disconkick plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-disconkick/description
 This module will kick your client from all channels where you are, in case if ZNC disconnects from server.
endef

define Package/znc-mod-fail2ban
  $(Package/znc/default)
  TITLE+= (fail2ban plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-fail2ban/description
 Block IPs for some time after a failed login.
endef

define Package/znc-mod-fixfreenode
  $(Package/znc/default)
  TITLE+= (fixfreenode plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-fixfreenode/description
 This module blocks some freenode-specific feature which results in plus (+)
 and minus (-) signs being displayed in front of every message from a client.
endef

define Package/znc-mod-keepnick
  $(Package/znc/default)
  TITLE+= (keepnick plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-keepnick/description
 Tries to get you your primary nick.
endef

define Package/znc-mod-kickrejoin
  $(Package/znc/default)
  TITLE+= (kickrejoin plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-kickrejoin/description
 Implements auto-rejoin-on-kick.
endef

define Package/znc-mod-lastseen
  $(Package/znc/default)
  TITLE+= (lastseen plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-lastseen/description
 Logs when a user last logged in to ZNC.
endef

define Package/znc-mod-nickserv
  $(Package/znc/default)
  TITLE+= (nickserv plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-nickserv/description
 Auths you with NickServ.
endef

define Package/znc-mod-notes
  $(Package/znc/default)
  TITLE+= (notes plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-notes/description
 This modules stores and displays short notes using a key/note pairs and shows them to you on connect.
endef

define Package/znc-mod-partyline
  $(Package/znc/default)
  TITLE+= (partyline plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-partyline/description
 Allows ZNC users to join internal channels and query other ZNC users
 on the same ZNC.
endef

define Package/znc-mod-perform
  $(Package/znc/default)
  TITLE+= (perform plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-perform/description
 Performs commands on connect.
endef

define Package/znc-mod-q
  $(Package/znc/default)
  TITLE+= (q plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-q/description
 Auths you with Q (and a little more).
endef

define Package/znc-mod-raw
  $(Package/znc/default)
  TITLE+= (raw plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-raw/description
 View all of the raw traffic.
endef

define Package/znc-mod-route-replies
  $(Package/znc/default)
  TITLE+= (route replies plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-route-replies/description
 Routes back answers to the right client when connected with multiple clients.
endef

define Package/znc-mod-savebuff
  $(Package/znc/default)
  TITLE+= (savebuff plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-savebuff/description
 Saves your channel buffers into an encrypted file so they can survive
 restarts and reboots.
endef

define Package/znc-mod-schat
  $(Package/znc/default)
  TITLE+= (schat plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-schat/description
 SSL (encrypted) DCC chats.
endef

define Package/znc-mod-simple-away
  $(Package/znc/default)
  TITLE+= (simple away plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-simple-away/description
 This module will automatically set you away on IRC while you are disconnected from the bouncer.
endef

define Package/znc-mod-stickychan
  $(Package/znc/default)
  TITLE+= (stickychan plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-stickychan/description
 Keeps you sticked to specific channels.
endef

define Package/znc-mod-watch
  $(Package/znc/default)
  TITLE+= (watch plugin)
  DEPENDS:=znc
endef

define Package/znc-mod-watch/description
 Monitor activity for specific text patterns from specific users and have
 the text sent to a special query window.
endef

CONFIGURE_VARS += \
	CXX="$(STAGING_DIR)/host/bin/g++-uc"
	CXXFLAGS="$(TARGET_CFLAGS) -fno-builtin -fno-rtti -nostdinc++" \
	CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
	LDFLAGS="-nodefaultlibs -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
	LIBS="-luClibc++ -lm -lssl $(LIBGCC_S) -lc"

CONFIGURE_ARGS += \
	--disable-c-ares \
	--disable-perl

MAKE_FLAGS += \
	CXX="$(STAGING_DIR)/host/bin/g++-uc"

define Build/Configure
	# webadmin doesn't compile
	$(RM) $(PKG_BUILD_DIR)/modules/webadmin.cpp
	$(call Build/Configure/Default,)
	$(call libtool_disable_rpath)
endef

define Package/znc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/znc $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/znc.init $(1)/etc/init.d/znc
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/znc.conf $(1)/etc/config/znc
endef

define Package/znc-mod-admin/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/admin.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-adminlog/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/adminlog.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-autoattach/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/autoattach.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-autocycle/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/autocycle.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-autoop/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/autoop.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-autoreply/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/autoreply.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-away/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/away.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-awaynick/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/awaynick.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-blockuser/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/blockuser.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-buffextras/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/buffextras.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-certauth/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/certauth.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-chansaver/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/chansaver.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-clientnotify/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/clientnotify.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-crypt/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/crypt.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-disconkick/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/disconkick.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-fail2ban/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/fail2ban.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-fixfreenode/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/fixfreenode.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-keepnick/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/keepnick.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-kickrejoin/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/kickrejoin.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-lastseen/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/lastseen.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-nickserv/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/nickserv.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-notes/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/notes.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-partyline/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/partyline.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-perform/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/perform.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-q/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/q.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-raw/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/raw.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-route-replies/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/route_replies.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-savebuff/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/savebuff.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-schat/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/schat.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-simple-away/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/simple_away.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-stickychan/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/stickychan.so $(1)/usr/lib/znc/
endef

define Package/znc-mod-watch/install
	$(INSTALL_DIR) $(1)/usr/lib/znc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/watch.so $(1)/usr/lib/znc/
endef

$(eval $(call BuildPackage,znc))
$(eval $(call BuildPackage,znc-mod-admin))
$(eval $(call BuildPackage,znc-mod-adminlog))
$(eval $(call BuildPackage,znc-mod-autoattach))
$(eval $(call BuildPackage,znc-mod-autocycle))
$(eval $(call BuildPackage,znc-mod-autoop))
$(eval $(call BuildPackage,znc-mod-autoreply))
$(eval $(call BuildPackage,znc-mod-away))
$(eval $(call BuildPackage,znc-mod-awaynick))
$(eval $(call BuildPackage,znc-mod-blockuser))
$(eval $(call BuildPackage,znc-mod-buffextras))
$(eval $(call BuildPackage,znc-mod-certauth))
$(eval $(call BuildPackage,znc-mod-chansaver))
$(eval $(call BuildPackage,znc-mod-clientnotify))
$(eval $(call BuildPackage,znc-mod-crypt))
$(eval $(call BuildPackage,znc-mod-disconkick))
$(eval $(call BuildPackage,znc-mod-fail2ban))
$(eval $(call BuildPackage,znc-mod-fixfreenode))
$(eval $(call BuildPackage,znc-mod-keepnick))
$(eval $(call BuildPackage,znc-mod-kickrejoin))
$(eval $(call BuildPackage,znc-mod-lastseen))
$(eval $(call BuildPackage,znc-mod-nickserv))
$(eval $(call BuildPackage,znc-mod-notes))
$(eval $(call BuildPackage,znc-mod-partyline))
$(eval $(call BuildPackage,znc-mod-perform))
$(eval $(call BuildPackage,znc-mod-q))
$(eval $(call BuildPackage,znc-mod-raw))
$(eval $(call BuildPackage,znc-mod-route-replies))
$(eval $(call BuildPackage,znc-mod-savebuff))
$(eval $(call BuildPackage,znc-mod-schat))
$(eval $(call BuildPackage,znc-mod-simple-away))
$(eval $(call BuildPackage,znc-mod-stickychan))
$(eval $(call BuildPackage,znc-mod-watch))
