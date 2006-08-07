#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=privoxy
PKG_VERSION:=3.0.3
PKG_RELEASE:=1
PKG_MD5SUM:=b0710be8af09409bfb03f52523a17010

PKG_SOURCE_URL:=@SF/ijbswa
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-stable-src.tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-stable
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/privoxy
  SECTION:=net
  CATEGORY:=Network
  TITLE:=web proxy with advanced filtering capabilities
  DESCRIPTION:=Privoxy is a web proxy with advanced filtering capabilities for\\\
	protecting privacy, modifying web page content, managing cookies,\\\
	controlling access, and removing ads, banners, pop-ups and other\\\
	obnoxious Internet junk. Privoxy has a very flexible configuration\\\
	and can be customized to suit individual needs and tastes. Privoxy\\\
	has application for both stand-alone systems and multi-user networks.\\\
  URL:=http://www.privoxy.org/
endef

define Build/Configure
  (cd $(PKG_BUILD_DIR); rm -rf config.{cache,status} ; \
                autoheader && autoconf && \
                $(TARGET_CONFIGURE_OPTS) \
                CFLAGS="$(strip $(TARGET_CFLAGS))" \
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
                  --disable-static \
        );
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		SPECIAL_CFLAGS="-pthread -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib"
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
endef

define Package/privoxy/install	
	install -d -m0755 $(1)/usr/sbin $(1)/etc/privoxy 
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/privoxy $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,privoxy))
