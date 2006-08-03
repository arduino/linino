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
PKG_MD5SUM:=b5ce6a74abc9b9eb2af94dffdfd372a4

PKG_SOURCE_URL:=http://www.ohse.de/uwe/releases/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/lrzsz
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=X,Y and Z-modem protocols
  DESCRIPTION:=Transfer files in your login sessions.\\\
Very leightweight and straight forward.\\\
You just need a terminal client that can do\\\
either X, Y or Z-modem file transfers.\\\
  URL:=http://www.ohse.de/uwe/software/lrzsz.html
endef

define Build/Configure
$(call Build/Configure/Default,--without-libiconv-prefix \
--without-libintl-prefix)
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/lrzsz/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/lrz $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/lsz $(1)/usr/bin/
	(cd $(1)/usr/bin; \
		ln -fs lrz lrx; \
		ln -fs lrz lrb; \
		ln -fs lsz lsx; \
		ln -fs lsz lsb; \
	);
endef

$(eval $(call BuildPackage,lrzsz))
