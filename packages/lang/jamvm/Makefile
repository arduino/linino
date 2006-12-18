#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=jamvm
PKG_VERSION:=1.4.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/jamvm
PKG_MD5SUM:=1b7bc9928c534412e062685a4191651d
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/jamvm
  SECTION:=lang
  CATEGORY:=Languages
  DEPENDS:=+libffi-sable
  TITLE:=A compact Java Virtual Machine
  DESCRIPTION:=\
	JamVM is a new Java Virtual Machine which conforms to the JVM \\\
	specification version (blue book). In comparison to most other VM's \\\
	(free and commercial) it is extremely small.However, unlike other \\\
	small VMs (e.g. KVM) it is designed to support the full \\\
	specification, and includes support for object finalisation, \\\
	Soft/Weak/Phantom References, the Java Native Interface (JNI) and the \\\
	Reflection API.
  URL:=http://sourceforge.net/projects/jamvm
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-ffi \
		--disable-int-threading \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) all
endef

define Package/jamvm/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/jamvm $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/jamvm
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/lib/classes.zip $(1)/usr/share/jamvm/
endef

$(eval $(call BuildPackage,jamvm))
