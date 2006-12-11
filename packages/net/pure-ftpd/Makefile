#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pure-ftpd
PKG_VERSION:=1.0.21
PKG_RELEASE:=1
PKG_MD5SUM:=ca8a8dbec0cd9c8ea92fc4c37ea9c410

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=http://download.pureftpd.org/pub/pure-ftpd/releases/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2

PKG_CAT:=bzcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/pure-ftpd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libelf
  TITLE:=Secure FTP made easy!
  DESCRIPTION:=\
  	Pure-FTPd is a free (BSD), secure, production-quality and standard-conformant FTP server.\
	It doesn't provide useless bells and whistles, but focuses on efficiency and ease of use.\
	It provides simple answers to common needs, plus unique useful features for personal users\
	as well as hosting providers.
  URL:=http://www.pureftpd.org/project/pure-ftpd
endef

define Build/Configure
	$(call Build/Configure/Default,--with-everything)
endef

define Package/pure-ftpd/install
	$(INSTALL_DIR) $(1)/etc/init.d $(1)/usr/sbin
	install -m0755 ./files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
	$(CP) $(PKG_BUILD_DIR)/src/pure-{ftpd,pw,ftpwho,mrtginfo,pwconvert,quotacheck,statsdecode,uploadscript,authd} $(1)/usr/sbin/
	$(CP) $(PKG_BUILD_DIR)/src/ptracetest $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,pure-ftpd))
