#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=faad2
PKG_VERSION:=2.6.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/faac
PKG_MD5SUM:=74e92df40c270f216a8305fc87603c8a

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/faad2/Default
  URL:=http://www.audiocoding.com/faad2.html
  TITLE:=Freeware Advanced Audio Decoder
endef

define Package/faad2/Default/description
	FAAD2 is the fastest ISO AAC audio decoder available.
	FAAD2 correctly decodes all MPEG-4 and MPEG-2 MAIN,
	LOW, LTP, LD and ER object type AAC files.
endef

define Package/faad2
$(call Package/faad2/Default)
  SECTION:=sound
  CATEGORY:=Sound
  TITLE+=player
  DEPENDS:=+libfaad2
endef

define Package/faad2/description
$(call Package/faad2/Default/description)
  This package contains a binary to play AAC or MP4 files.
endef

define Package/libfaad2
$(call Package/faad2/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+=library
endef

define Package/libfaad2/description
$(call Package/faad2/Default/description)
  This package contains the library.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -rf config.{cache,status}; \
		autoreconf -vif \
	);
	$(call Build/Configure/Default, \
		--with-mp4v2 \
		--without-xmms \
		, \
		FAAD2_CPPFLAGS="-fno-builtin-cos -fno-builtin-sin -fno-builtin-log" \
	)
endef

TARGET_CFLAGS += $(FPIC)

MAKE_FLAGS += \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	all install \

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/*.h $(1)/usr/include
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfaad.{a,so*} $(1)/usr/lib/
endef

define Package/faad2/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/faad $(1)/usr/bin/
endef

define Package/libfaad2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfaad.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,faad2))
$(eval $(call BuildPackage,libfaad2))
