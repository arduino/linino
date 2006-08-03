# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=jamvm
PKG_VERSION:=1.4.1
PKG_RELEASE:=1
PKG_MD5SUM:=ed79d6b60e50b007614831f8c28321ac

PKG_SOURCE_URL:=@SF/jamvm

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/jamvm
  SECTION:=lang
  CATEGORY:=Languages
  DEPENDS:=+libffi-sable
  TITLE:=A compact Java Virtual Machine
  DESCRIPTION:=JamVM is a new Java Virtual Machine which conforms to the JVM\\\
specification version (blue book). In comparison to most other VM's\\\
(free and commercial) it is extremely small.However, unlike other\\\
small VMs (e.g. KVM) it is designed to support the full\\\
specification, and includes support for object finalisation,\\\
Soft/Weak/Phantom References, the Java Native Interface (JNI) and the\\\
Reflection API.\\\
  URL:=http://sourceforge.net/projects/jamvm
endef

define Build/Configure
$(call Build/Configure/Default,--enable-ffi)
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)/usr/bin
	mkdir -p $(PKG_INSTALL_DIR)/usr/share/jamvm
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
              $(TARGET_CONFIGURE_OPTS)
	$(CP) $(PKG_BUILD_DIR)/src/jamvm $(PKG_INSTALL_DIR)/usr/bin
	$(MAKE) -C $(PKG_BUILD_DIR)/lib
	$(CP) $(PKG_BUILD_DIR)/lib/classes.zip $(PKG_INSTALL_DIR)/usr/share/jamvm
endef


define Package/jamvm/install	
	install -d -m0755 $(1)/usr/bin
	install -d -m0755 $(1)/usr/share/jamvm
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/jamvm $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/share/jamvm/classes.zip $(1)/usr/share/jamvm
endef

$(eval $(call BuildPackage,jamvm))
