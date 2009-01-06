#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=dansguardian
PKG_VERSION:=2.10.0.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://dansguardian.org/downloads/2/Stable
PKG_MD5SUM:=0a6c6d35c9e0c82fbc4a2150e8ffe977

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/dansguardian
  SECTION:=net
  DEPENDS:=+libpthread +uclibcxx +zlib
  CATEGORY:=Network
  TITLE:=DansGuardian
  URL:=http://dansguardian.org
endef

define Package/dansguardian/conffiles
/etc/dansguardian/dansguardian.conf
endef

CONFIGURE_VARS += \
	INCLUDES="" \
	CXXFLAGS="$$$$CXXFLAGS -fno-builtin -fno-rtti -nostdinc++"  \
	CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include/uClibc++" \
	LDFLAGS="$$$$LDFLAGS" \
	LIBS="-nodefaultlibs -luClibc++ -lpthread $(LIBGCC_S)" \

define Build/Configure
	$(call Build/Configure/Default,\
		--disable-clamav \
		--with-sysconfsubdir=dansguardian \
		--with-proxyuser=root \
		--with-proxygroup=root \
		--disable-pcre \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/dansguardian/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/dansguardian $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/etc/dansguardian $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/share/dansguardian
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/share/dansguardian/transparent1x1.gif $(1)/usr/share/dansguardian/
	$(INSTALL_DIR) $(1)/usr/share/dansguardian/languages/ukenglish
	$(CP) $(PKG_INSTALL_DIR)/usr/share/dansguardian/languages/ukenglish/* $(1)/usr/share/dansguardian/languages/ukenglish/
endef

$(eval $(call BuildPackage,dansguardian))
