# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=icecast
PKG_VERSION:=2.3.0
PKG_RELEASE:=1
PKG_MD5SUM:=35256fbc4a93571662af2ed18fbbfcc5

PKG_SOURCE_URL:=http://downloads.us.xiph.org/releases/icecast/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/icecast
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libcurl +libvorbisidec +libxml2 +libxslt
  TITLE:=A streaming media server for Ogg/Vorbis and MP3 audio streams
  DESCRIPTION:=Icecast is a streaming media server which currently supports Ogg\\\
Vorbis and MP3 audio streams. It can be used to create an Internet\\\
radio station or a privately running jukebox and many things in\\\
between. It is very versatile in that new formats can be added\\\
relatively easily and supports open standards for commuincation and\\\
interaction.\\\
  URL:=http://www.icecast.org/
endef


define Build/Configure
        (cd $(PKG_BUILD_DIR); rm -rf config.{cache,status} ; \
                $(TARGET_CONFIGURE_OPTS) \
                CFLAGS="$(TARGET_CFLAGS)" \
                CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include/libxml2 " \
                LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
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
                        --libdir=/usr/lib \
                        --libexecdir=/usr/lib \
                        --localstatedir=/var \
                        --mandir=/usr/share/man \
                        --sbindir=/usr/sbin \
                        --sysconfdir=/etc \
                        $(DISABLE_LARGEFILE) \
                        $(DISABLE_NLS) \
                        --enable-shared \
                        --disable-static \
                        --disable-rpath \
                        --with-gnu-ld \
                        --enable-yp \
                        --with-curl="yes" \
                        --with-curl-config="$(STAGING_DIR)/usr/bin/curl-config" \
                        --with-ogg="$(STAGING_DIR)/usr" \
                        --with-speex="no" \
                        --with-theora="no" \
                        --with-vorbis="$(STAGING_DIR)/usr" \
                        --with-xslt-config="$(STAGING_DIR)/usr/bin/xslt-config" \
        );
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/icecast/install	
	install -d -m0755 $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/etc/icecast.xml $(1)/etc/
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/icecast $(1)/usr/bin/
	install -d -m0755 $(1)/usr/share/icecast
	$(CP) $(PKG_INSTALL_DIR)/usr/share/icecast/admin $(1)/usr/share/icecast/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/icecast/web $(1)/usr/share/icecast/
endef

$(eval $(call BuildPackage,icecast))
