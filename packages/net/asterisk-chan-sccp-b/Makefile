#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk18-chan-sccp-b
# associated with asterisk version
PKG_VERSION:=1.8.4.4
# chan-sccp-b version
PKG_RELEASE:=V4.0.0

# SVN
PKG_REV=2797
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://chan-sccp-b.svn.sourceforge.net/svnroot/chan-sccp-b/trunk
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=svn

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/asterisk18-chan-sccp-b
  SUBMENU:=Telephony
  SECTION:=net
  CATEGORY:=Network
  TITLE:=SCCP channel provider for asterisk
  URL:=http://chan-sccp-b.net.sourceforge.net/
  MAINTAINER:=Diederik de Groot <ddegroot@users.sourceforge.net>
  DEPENDS:=+asterisk18
endef

define Package/asterisk18-chan-sccp-b/description
 SCCP channel provider for asterisk. It delivers extended functionality for SCCP phones over chan_skinny delivered
 by asterisk by default.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		$(TARGET_CONFIGURE_OPTS) \
		./configure \
			--prefix=/usr \
                        --target=$(GNU_TARGET_NAME) \
                        --host=$(GNU_TARGET_NAME) \
                        --build=$(GNU_HOST_NAME) \
			--with-asterisk="$(PKG_BUILD_DIR)/../asterisk-${PKG_VERSION}/" \
	);
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) $(TARGET_CONFIGURE_OPTS)
	mkdir -p $(PKG_INSTALL_DIR)/usr/lib/modules/asterisk
	mkdir -p $(PKG_INSTALL_DIR)/etc/astisk
endef

define Package/asterisk18-chan-sccp-b/install
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_BIN)  ./files/sccp.openwrt.conf $(1)/etc/asterisk/sccp.conf
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(CP) $(PKG_BUILD_DIR)/src/.libs/chan_sccp.so $(1)/usr/lib/asterisk/modules/
endef

$(eval $(call BuildPackage,asterisk18-chan-sccp-b))
