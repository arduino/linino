# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=nagios-plugins
PKG_VERSION:=1.4.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/nagiosplug
PKG_MD5SUM:=ea79fa91092d709aa6b2e732b1d55541
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/nagios-plugins
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=uclibcxx
  TITLE:=plugins for Nagios checks
  URL:=http://nagiosplug.sourceforge.net/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--without-mysql \
		--with-openssl="$(STAGING_DIR)/usr" \
		--with-ping-command="/bin/ping -c %d %s" \
		--with-ps-command="/bin/ps -Aopid" \
		--with-ps-cols="5" \
		--with-ps-format="%d %s %d %s %n" \
		--with-uptime-command="/usr/bin/uptime" \
		--with-ssh-command="/usr/bin/ssh" \
		--with-nslookup-command="/usr/bin/nslookup" \
		, \
	)
endef

define Build/Compile
	$(call Build/Compile/Default,\
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install \
	)
endef

define Package/nagios-plugins/install
	$(INSTALL_DIR) $(1)/usr/libexec/nagios
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/libexec/nagios/
endef

$(eval $(call BuildPackage,nagios-plugins))
