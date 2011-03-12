#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=avahi
PKG_VERSION:=0.6.29
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://avahi.org/download/
PKG_MD5SUM:=bb9d326770689610d1dbaceab5a787fc

PKG_BUILD_DEPENDS:=libexpat libdaemon libgdbm intltool/host

PKG_FIXUP:=autoreconf
PKG_REMOVE_FILES:=autogen.sh

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/avahi/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=An mDNS/DNS-SD implementation
  URL:=http://www.avahi.org/
endef

define Package/avahi/Default/description
 An mDNS/DNS-SD (aka RendezVous/Bonjour/ZeroConf) implementation (library).
 Avahi is a system which facilitates service discovery on a local network --
 this means that you can plug your laptop or computer into a network and
 instantly be able to view other people who you can chat with, find printers
 to print to or find files being shared. This kind of technology is already
 found in MacOS X (branded 'Rendezvous', 'Bonjour' and sometimes 'ZeroConf')
 and is very convenient.
endef

define Package/libavahi
  $(call Package/avahi/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libdaemon +libpthread +libgdbm
  TITLE+= (library)
endef

define Package/libavahi/description
$(call Package/avahi/Default/description)
 .
 This package contains the mDNS/DNS-SD shared libraries, used by other programs.
endef

define Package/avahi-autoipd
  $(call Package/avahi/Default)
  SUBMENU:=IP Addresses and Names
  DEPENDS:=+libdaemon
  TITLE:=IPv4LL network address configuration daemon
endef

define Package/avahi-autoipd/description
$(call Package/avahi/Default/description)
 .
 This package implements IPv4LL, "Dynamic Configuration of IPv4 Link-Local 
 Addresses" (IETF RFC3927), a protocol for automatic IP address configuration 
 from the link-local 169.254.0.0/16 range without the need for a central 
 server. It is primarily intended to be used in ad-hoc networks which lack a
 DHCP server.
endef

define Package/avahi-daemon
  $(call Package/avahi/Default)
  SUBMENU:=IP Addresses and Names
  DEPENDS:=+libavahi +libexpat
  TITLE+= (daemon)
endef

define Package/avahi-daemon/description
$(call Package/avahi/Default/description)
 .
 This package contains an mDNS/DNS-SD daemon.
endef

define Package/avahi-daemon/conffiles
/etc/avahi/avahi-daemon.conf
/etc/avahi/services/http.service
/etc/avahi/services/ssh.service
endef

define Package/avahi-dnsconfd
  $(call Package/avahi/Default)
  SUBMENU:=IP Addresses and Names
  DEPENDS:=+libavahi
  TITLE:=An Unicast DNS server from mDNS/DNS-SD configuration daemon
endef

define Package/avahi-dnsconfd/description
$(call Package/avahi/Default/description)
 .
 This package contains an Unicast DNS server from mDNS/DNS-SD configuration
 daemon, which may be used to configure conventional DNS servers using mDNS
 in a DHCP-like fashion. Especially useful on IPv6.
endef

TARGET_CFLAGS += $(FPIC) -DGETTEXT_PACKAGE

CONFIGURE_ARGS+= \
	--enable-shared \
	--enable-static \
	--disable-glib \
	--disable-gobject \
	--disable-qt3 \
	--disable-qt4 \
	--disable-gtk \
	--disable-gtk3 \
	--disable-dbus \
	--with-xml=expat \
	--disable-dbm \
	--enable-gdbm \
	--enable-libdaemon \
	--disable-python \
	--disable-pygtk \
	--disable-python-dbus \
	--disable-mono \
	--disable-monodoc \
	--disable-doxygen-doc \
	--disable-doxygen-dot \
	--disable-doxygen-man \
	--disable-doxygen-rtf \
	--disable-doxygen-xml \
	--disable-doxygen-chm \
	--disable-doxygen-chi \
	--disable-doxygen-html \
	--disable-doxygen-ps \
	--disable-doxygen-pdf \
	--disable-xmltoman \
	--with-distro=none \
	--with-avahi-user=nobody \
	--with-avahi-group=nogroup \
	--with-autoipd-user=nobody \
	--with-autoipd-group=nogroup

ifneq ($(CONFIG_SSP_SUPPORT),y)
CONFIGURE_ARGS+= \
	--disable-stack-protector
endif

CONFIGURE_VARS+= \
	CFLAGS="$$$$CFLAGS -DNDEBUG -DDISABLE_SYSTEMD" \

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/avahi-{common,core} $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libavahi-{common,core}.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/avahi-core.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libavahi/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libavahi-{common,core}.so.* $(1)/usr/lib/
endef

define Package/avahi-autoipd/install
	$(INSTALL_DIR) $(1)/etc/avahi
	$(CP) $(PKG_INSTALL_DIR)/etc/avahi/avahi-autoipd.action $(1)/etc/avahi/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/avahi-autoipd $(1)/usr/sbin/
endef

define Package/avahi-daemon/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/avahi-daemon $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/avahi
	$(INSTALL_DATA) ./files/avahi-daemon.conf $(1)/etc/avahi/
	$(INSTALL_DIR) $(1)/etc/avahi/services
	$(INSTALL_DATA) ./files/service-http $(1)/etc/avahi/services/http.service
	$(INSTALL_DATA) ./files/service-ssh $(1)/etc/avahi/services/ssh.service
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/avahi-daemon.init $(1)/etc/init.d/avahi-daemon
endef

define Package/avahi-dnsconfd/install
	$(INSTALL_DIR) $(1)/etc/avahi
	$(CP) $(PKG_INSTALL_DIR)/etc/avahi/avahi-dnsconfd.action $(1)/etc/avahi/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/avahi-dnsconfd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,libavahi))
$(eval $(call BuildPackage,avahi-autoipd))
$(eval $(call BuildPackage,avahi-daemon))
$(eval $(call BuildPackage,avahi-dnsconfd))
