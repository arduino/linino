#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lrzsz
PKG_VERSION:=0.12.20
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.ohse.de/uwe/releases/
PKG_MD5SUM:=b5ce6a74abc9b9eb2af94dffdfd372a4

include $(INCLUDE_DIR)/package.mk

define Package/lrzsz
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=X,Y and Z-modem protocols
  URL:=http://www.ohse.de/uwe/software/lrzsz.html
endef

define Package/lrzsz/description
	Transfer files in your login sessions.
	Very leightweight and straight forward.
	You just need a terminal client that can do 
	either X, Y or Z-modem file transfers.
endef

# uses GNU configure

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/lrzsz/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/lrz $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/lsz $(1)/usr/bin/
	(cd $(1)/usr/bin; \
		ln -fs lrz lrx; \
		ln -fs lrz lrb; \
		ln -fs lsz lsx; \
		ln -fs lsz lsb; \
	);
endef

$(eval $(call BuildPackage,lrzsz))
