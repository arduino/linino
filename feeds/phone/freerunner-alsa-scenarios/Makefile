#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=freerunner-alsa-scenarios
PKG_VERSION:=20090124
PKG_REV:=4900
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://svn.openmoko.org/trunk/src/target/audio/om-gta02
PKG_SOURCE_PROTO:=svn
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define Package/freerunner-alsa-scenarios
  SECTION:=phone
  CATEGORY:=Phone
  TITLE:=alsa audio scenarios for the openmoko neo freerunner
endef

ifeq ($(strip $(call CompareKernelPatchVer,$(KERNEL_PATCHVER),ge,2.6.30)),1)
define Build/Prepare
		$(INSTALL_DIR) $(PKG_BUILD_DIR)
		$(INSTALL_DATA) \
			./files/* \
			$(PKG_BUILD_DIR)
endef
endif

define Build/Configure
endef

define Build/Compile
endef

define Package/freerunner-alsa-scenarios/install
	$(INSTALL_DIR) $(1)/usr/share/openmoko/scenarios
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/*.state \
		$(1)/usr/share/openmoko/scenarios/
endef

$(eval $(call BuildPackage,freerunner-alsa-scenarios))
