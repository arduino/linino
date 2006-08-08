# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lighttpd
PKG_VERSION:=1.4.11
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.lighttpd.net/download/
PKG_MD5SUM:=f55eebb9815c94a7de35906bb557ecd3
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/lighttpd
  MENU:=1
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +libpcre +libpthread
  TITLE:=A flexible and lightweight web server
  URL:=http://www.lighttpd.net/
endef

define Package/lighttpd/conffiles
/etc/lighttpd.conf
/etc/default/lighttpd
/etc/init.d/lighttpd
endef

define Package/lighttpd-mod-accesslog
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=Access logging module
endef

define Package/lighttpd-mod-alias
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=Directory alias module
endef

define Package/lighttpd-mod-auth
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=Authentication module
endef

define Package/lighttpd-mod-cgi
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=CGI module
endef

define Package/lighttpd-mod-evasive
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=Evasive module
endef

define Package/lighttpd-mod-expire
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=Expire module
endef

define Package/lighttpd-mod-fastcgi
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=FastCGI module
endef

define Package/lighttpd-mod-proxy
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=Proxy module
endef

define Package/lighttpd-mod-redirect
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=URL redirection module
endef

define Package/lighttpd-mod-rewrite
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=URL rewriting module
endef

define Package/lighttpd-mod-setenv
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=Environment variable setting module
endef

define Package/lighttpd-mod-simple-vhost
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=Simple virtual hosting module
endef

define Package/lighttpd-mod-ssi
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=SSI module
endef

define Package/lighttpd-mod-status
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=Server status display module
endef

define Package/lighttpd-mod-usertrack
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=User tracking module
endef

define Package/lighttpd-mod-webdav
  $(call Package/lighttpd)
  DEPENDS:=lighttpd
  TITLE:=WebDAV module
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include/libxml2 -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		PCRE_LIB="-lpcre" \
		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
		./configure \
			--target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--program-prefix="" \
			--program-suffix="" \
			--prefix=/usr \
			--exec-prefix=/usr \
			--bindir=/usr/bin \
			--datadir=/usr/share \
			--includedir=/usr/include \
			--infodir=/usr/share/info \
			--libdir=/usr/lib/lighttpd \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc/lighttpd \
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
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
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/lighttpd/install
	install -m0755 -d $(1)/etc
	install -m0644 ./files/lighttpd.conf $(1)/etc/
	install -m0755 -d $(1)/etc/default
	install -m0644 ./files/lighttpd.default $(1)/etc/default/lighttpd
	install -m0755 -d $(1)/etc/init.d
	install -m0755 ./files/lighttpd.init $(1)/etc/init.d/lighttpd
	install -m0755 -d $(1)/usr/lib/lighttpd
	for m in dirlisting indexfile staticfile; do \
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/lighttpd/mod_$$$${m}.so $(1)/usr/lib/lighttpd/ ; \
	done
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/lighttpd $(1)/usr/sbin/
endef

define BuildPlugin
  define Package/$(1)/install
	[ -z "$(2)" ] || install -d -m0755 $$(1)/usr/lib/lighttpd
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
