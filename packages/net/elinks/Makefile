#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=elinks
PKG_VERSION:=0.11.1
PKG_RELEASE:=2
PKG_MD5SUM:=c09d726075e4b5810fa07f8654088755

PKG_SOURCE_URL:=http://elinks.or.cz/download/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/elinks
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl
  TITLE:=A text based web browser
  DESCRIPTION:=An advanced text based web browser
  URL:=http://elinks.or.cz/
endef

define Build/Configure
$(call Build/Configure/Default,--enable-small\
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
			--disable-ipv6 \, x=`echo ac_cv_file_./features.conf | tr [:blank:]-/. _` && export $$$${x}=yes && \
			x=`echo ac_cv_file_$(PKG_BUILD_DIR)/features.conf | tr [:blank:]-/. _` && export $$$${x}=yes && \
)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR)\
		CC=$(TARGET_CC) LD=$(TARGET_CROSS)ld
endef

define Package/elinks/install
	mkdir -p $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/src/elinks $(1)/usr/bin/
endef

$(eval $(call BuildPackage,elinks))
