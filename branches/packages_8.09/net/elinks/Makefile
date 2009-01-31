#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=elinks
PKG_VERSION:=0.11.4
PKG_RELEASE:=1
PKG_MD5SUM:=88036a518ebc4f1150a7e14b29f9d8db

PKG_SOURCE_URL:=http://elinks.or.cz/download/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(INCLUDE_DIR)/package.mk

define Package/elinks
  SUBMENU:=Web
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl
  TITLE:=A text based web browser
  URL:=http://elinks.or.cz/
endef

define Package/elinks/description
An advanced text based web browser
endef

define Build/Configure
 (cd $(PKG_BUILD_DIR); rm -rf config.cache; \
                x=`echo ac_cv_file_./features.conf | tr [:blank:]-/. _` && export $$$${x}=yes && \
                x=`echo ac_cv_file_$(PKG_BUILD_DIR)/features.conf | tr [:blank:]-/. _` && export $$$${x}=yes && \
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
                        $(DISABLE_LARGEFILE) \
                        $(DISABLE_NLS) \
                        --enable-small\
                        --enable-256-colors\
                        --disable-backtrace\
                        --disable-data\
                        --disable-formhist\
                        --disable-leds \
                        --disable-mailcap\
                        --disable-mouse \
                        --disable-smb \
                        --disable-uri-rewrite\
                        --disable-xbel \
                        --without-bzlib \
                        --without-gpm \
                        --without-idn \
                        --without-gnutls \
                        --without-libiconv \
                        --without-lua \
                        --with-openssl="$(STAGING_DIR)/usr" \
                        --without-spidermonkey\
                        --without-x\
                        --without-zlib \
                        --disable-ipv6 \
 	);
endef

define Package/elinks/install
	mkdir -p $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/src/elinks $(1)/usr/bin/
endef

$(eval $(call BuildPackage,elinks))
