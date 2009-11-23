#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=netatalk
PKG_VERSION:=20090920
PKG_RELEASE:=1
PKG_SOURCE:=netatalk-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.flyn.org/SRPMS/
PKG_MD5SUM:=99577e66bac6312a8bd5d552ed971f12

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

define Build/Configure
	( cd $(PKG_BUILD_DIR); NOEXECCONFIGURE=1 ./bootstrap )
	$(call Build/Configure/Default, \
		--disable-timelord \
		--disable-a2boot \
		--disable-cups \
		--disable-tcp-wrappers \
		--with-cnid-default-backend=dbd \
		--with-bdb="$(STAGING_DIR)/usr/" \
		--with-libgcrypt-dir="$(STAGING_DIR)/usr" \
		--with-ssl-dir="$(STAGING_DIR)/usr" \
	)
endef

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
