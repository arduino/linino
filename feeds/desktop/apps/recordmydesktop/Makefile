#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=recordmydesktop
PKG_VERSION:=0.3.8.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=6998b165540598965499bd99d8aa0eef
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib \

define Package/recordmydesktop
  SECTION:=xorg-apps
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=A X desktop session recorder
  URL:=http://recordmydesktop.sourceforge.net
  DEPENDS:=+libX11 +libSM +libICE +libXext +libXfixes +libXdamage +libvorbis \
	  +libtheora +libogg +libpthread +zlib $(ICONV_DEPENDS) $(INTL_DEPENDS)
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-oss \
		--disable-jack \
	)
endef

define Package/recordmydesktop/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/recordmydesktop \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,recordmydesktop))
