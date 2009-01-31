#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=dibbler
PKG_VERSION:=0.7.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=76a814d528274b2dc7ff7623bd6f6b45

include $(INCLUDE_DIR)/package.mk

# add dependency on 2.6 since recent dibbler needs <linux/ip_mp_alg.h>
define Package/dibbler/Default
  SECTION:=ipv6
  CATEGORY:=IPv6
  DEPENDS:=+uclibcxx @LINUX_2_6
  TITLE:=Dibbler, a portable DHCPv6 implementation
  URL:=http://klub.com.pl/dhcpv6/
endef

define Package/dibbler/Default/description
	Dibbler is a portable DHCPv6 implementation. It supports stateful (i.e.
	IPv6 address granting) as well as stateless (i.e. option granting)
	autoconfiguration for IPv6.
endef

define Package/dibbler-client
  $(call Package/dibbler/Default)
  TITLE+= (client)
endef

define Package/dibbler-client/description
  $(call Package/dibbler/Default/description)
  This package contains the dibbler client.
endef

define Package/dibbler-relay
  $(call Package/dibbler/Default)
  TITLE+= (relay)
endef

define Package/dibbler-relay/description
  $(call Package/dibbler/Default/description)
  This package contains the dibbler relay.
endef

define Package/dibbler-server
  $(call Package/dibbler/Default)
  TITLE+= (server)
endef

define Package/dibbler-server/description
  $(call Package/dibbler/Default/description)
  This package contains the dibbler server.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR)/poslib; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="$(TARGET_CPPFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
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

# link stuff missing from uClibc++ but present in stdc++ statically
CXX_LIBS:= -nodefaultlibs -luClibc++ -Wl,-Bstatic,-lstdc++,-Bdynamic -lm -lgcc

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		PORT_CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) -fno-builtin" \
		PORT_LDFLAGS="$(TARGET_LDFLAGS)" \
		DEBUGINFO= \
		CXXLD="$(TARGET_CC)" \
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
