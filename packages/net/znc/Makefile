#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=znc
PKG_VERSION:=0.076
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/znc
PKG_MD5SUM:=03c2804b91225e83884f06078f6db568

include $(INCLUDE_DIR)/package.mk

define Package/znc
  SUBMENU:=Instant Messaging
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +uclibcxx
  TITLE:=ZNC
  URL:=http://en.znc.in/
endef

define Package/znc/description
	ZNC is an IRC bouncer with many advanced features like detaching,
	multiple users, per channel playback buffer, SSL, IPv6, transparent DCC
	bouncing, and c++ module support to name a few.
endef

CONFIGURE_VARS += \
	CXX="$(TARGET_CROSS)-g++-uc"
	CXXFLAGS="$(TARGET_CFLAGS) -fno-builtin -fno-rtti -nostdinc++" \
	CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
	LDFLAGS="-nodefaultlibs -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib"
	LIBS="-luClibc++ -lc -lm -lgcc -lssl"

CONFIGURE_ARGS += \
	$(TARGET_CONFIGURE_OPTS) \
	--disable-perl \
	--disable-c-ares \

MAKE_FLAGS += \
	CXX="g++-uc"

define Build/Configure
	$(call Build/Configure/Default,)
	$(call libtool_disable_rpath)
endef

define Build/Compile
	$(call Build/Compile/Default,)
endef

define Package/znc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/znc $(1)/usr/bin/
endef

$(eval $(call BuildPackage,znc))
