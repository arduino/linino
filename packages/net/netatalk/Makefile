#
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=netatalk
PKG_VERSION:=2.1beta1
PKG_RELEASE:=1

PKG_SOURCE:=netatalk-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/netatalk
PKG_MD5SUM:=86be058b18270e9df4699a1f393846b0

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/netatalk
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libdb47 +libgcrypt +libopenssl
  TITLE:=netatalk
  URL:=http://netatalk.sourceforge.net
endef

define Package/netatalk/decription
  Netatalk is an implementation of the AppleTalk protocol suite
endef

CONFIGURE_VARS += \
	CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -Drestrict='' -DNO_DEBUG "

CONFIGURE_ARGS += \
	--disable-timelord \
	--disable-a2boot \
	--disable-cups \
	--disable-tcp-wrappers \
	--with-cnid-default-backend=dbd \
	--with-bdb="$(STAGING_DIR)/usr/" \
	--with-libgcrypt-dir="$(STAGING_DIR)/usr" \
	--with-ssl-dir="$(STAGING_DIR)/usr"

define Package/netatalk/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(CP) \
		$(PKG_BUILD_DIR)/etc/afpd/afpd \
		$(1)/usr/bin/
	$(CP) \
		$(PKG_BUILD_DIR)/etc/cnid_dbd/cnid_dbd \
		$(1)/usr/bin/
	$(CP) \
		$(PKG_BUILD_DIR)/etc/cnid_dbd/cnid_metad \
		$(1)/usr/bin/
	$(CP) \
		$(PKG_BUILD_DIR)/etc/cnid_dbd/dbd \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,netatalk))
