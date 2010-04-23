# 
# Copyright (C) 2010 segal.di.ubi.pt 
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sshtunnel
PKG_VERSION:=1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/sshtunnel
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Manages Local and Remote openssh ssh(1) tunnels
  MAINTAINER:=Nuno Goncalves <nunojpg@gmail.com>
  DEPENDS:=+openssh-client
endef

define Package/sshtunnel/description
Creates openssh ssh(1) Local and Remote tunnels configured in UCI file. Can be user to allow remote connections, possibly over NATed connections or without public IP/DNS
endef

define Package/sshtunnel/conffiles
/etc/config/sshtunnel
endef

define Build/Compile
endef

define Package/sshtunnel/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,sshtunnel))
