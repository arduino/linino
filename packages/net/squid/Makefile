#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$
#
include $(TOPDIR)/rules.mk

PKG_NAME:=squid
PKG_VERSION:=2.5.STABLE13
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.squid-cache.org/Versions/v2/2.5/
PKG_MD5SUM:=3e64468e123be1246d17486dab6bee87
PKG_CAT:=bzcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/squid
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl
  TITLE:=full-featured Web proxy cache
  DESCRIPTION:=Squid is a high-performance proxy caching server for web clients, \\\
    supporting FTP, gopher, and HTTP data objects. Unlike traditional \\\
    caching software, Squid handles all requests in a single, \\\
    non-blocking, I/O-driven process.
  URL:=http://www.squid-cache.org
  MENU:=1
endef

define Package/squid-mod-basic-auth-getpwnam
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=squid
  TITLE:=getpwnam basic authentication helper
endef

define Package/squid-mod-basic-auth-ncsa
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=squid
  TITLE:=NCSA basic authentication helper
endef

define Package/squid-mod-basic-auth-smb
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=squid
  TITLE:=Samba basic authentication helper
endef

define Package/squid-mod-basic-auth-winbind
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=squid
  TITLE:=Winbind basic authentication helper
endef

define Package/squid-mod-digest-auth-password
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=squid
  TITLE:=Password digest authentication helper
endef

define Package/squid-mod-external-acl-ip-user
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=squid
  TITLE:=IP user external ACL helper
endef

define Package/squid-mod-external-acl-unix-group
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=squid
  TITLE:=Unix group external ACL helper
endef

define Package/squid-mod-external-acl-winbind-group
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=squid
  TITLE:=Winbind group external ACL helper
endef

define Package/squid-mod-ntlm-auth-fakeauth
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=squid
  TITLE:=Fakeauth NTLM authentication helper
endef

define Package/squid-mod-ntlm-auth-smb-auth
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=squid
  TITLE:=Samba NTLM authentication helper
endef

define Package/squid-mod-ntlm-auth-winbind-auth
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=squid
  TITLE:=Winbind NTLM authentication helper
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -rf config.cache; \
                $(TARGET_CONFIGURE_OPTS) \
                CFLAGS="$(TARGET_CFLAGS)" \
                CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
                LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
                ac_cv_sizeof_void_p=4 \
                ac_cv_sizeof_short=2 \
                ac_cv_sizeof_int=4 \
                ac_cv_sizeof_long=4 \
                ac_cv_sizeof_long_long=8 \
                ac_cv_sizeof___int64=0 \
                ac_cv_sizeof_int16_t=2 \
                ac_cv_sizeof_uint16_t=2 \
                ac_cv_sizeof_u_int16_t=2 \
                ac_cv_sizeof_int32_t=4 \
                ac_cv_sizeof_uint32_t=4 \
                ac_cv_sizeof_u_int32_t=4 \
                ac_cv_sizeof_int64_t=8 \
                ac_cv_sizeof_uint64_t=8 \
                ac_cv_sizeof_u_int64_t=8 \
                ac_cv_func_setresuid=no \
                ac_cv_func_va_copy=no \
                ac_cv_func___va_copy=no \
                ./configure \
                        --target=$(GNU_TARGET_NAME) \
                        --host=$(GNU_TARGET_NAME) \
                        --build=$(GNU_HOST_NAME) \
                        --program-prefix="" \
                        --program-suffix="" \
                        --prefix=/usr \
                        --exec-prefix=/usr \
                        --bindir=/usr/bin \
                        --datadir=/usr/share/squid \
                        --includedir=/usr/include \
                        --infodir=/usr/share/info \
                        --libdir=/usr/lib \
                        --libexecdir=/usr/lib/squid \
                        --localstatedir=/var \
                        --mandir=/usr/share/man \
                        --sbindir=/usr/sbin \
                        --sysconfdir=/etc/squid \
                        $(DISABLE_LARGEFILE) \
                        --enable-shared \
                        --enable-static \
                        --with-gnu-ld \
                        --enable-x-accelerator-vary \
                        --with-pthreads \
                        --with-dl \
                        --enable-icmp \
                        --enable-kill-parent-hack \
                        --enable-arp-acl \
                        --enable-ssl \
                        --enable-htcp \
                        --enable-err-languages=English \
                        --enable-default-err-language=English \
                        --enable-linux-netfilter \
                        --enable-icmp \
                        --enable-external-acl-helpers="" \
                        --enable-underscores \
			--enable-cache-digests \
                        --enable-referer-log \
                        --enable-delay-pools \
                        --enable-useragent-log \
                        --with-openssl=$(STAGING_DIR)/usr \
                        --enable-auth="basic digest ntlm" \
                        --enable-basic-auth-helpers="getpwnam NCSA SMB winbind" \
                        --enable-ntlm-auth-helpers="fakeauth SMB winbind" \
                        --enable-digest-auth-helpers="password" \
                        --enable-external-acl-helpers="ip_user unix_group winbind_group" \
        );
endef
	
define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR=$(PKG_INSTALL_DIR) \
		all install
endef

define Package/squid/install	
	install -d -m0755 $(1)/etc/squid
	$(CP) $(PKG_INSTALL_DIR)/etc/squid/mime.conf $(1)/etc/squid/
	$(CP) $(PKG_INSTALL_DIR)/etc/squid/squid.conf $(1)/etc/squid/
	install -d -m0755 $(1)/usr/share/squid
	$(CP) $(PKG_INSTALL_DIR)/usr/share/squid/* $(1)/usr/share/squid/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/squid $(1)/usr/sbin/
endef

define BuildPlugin
  define Package/$(1)/install
	install -d -m0755 $$(1)/usr/lib/squid
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/squid/$(2) $$(1)/usr/lib/squid/
  endef

  $$(eval $$(call BuildPackage,$(1)))
endef

$(eval $(call BuildPackage,squid))
$(eval $(call BuildPlugin,squid-mod-basic-auth-getpwnam,getpwname_auth))
$(eval $(call BuildPlugin,squid-mod-basic-auth-ncsa,ncsa_auth))
$(eval $(call BuildPlugin,squid-mod-basic-auth-smb,smb_auth))
$(eval $(call BuildPlugin,squid-mod-basic-auth-winbind,wb_auth))
$(eval $(call BuildPlugin,squid-mod-digest-auth-password,digest_pw_auth))
$(eval $(call BuildPlugin,squid-mod-external-acl-ip-user,ip_user_check))
$(eval $(call BuildPlugin,squid-mod-external-acl-unix-group,squid_unix_group))
$(eval $(call BuildPlugin,squid-mod-external-acl-winbind-group,wb_group))
$(eval $(call BuildPlugin,squid-mod-ntlm-auth-fakeauth,fakeauth_auth))
$(eval $(call BuildPlugin,squid-mod-ntlm-auth-smb-auth,ntlm_auth))
$(eval $(call BuildPlugin,squid-mod-ntlm-auth-winbind-auth,wb_ntlmauth))
