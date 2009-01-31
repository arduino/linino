# 
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mksh
PKG_VERSION:=R33d
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).cpio.gz
PKG_SOURCE_URL:=http://www.mirbsd.org/MirOS/dist/mir/mksh
PKG_MD5SUM:=8ad2547ad55dc3a02b13554ab9b5c9c8

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

# This program seems to depend on libssp, but only for GCC 4
GCCVER:=$(if $(DUMP),4,$(word 1,$(subst ., ,$(subst ",,$(CONFIG_GCC_VERSION)))))
#"))))
ifeq ($(GCCVER),4)
  DEP:=+libssp
else
  DEP:=
endif

define Package/mksh
  SECTION:=shells
  CATEGORY:=Base system
  TITLE:=mksh
  DEPENDS:=$(DEP)
endef

define Package/mksh/description
MirBSD version of ksh
endef

define Build/Compile
	cd $(PKG_BUILD_DIR); \
		CC="$(TARGET_CC)" \
		TARGET_OS="$(shell uname -s)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-DMKSH_SMALL=1" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
			$(BASH) Build.sh -Q -r
endef

define Package/mksh/postinst
#!/bin/sh
grep mksh $${IPKG_INSTROOT}/etc/shells || \
	echo "/bin/mksh" >> $${IPKG_INSTROOT}/etc/shells
endef

define Package/mksh/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/dot.mkshrc $(1)/etc/mkshrc
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mksh $(1)/bin/
endef

$(eval $(call BuildPackage,mksh))
