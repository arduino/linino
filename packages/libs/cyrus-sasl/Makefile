#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=cyrus-sasl
PKG_VERSION:=2.1.20
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.andrew.cmu.edu/pub/cyrus-mail/
PKG_MD5SUM:=268ead27f4ac39bcfe17d9e38e0f2977

PKG_BUILD_DEPENDS:=libopenssl
PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/libsasl2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A general purpose authentication library
  URL:=http://asg.web.cmu.edu/sasl/
endef

TARGET_CFLAGS += $(FPIC)
CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-sample \
	--enable-staticdlopen \
	--disable-java \
	--disable-alwaystrue \
	--disable-checkapop \
	--enable-cram \
	--enable-digest \
	--disable-otp \
	--disable-srp \
	--disable-srp-setpass \
	--disable-krb4 \
	--disable-gssapi \
	--disable-gss_mutexes \
	--enable-plain \
	--enable-anon \
	--disable-login \
	--disable-ntlm \
	--disable-sql \
	--with-dblib="none" \
	--without-gdbm \
	--with-devrandom="/dev/urandom" \
	--without-pam \
	--without-saslauthd \
	--without-authdaemond \
	--without-pwcheck \
	--with-ipctype=unix \
	--with-openssl="$(STAGING_DIR)/usr" \
	--without-des \
	--without-opie \
	--without-ldap \
	--without-mysql \
	--without-pgsql \
	--without-sqlite \
	--without-rc4 \
	--without-dmalloc \
	--without-sfio

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/include \
		CC="$(HOSTCC)" \
		LINK="$(HOSTCC) -o makemd5 -lc" \
		CFLAGS="" \
		CPPFLAGS="" \
		makemd5
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/sasl $(1)/usr/include/
	mkdir -p $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsasl2.{a,so*} $(1)/usr/lib/
	ln -sf libsasl2.a $(1)/usr/lib/libsasl.a
	ln -sf libsasl2.so $(1)/usr/lib/libsasl.so
	mkdir -p $(1)/usr/lib/sasl2
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/sasl2/lib*.{a,so*} $(1)/usr/lib/sasl2/
endef

define Package/libsasl2/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsasl2.so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/sasl2
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/sasl2/lib*.so.* $(1)/usr/lib/sasl2/
endef

$(eval $(call BuildPackage,libsasl2))
