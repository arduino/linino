#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=htop
PKG_VERSION:=0.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=7c5507f35f363f3f40183a2ba3c561f8

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

CONFIGURE_VARS += \
	ac_cv_file__proc_stat=yes \
	ac_cv_file__proc_meminfo=yes

define Package/htop
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=Interactive processes viewer
  DEPENDS:=+libncurses
  URL:=http://htop.sourceforge.net/
endef

define Package/htop/description
 Htop is an ncursed-based process viewer similar to top, but
 it allows to scroll the list vertically and horizontally to
 see all processes and their full command lines.
endef

CONFIGURE_VARS += \
	ac_cv_file__proc_stat=yes \
	ac_cv_file__proc_meminfo=yes \

define Package/htop/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,htop))
