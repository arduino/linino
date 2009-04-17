# 
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=leafnode
PKG_VERSION:=1.11.6
PKG_RELEASE:=1
PKG_CAT:=bzcat

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.dt.e-technik.uni-dortmund.de/~ma/leafnode/
PKG_MD5SUM:=5a083968dbacc3d6f6d1013241c23e39

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS+=--sysconfdir=/etc/leafnode
CONFIGURE_VARS+=LIBS=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include

EXTRA_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/leafnode
  SUBMENU:=NNTP
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcre +xinetd
  TITLE:=Leafnode store-and-forward NNTP proxy
  URL:=http://leafnode.sourceforge.net
endef

define Package/leafnode/description
	This package contains the "leafnode", "fetchnews" and
	"texpire" programs and the necessary configuration files
	for the leafnode proxy
endef

define Package/leafnode-extra
  SUBMENU:=NNTP
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=leafnode
  TITLE:=Leafnode extra programs 
  URL:=http://leafnode.sourceforge.net
endef

define Package/leafnode-extra/description
	This package contains the more rarely used "checkgroups",
	"applyfilter" and "leafnode-version" programs from the
	leafnode suite
endef

define Package/leafnode/conffiles
/etc/leafnode/config.example
/etc/xinetd.d/nntp
/etc/crontabs/news
endef

define Package/leafnode/postinst
#!/bin/sh
grep -q '^nntp[[:space:]]*119/tcp' $${IPKG_INSTROOT}/etc/services 2>/dev/null
[ $$? -ne 0 ] && echo "nntp 119/tcp  # USENET News Transfer Protocol" >>$${IPKG_INSTROOT}/etc/services || exit 0
grep -q '^news:' $${IPKG_INSTROOT}/etc/services 2>/dev/null
[ $$? -ne 0 ] && echo "news:*:31:31:news:/var/spool/news:/bin/true"  >>$${IPKG_INSTROOT}/etc/passwd || echo "news:x:31:" >>$${IPKG_INSTROOT}/etc/group || exit 0
endef

define Package/leafnode/install
  	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/leafnode $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/fetchnews $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/texpire $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/leafnode
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/config.example $(1)/etc/leafnode
	$(INSTALL_DIR) $(1)/etc/xinetd.d
	$(INSTALL_DATA) ./files/nntp $(1)/etc/xinetd.d
	$(INSTALL_DIR) $(1)/etc/crontabs
	$(INSTALL_DATA) ./files/news $(1)/etc/crontabs
endef

define Package/leafnode-extra/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/checkgroups $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/applyfilter $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/leafnode-version $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,leafnode))
$(eval $(call BuildPackage,leafnode-extra))
