# 
# Copyright (C) 2010 segal.di.ubi.pt 
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=restorefactory
PKG_VERSION:=1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/restorefactory
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Mimic original functionality of the reset button
  MAINTAINER:=Nuno Goncalves <nunojpg@gmail.com>
endef

define Package/restoreyfactory/description
RestoreFactory handles the reset button event and issues a "firstboot" command.
Button and wait time can be configured with a UCI file.
endef

define Build/Compile
endef

define Package/restorefactory/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,restorefactory))
