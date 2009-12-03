#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nginx
PKG_VERSION:=0.7.61
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://sysoev.ru/nginx/
PKG_MD5SUM:=6ebf89b9b00a3b82734e93c32da7df07

include $(INCLUDE_DIR)/package.mk

define Package/nginx
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcre +libopenssl
  TITLE:=Nginx web server
  URL:=http://nginx.net/
endef

define Package/nginx/description
	Nginx is a free, open-source, high-performance HTTP server
	and reverse proxy, as well as an IMAP/POP3 proxy server,
	written by Igor Sysoev.
endef

config_files=nginx.conf mime.types fastcgi_params koi-utf koi-win win-utf

define Build/Configure
	# fix --crossbuild
	(cd $(PKG_BUILD_DIR) ;\
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
			--with-http_stub_status_module \
			--with-http_ssl_module \
			--with-ipv6 )
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR=$(PKG_INSTALL_DIR) \
		build install
endef

define Package/nginx/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/nginx $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/nginx
	$(INSTALL_DATA) $(addprefix $(PKG_INSTALL_DIR)/etc/nginx/,$(config_files)) $(1)/etc/nginx
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/nginx.init $(1)/etc/init.d/nginx
endef

$(eval $(call BuildPackage,nginx))
