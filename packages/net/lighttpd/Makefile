#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lighttpd
PKG_VERSION:=1.4.20
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.lighttpd.net/download/
PKG_MD5SUM:=ed6ee0bb714f393219a32768d86984d8

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/lighttpd/Default
  SUBMENU:=Web
  SECTION:=net
  CATEGORY:=Network
  URL:=http://www.lighttpd.net/
endef

define Package/lighttpd
  $(call Package/lighttpd/Default)
  MENU:=1
  DEPENDS:=+libopenssl +libpcre +libpthread +libsqlite3 +libxml2
  TITLE:=A flexible and lightweight web server
endef

define Package/lighttpd-mod-accesslog
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=Access logging module
endef

define Package/lighttpd-mod-alias
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=Directory alias module
endef

define Package/lighttpd-mod-auth
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=Authentication module
endef

define Package/lighttpd-mod-cgi
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=CGI module
endef

define Package/lighttpd-mod-evasive
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=Evasive module
endef

define Package/lighttpd-mod-expire
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=Expire module
endef

define Package/lighttpd-mod-fastcgi
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=FastCGI module
endef

define Package/lighttpd-mod-proxy
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=Proxy module
endef

define Package/lighttpd-mod-redirect
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=URL redirection module
endef

define Package/lighttpd-mod-rewrite
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=URL rewriting module
endef

define Package/lighttpd-mod-setenv
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=Environment variable setting module
endef

define Package/lighttpd-mod-simple-vhost
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=Simple virtual hosting module
endef

define Package/lighttpd-mod-ssi
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=SSI module
endef

define Package/lighttpd-mod-status
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=Server status display module
endef

define Package/lighttpd-mod-usertrack
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=User tracking module
endef

define Package/lighttpd-mod-webdav
  $(call Package/lighttpd/Default)
  DEPENDS:=lighttpd
  TITLE:=WebDAV module
endef


CONFIGURE_ARGS+= \
	--libdir=/usr/lib/lighttpd \
	--sysconfdir=/etc/lighttpd \
	--enable-shared \
	--enable-static \
	--disable-rpath \
	--without-attr \
	--without-bzip2 \
	--without-fam \
	--without-gdbm \
	--without-ldap \
	--without-lua \
	--without-memcache \
	--without-mysql \
	--with-openssl="$(STAGING_DIR)/usr" \
	--with-pcre \
	--without-valgrind \
	--with-webdav-props \

CONFIGURE_VARS+= \
	CPPFLAGS="-I$(STAGING_DIR)/usr/include/libxml2 $$$$CPPFLAGS" \
	PCRE_LIB="-lpcre" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" all install
endef

define Package/lighttpd/conffiles
/etc/lighttpd.conf
/etc/default/lighttpd
endef

define Package/lighttpd/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/lighttpd.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_DATA) ./files/lighttpd.default $(1)/etc/default/lighttpd
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/lighttpd.init $(1)/etc/init.d/lighttpd
	$(INSTALL_DIR) $(1)/usr/lib/lighttpd
	for m in dirlisting indexfile staticfile; do \
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/lighttpd/mod_$$$${m}.so $(1)/usr/lib/lighttpd/ ; \
	done
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/lighttpd $(1)/usr/sbin/
endef

define BuildPlugin
  define Package/$(1)/install
	[ -z "$(2)" ] || $(INSTALL_DIR) $$(1)/usr/lib/lighttpd
	for m in $(2); do \
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/lighttpd/mod_$$$$$$$${m}.so $$(1)/usr/lib/lighttpd/ ; \
	done
  endef

  $$(eval $$(call BuildPackage,$(1)))
endef

$(eval $(call BuildPackage,lighttpd))
$(eval $(call BuildPlugin,lighttpd-mod-accesslog,accesslog))
$(eval $(call BuildPlugin,lighttpd-mod-alias,alias))
$(eval $(call BuildPlugin,lighttpd-mod-auth,auth))
$(eval $(call BuildPlugin,lighttpd-mod-cgi,cgi))
$(eval $(call BuildPlugin,lighttpd-mod-evasive,evasive))
$(eval $(call BuildPlugin,lighttpd-mod-expire, expire))
$(eval $(call BuildPlugin,lighttpd-mod-fastcgi,fastcgi))
$(eval $(call BuildPlugin,lighttpd-mod-proxy,proxy))
$(eval $(call BuildPlugin,lighttpd-mod-redirect,redirect))
$(eval $(call BuildPlugin,lighttpd-mod-rewrite,rewrite))
$(eval $(call BuildPlugin,lighttpd-mod-setenv,setenv))
$(eval $(call BuildPlugin,lighttpd-mod-simple-vhost,simple_vhost))
$(eval $(call BuildPlugin,lighttpd-mod-ssi,ssi))
$(eval $(call BuildPlugin,lighttpd-mod-status,status))
$(eval $(call BuildPlugin,lighttpd-mod-usertrack,usertrack))
$(eval $(call BuildPlugin,lighttpd-mod-webdav,webdav))
