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

include $(INCLUDE_DIR)/package.mk

define Package/freeswitch
  SECTION:=net
  CATEGORY:=Network
  TITLE:=FreeSWITCH open source telephony platform
  URL:=http://www.freeswitch.org/
  DEPENDS:=+libopenssl +libcurl +libreadline +libncurses +libpthread
endef

define Package/freeswitch/description
  FreeSWITCH is an open source telephony platform designed to 
  facilitate the creation of voice and chat driven products scaling 
  from a soft-phone up to a soft-switch.
endef

FS_MODULES_DISABLED:= \
	applications/mod_cluechoo \
	codecs/mod_amr \
	codecs/mod_ilbc \
	codecs/mod_siren \
	languages/mod_lua \
	languages/mod_spidermonkey \
	languages/mod_spidermonkey_curl \
	languages/mod_spidermonkey_teletone \
	languages/mod_spidermonkey_core_db \
	languages/mod_spidermonkey_socket \
	say/mod_say_ru \

CONFIGURE_ARGS+= \
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
	LIBS="-lpthread" \
	ac_cv_file_dbd_apr_dbd_mysql_c="no" \
	apr_cv_process_shared_works="no" \
	apr_cv_tcp_nodelay_with_cork="yes" \

#	apr_cv_gai_addrconfig="yes"
#	apr_cv_mutex_recursive="no"
#	apr_cv_mutex_robust_shared="no"
#	apr_cv_pthreads_lib="-lpthread"
	
#	SWITCH_CONF_DIR="/etc/freeswitch"
#	ac_cv_file_dbd_apr_dbd_mysql_c="no"
#	ac_cv_cflags_warn_all_ansi=no

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./rebootstrap.sh; )
$(call Build/Configure/Default)
	$(foreach m,$(FS_MODULES_DISABLED), \
		$(SED) 's|^\($(m)\)$$$$|# \1|g' $(PKG_BUILD_DIR)/modules.conf; \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
		all install
endef

define Package/freeswitch/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/db
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/log
	$(CP) $(PKG_INSTALL_DIR)/usr/log/* $(1)/usr/log/
	$(INSTALL_DIR) $(1)/usr/lib/freeswitch
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/freeswitch/*.so $(1)/usr/lib/freeswitch/
	$(INSTALL_DIR) $(1)/etc/freeswitch
	$(CP) $(PKG_INSTALL_DIR)/etc/freeswitch/ $(1)/etc/freeswitch/
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_DATA)  ./files/freeswitch.default $(1)/etc/default/freeswitch
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN)  ./files/freeswitch.init $(1)/etc/init.d/freeswitch
endef

$(eval $(call BuildPackage,freeswitch))
