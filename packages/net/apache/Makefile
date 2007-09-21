#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$ 

include $(TOPDIR)/rules.mk

PKG_NAME:=apache
PKG_VERSION:=2.2.6
PKG_RELEASE:=1
PKG_SOURCE_NAME:=httpd

PKG_SOURCE:=$(PKG_SOURCE_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.uni-erlangen.de/pub/mirrors/apache/httpd/
PKG_MD5SUM:=d050a49bd7532ec21c6bb593b3473a5d
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/apache/Default
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+apr +apr-util +zlib +libexpat +libpcre +libopenssl +libsqlite3
  TITLE:=The Apache Web Server
  URL:=http://httpd.apache.org/
  SUBMENU:=apache
endef

define Package/apache-server
  $(call Package/apache/Default)
  TITLE:=The apache server & and some tools
  DESCRIPTION:=\
	Take care that you don't include apache at the moment into your image\\\
	please select it only as module because busybox will override\\\
	/usr/sbin/httpd. It'll be solved soon. If you need to include this\\\
	package in the image anyway, remove httpd from busybox\\\
	(Base system --> Configuration --> Networking Utilities --> httpd).\\\
	Also you should take care for the initscripts, apache's httpd isn't\\\
	compatible with the one from busybox, so if you want to use apache\\\
	for running your webif, you'll need to change the parameters in the\\\
	scripts and configure the rest in /etc/httpd.conf.
endef

define Package/apache-icons
  $(call Package/apache/Default)
  TITLE:=Icons from Apache
  DEPENDS:=
endef

define Build/Configure	
	$(call Build/Configure/Default, \
		--with-apr="$(STAGING_DIR)/usr/bin/apr-1-config" \
		--with-apr-util="$(STAGING_DIR)/usr/bin/apu-1-config" \
		--with-pcre="$(STAGING_DIR)/usr/bin/pcre-config" \
		--enable-http \
		--enable-ssl \
		--disable-disk-cache \
		--enable-maintainer-mode \
		--enable-mime-magic \
		--without-suexec-bin \
		ap_void_ptr_lt_long=no \
		logfiledir="/var/log" \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	rm -rf	$(PKG_INSTALL_DIR)/usr/man/ \
		$(PKG_INSTALL_DIR)/usr/share/manual/
	# if you need docs take a look into the build-dir :)
	mkdir -p $(STAGING_DIR)/etc
	$(CP)   $(PKG_INSTALL_DIR)/etc/* \
		$(STAGING_DIR)/etc
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP)	$(PKG_INSTALL_DIR)/usr/include/* \
		$(STAGING_DIR)/usr/include
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP)   $(PKG_INSTALL_DIR)/usr/lib/httpd.exp \
		$(STAGING_DIR)/usr/lib
	mkdir -p $(STAGING_DIR)/usr/sbin
	$(CP)   $(PKG_INSTALL_DIR)/usr/sbin/* \
		$(STAGING_DIR)/usr/sbin
	mkdir -p $(STAGING_DIR)/usr/share
	$(CP)   $(PKG_INSTALL_DIR)/usr/share/* \
		$(STAGING_DIR)/usr/share
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/include/{ap_*,http*,mod_*,mpm*,os.h,scoreboard.h,unixd.h,util_*} \
		$(STAGING_DIR)/etc/{httpd.conf,magic,mime.types,extra,original} \
		$(STAGING_DIR)/usr/sbin/{ab,apachectl,apxs,checkgid,dbmmanage,envvars,envvars-std,htcacheclean,htdbm,htdigest,htpasswd,httpd,httxt2dbm,logresolve,rotatelogs} \
		$(STAGING_DIR)/usr/share/{error,icons,htdocs,cgi-bin,build} \
		$(STAGING_DIR)/usr/lib/httpd.exp
endef

define Package/apache-server/preinst
	rm /usr/sbin/httpd
	echo -e "You should take a look in the initscripts, busybox's httpd \n\
	uses some parameters which are maybe unsupported by apache."
endef

define Package/apache-server/install
	$(INSTALL_DIR) $(1)/usr/sbin
	# we don't need apxs on the router, it's just for building apache modules.  
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/{ab,apachectl,checkgid,dbmmanage,envvars,envvars-std,htcacheclean,htdbm,htdigest,htpasswd,httpd,httxt2dbm,logresolve,rotatelogs} $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/httpd.exp $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/usr/share/{error,htdocs,cgi-bin,build} $(1)/usr/share/
	$(INSTALL_DIR) $(1)/etc/apache
	$(CP) $(PKG_INSTALL_DIR)/etc/{magic,mime.types,extra} $(1)/etc/apache/
	$(CP) ./files/etc/apache/httpd.conf $(1)/etc/apache/
endef

define Package/apache-server/postrm
	rm -rf /usr/sbin/httpd
	ln -s /bin/busybox /usr/sbin/httpd
	echo -e "You may need to change your initscripts back for the use \n\
		with busybox's httpd."
endef

define Package/apache-icons/install
	$(INSTALL_DIR) $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/usr/share/icons $(1)/usr/share/
endef

$(eval $(call BuildPackage,apache-server))
$(eval $(call BuildPackage,apache-icons))
