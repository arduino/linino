#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=dibbler
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.gz
PKG_SOURCE_URL:=http://klub.com.pl/dhcpv6/dibbler
PKG_MD5SUM:=26a0e37512be7641a2deb0dc5b00e582
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/dibbler/Default
  SECTION:=ipv6
  CATEGORY:=IPv6
  DEPENDS:=+uclibcxx
  TITLE:=Dibbler, a portable DHCPv6 implementation
  URL:=http://klub.com.pl/dhcpv6/
endef

define Package/dibbler-client
  $(call Package/dibbler/Default)
  TITLE+= (client)
endef

define Package/dibbler-relay
  $(call Package/dibbler/Default)
  TITLE+= (relay)
endef

define Package/dibbler-server
  $(call Package/dibbler/Default)
  TITLE+= (server)
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR)/poslib; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="$(EXTRA_CPPFLAGS)" \
		LDFLAGS="$(EXTRA_LDFLAGS)" \
		./configure \
			--target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--program-prefix="" \
			--program-suffix="" \
			--prefix=/usr \
			--exec-prefix=/usr \
			--bindir=/usr/bin \
			--datadir=/usr/share \
			--includedir=/usr/include \
			--infodir=/usr/share/info \
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_NLS) \
			$(DISABLE_LARGEFILE) \
	);
endef

CXX_LIBS:= -nodefaultlibs -Wl,-Bdynamic,-luClibc++,-Bstatic,-lstdc++,-Bdynamic,-lm,-lc,-lgcc
define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		PORT_CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CPPFLAGS) -fno-builtin -fno-rtti" \
		PORT_LDFLAGS="$(EXTRA_LDFLAGS)" \
		DEBUGINFO= \
		CLNT_LIBS="$(CXX_LIBS)" \
		SRV_LIBS="$(CXX_LIBS)" \
		server client relay
endef

define Package/dibbler-client/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dibbler-client $(1)/usr/sbin/
endef

define Package/dibbler-relay/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dibbler-relay $(1)/usr/sbin/
endef

define Package/dibbler-server/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dibbler-server $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,dibbler-client))
$(eval $(call BuildPackage,dibbler-relay))
$(eval $(call BuildPackage,dibbler-server))
