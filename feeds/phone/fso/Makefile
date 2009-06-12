# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fso
PKG_VERSION:=20090609
PKG_REV:=74fc21962e9bbc7f2a89c74f12c15ce1b5861bfb
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://git.freesmartphone.org/framework.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DEPENDS:=cython python

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,$(STAGING_DIR)/mk/python-package.mk)

ifeq ($(CONFIG_TARGET_s3c24xx),y)
  CONFIG=om_gta02
endif

define Package/fso
  SECTION:=phone
  CATEGORY:=Phone
  TITLE:=freesmartphone.org DBus API reference implementation
  DEPENDS:=+python +dbus-python +python-gobject +pyserial +pyyaml \
           +gst-python +alsa-utils +freerunner-alsa-scenarios
  URL:=http://www.freesmartphone.org
endef

define Package/fso/description
  freesmartphone.org is a collaboration platform for open source and open discussion software projects working on interoperability and shared technology for Linux-based SmartPhones
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix="$(PKG_INSTALL_DIR)/usr")
endef

define Package/fso/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR) $(1)/usr/bin $(1)/etc/init.d
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/
	$(INSTALL_BIN) ./files/frameworkd.init $(1)/etc/init.d/frameworkd
	$(CP) \
		$(PKG_INSTALL_DIR)/../etc/* \
		$(1)/etc/
	$(if $(CONFIG),$(INSTALL_CONF) ./files/frameworkd.conf.$(CONFIG) $(1)/etc/frameworkd.conf,$(CP) ./files/frameworkd.conf $(1)/etc/frameworkd.conf)
endef

$(eval $(call BuildPackage,fso))
