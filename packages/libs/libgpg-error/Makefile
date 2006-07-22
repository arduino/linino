# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libgpg-error
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.gnupg.org/gcrypt/libgpg-error/ \
	http://mirrors.rootmode.com/ftp.gnupg.org/libgpg-error/ \
	http://gulus.usherbrooke.ca/pub/appl/GnuPG/libgpg-error/ \
	http://gnupg.unixmexico.org/ftp/libgpg-error/
PKG_MD5SUM:=ff409db977e4a4897aa09ea420a28a2f
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libgpg-error
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GnuPG error handling helper library
  DESCRIPTION:=An helper library for common error codes and descriptions.\\\
    This is a library that defines common error values for all GnuPG \\\
    components.  Among these are GPG, GPGSM, GPGME, GPG-Agent, libgcrypt, \\\
    Libksba, DirMngr, Pinentry, SmartCard Daemon and possibly more in the \\\
    future.
  URL:=http://www.gnupg.org/related_software/libgpg-error/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
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
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_NLS) \
			$(DISABLE_LARGEFILE) \
			--enable-shared \
			--enable-static \
			--disable-rpath \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libgpg-error/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgpg-error.so.* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/gpg-error-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gpg-error.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgpg-error.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/share/aclocal
	$(CP) $(PKG_INSTALL_DIR)/usr/share/aclocal/gpg-error.m4 $(STAGING_DIR)/usr/share/aclocal/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/gpg-error-config \
		$(STAGING_DIR)/usr/include/gpg-error.h \
		$(STAGING_DIR)/usr/lib/libgpg-error.{a,so*} \
		$(STAGING_DIR)/usr/share/aclocal/gpg-error.m4
endef

$(eval $(call BuildPackage,libgpg-error))
