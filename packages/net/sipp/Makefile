#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=sipp
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_MD5SUM:=8866e9af0d3bc29e91ebb6eab89a7f1f

PKG_SOURCE_URL:=@SF/sipp
PKG_SOURCE:=$(PKG_NAME).$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/sipp
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+uclibcxx +libpthread +libncurses
  TITLE:=test tool / traffic generator for the SIP protocol
  DESCRIPTION:=SIPp is a free Open Source test tool / traffic generator for the SIP protocol.\\\
	It includes a few basic SipStone user agent scenarios (UAC and UAS) and\\\
	establishes and releases multiple calls with the INVITE and BYE methods.\\\
  URL:=http://sipp.sourceforge.net
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CC_linux="$(TARGET_CC)" \
		CPP_linux="$(TARGET_CC)" \
		CCLINK_linux="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS_linux="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include -fno-builtin -nostdinc++" \
		LFLAGS_linux="-nodefaultlibs -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		LIBS="-luClibc++ -lc -lm -lgcc -lpthread -ldl -lncurses" \
		all
endef

define Package/sipp/install	
	mkdir -p $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,sipp))
