#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=flite
PKG_VERSION:=1.3-release
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.speech.cs.cmu.edu/flite/packed/flite-1.3/
PKG_MD5SUM:=ae0aca1cb7b4801f4372f3a75a9e52b5
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/flite
  SECTION:=sound
  CATEGORY:=Sound
  TITLE:=Text-to-speech for embedded systems
  DESCRIPTION:=Festival Lite is a stripped down version of Festival,\\\
    the well-developed text-to-speech program written in C++.\\\
    This program is written in C to keep memory usage low.
  URL:=http://www.speech.cs.cmu.edu/flite/index.html
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-audio="oss" \
	)
endef

define Build/Compile
    $(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/flite/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/flite $(1)/usr/bin/
endef

$(eval $(call BuildPackage,flite))
