#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mpdas
PKG_VERSION:=0.2.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://50hz.ws/mpdas
PKG_MD5SUM:=8a694691dcb5d217c46754e40152186a

include $(INCLUDE_DIR)/package.mk

define Package/mpdas
  SECTION:=sound
  CATEGORY:=Sound
  TITLE:=A MPD client which submits your tracks to Last.Fm
  DEPENDS:=+libcurl +libmpd +libstdcpp
  URL:=http://50hz.ws/mpdas/
endef

define Package/mpdas/description
    mpdas is an AudioScrobbler client for MPD written in C++.
    It supports the latest AudioScrobbler protocol (1.21).
    In case of a downtime or connectivity problems, mpdas will 
    cache the played songs to ~/.mpdascache.
endef

EXTRA_CPPFLAGS:=\
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include \

EXTRA_LDFLAGS:=\
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib \

MAKE_FLAGS += \
	CPPFLAGS="$(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS)" \
	LDFLAGS="$(TARGET_LDPFLAGS) $(EXTRA_LDFLAGS)" \

define Package/mpdas/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/mpdasrc $(1)/etc/mpdasrc
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mpdas $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/mpdas.init $(1)/etc/init.d/mpdas
endef

$(eval $(call BuildPackage,mpdas))
