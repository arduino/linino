#
# Copyright (C) 2009-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nginx
PKG_VERSION:=1.2.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://nginx.org/download/
PKG_MD5SUM:=1350d26eb9b66364d9143fb3c4366ab6

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

PKG_CONFIG_DEPENDS := \
	CONFIG_NGINX_STUB_STATUS \
	CONFIG_NGINX_FLV \
	CONFIG_NGINX_SSL \
	CONFIG_NGINX_DAV \
	CONFIG_NGINX_MODULE_LUA \
	CONFIG_NGINX_DISABLE_PCRE \
	CONFIG_NGINX_DISABLE_HTTP_CHARSET_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_GZIP_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_SSI_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_USERID_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_ACCESS_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_AUTH_BASIC_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_AUTOINDEX_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_GEO_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_MAP_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_SPLIT_CLIENTS_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_REFERER_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_REWRITE_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_PROXY_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_FASTCGI_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_UWSGI_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_SCGI_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_MEMCACHED_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_LIMIT_CONN_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_LIMIT_REQ_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_EMPTY_GIF_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_BROWSER_MODULE \
	CONFIG_NGINX_DISABLE_HTTP_UPSTREAM_IP_HASH_MODULE

include $(INCLUDE_DIR)/package.mk

define Package/nginx
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Nginx web server
  URL:=http://nginx.org/
  DEPENDS:=+!NGINX_DISABLE_PCRE:libpcre +NGINX_SSL:libopenssl +!NGINX_DISABLE_HTTP_GZIP_MODULE:zlib +libpthread +NGINX_MODULE_LUA:liblua
  MENU:=1
endef

define Package/nginx/description
 nginx is an HTTP and reverse proxy server, as well as a mail proxy server,
 written by Igor Sysoev.
endef

define Package/nginx/config
  source "$(SOURCE)/Config.in"
endef

config_files=nginx.conf mime.types fastcgi_params koi-utf koi-win win-utf

define Package/nginx/conffiles
/etc/nginx/
endef

ADDITIONAL_MODULES:=

ifeq ($(CONFIG_IPV6),y)
  ADDITIONAL_MODULES += --with-ipv6
endif
ifeq ($(CONFIG_NGINX_STUB_STATUS),y)
  ADDITIONAL_MODULES += --with-http_stub_status_module
endif
ifeq ($(CONFIG_NGINX_FLV),y)
  ADDITIONAL_MODULES += --with-http_flv_module
endif
ifeq ($(CONFIG_NGINX_SSL),y)
  ADDITIONAL_MODULES += --with-http_ssl_module
else
  ADDITIONAL_MODULES += --without-http-cache
endif
ifeq ($(CONFIG_NGINX_DAV),y)
  ADDITIONAL_MODULES += --with-http_dav_module
endif
ifeq ($(CONFIG_NGINX_MODULE_LUA),y)
  ADDITIONAL_MODULES += --add-module=$(PKG_BUILD_DIR)/lua-nginx
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_CACHE),y)
  ADDITIONAL_MODULES += --without-http-cache
endif
ifeq ($(CONFIG_NGINX_DISABLE_PCRE),y)
  ADDITIONAL_MODULES += --without-pcre
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_CHARSET_MODULE),y)
  ADDITIONAL_MODULES += --without-http_charset_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_GZIP_MODULE),y)
  ADDITIONAL_MODULES += --without-http_gzip_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_SSI_MODULE),y)
  ADDITIONAL_MODULES += --without-http_ssi_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_USERID_MODULE),y)
  ADDITIONAL_MODULES += --without-http_userid_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_ACCESS_MODULE),y)
  ADDITIONAL_MODULES += --without-http_access_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_AUTH_BASIC_MODULE),y)
  ADDITIONAL_MODULES += --without-http_auth_basic_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_AUTOINDEX_MODULE),y)
  ADDITIONAL_MODULES += --without-http_autoindex_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_GEO_MODULE),y)
  ADDITIONAL_MODULES += --without-http_geo_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_MAP_MODULE),y)
  ADDITIONAL_MODULES += --without-http_map_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_SPLIT_CLIENTS_MODULE),y)
  ADDITIONAL_MODULES += --without-http_split_clients_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_REFERER_MODULE),y)
  ADDITIONAL_MODULES += --without-http_referer_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_REWRITE_MODULE),y)
  ADDITIONAL_MODULES += --without-http_rewrite_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_PROXY_MODULE),y)
  ADDITIONAL_MODULES += --without-http_proxy_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_FASTCGI_MODULE),y)
  ADDITIONAL_MODULES += --without-http_fastcgi_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_UWSGI_MODULE),y)
  ADDITIONAL_MODULES += --without-http_uwsgi_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_SCGI_MODULE),y)
  ADDITIONAL_MODULES += --without-http_scgi_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_MEMCACHED_MODULE),y)
  ADDITIONAL_MODULES += --without-http_memcached_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_LIMIT_CONN_MODULE),y)
  ADDITIONAL_MODULES += --without-http_limit_conn_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_LIMIT_REQ_MODULE),y)
  ADDITIONAL_MODULES += --without-http_limit_req_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_EMPTY_GIF_MODULE),y)
  ADDITIONAL_MODULES += --without-http_empty_gif_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_BROWSER_MODULE),y)
  ADDITIONAL_MODULES += --without-http_browser_module
endif
ifeq ($(CONFIG_NGINX_DISABLE_HTTP_UPSTREAM_IP_HASH_MODULE),y)
  ADDITIONAL_MODULES += --without-http_upstream_ip_hash_module
endif

define Build/Configure
	# TODO: fix --crossbuild
	(cd $(PKG_BUILD_DIR) ;\
		$(if $(CONFIG_NGINX_MODULE_LUA),LUA_INC=$(STAGING_DIR)/usr/include LUA_LIB=$(STAGING_DIR)/usr/lib) \
		./configure \
			--crossbuild=Linux::$(ARCH) \
			--prefix=/usr \
			--conf-path=/etc/nginx/nginx.conf \
			--error-log-path=/var/log/nginx/error.log \
			--pid-path=/var/run/nginx.pid \
			--lock-path=/var/lock/nginx.lock \
			--http-log-path=/var/log/nginx/access.log \
			--http-client-body-temp-path=/var/lib/nginx/body \
			--http-proxy-temp-path=/var/lib/nginx/proxy \
			--http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
			--with-cc="$(TARGET_CC)" \
			--with-cc-opt="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS)" \
			--with-ld-opt="$(TARGET_LDFLAGS)" \
			$(ADDITIONAL_MODULES) )
endef

define Package/nginx/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/nginx $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/nginx
	$(INSTALL_DATA) $(addprefix $(PKG_INSTALL_DIR)/etc/nginx/,$(config_files)) $(1)/etc/nginx/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/nginx.init $(1)/etc/init.d/nginx
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(if $(CONFIG_NGINX_MODULE_LUA),$(call Prepare/lua-nginx))
endef

define Download/lua-nginx
	VERSION:=7c0948a08e8449f7a9ffbc35244954e6aaddac5b
	SUBDIR:=lua-nginx
	FILE:=lua-nginx-module-$(PKG_VERSION)-$$(VERSION).tar.gz
	URL:=https://github.com/chaoslawful/lua-nginx-module.git
	PROTO:=git
endef

define  Prepare/lua-nginx
	$(eval $(call Download,lua-nginx))
	gzip -dc $(DL_DIR)/$(FILE) | tar -C $(PKG_BUILD_DIR) $(TAR_OPTIONS)
	$(call PatchDir,$(PKG_BUILD_DIR),./patches-lua-nginx)
endef

$(eval $(call BuildPackage,nginx))
