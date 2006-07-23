# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=avahi
PKG_VERSION:=0.6.10
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://avahi.org/download/
PKG_MD5SUM:=cfb9e05c138dff4c430a35eee6229e8a
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install
PKG_BUILDDEP:=expat libdaemon libgdbm

include $(INCLUDE_DIR)/package.mk

define Package/libavahi
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libdaemon
  TITLE:=An mDNS/DNS-SD implementation (library)
  DESCRIPTION:=An mDNS/DNS-SD (aka RendezVous/Bonjour/ZeroConf) implementation (library).\\\
    Avahi is a system which facilitates service discovery on a local network -- \\\
    this means that you can plug your laptop or computer into a network and \\\
    instantly be able to view other people who you can chat with, find printers \\\
    to print to or find files being shared. This kind of technology is already \\\
    found in MacOS X (branded 'Rendezvous', 'Bonjour' and sometimes 'ZeroConf') \\\
    and is very convenient.\\\
    \\\
    This package contains the mDNS/DNS-SD shared libraries, used by other programs.
  URL:=http://www.avahi.org/
endef

define Package/avahi-daemon
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=libavahi
  TITLE:=An mDNS/DNS-SD implementation (daemon)
  DESCRIPTION:=An mDNS/DNS-SD (aka RendezVous/Bonjour/ZeroConf) implementation (daemon).\\\
    Avahi is a system which facilitates service discovery on a local network -- \\\
    this means that you can plug your laptop or computer into a network and \\\
    instantly be able to view other people who you can chat with, find printers \\\
    to print to or find files being shared. This kind of technology is already \\\
    found in MacOS X (branded 'Rendezvous', 'Bonjour' and sometimes 'ZeroConf') \\\
    and is very convenient.\\\
    \\\
    This package contains an mDNS/DNS-SD daemon.
  URL:=http://www.avahi.org/
endef

define Package/avahi-daemon/conffiles
/etc/avahi/avahi-daemon.conf
/etc/avahi/services/http.service
/etc/avahi/services/ssh.service
endef

define Package/avahi-dnsconfd
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=libavahi
  TITLE:=An Unicast DNS server from mDNS/DNS-SD configuration daemon
  DESCRIPTION:=An Unicast DNS server from mDNS/DNS-SD configuration daemon.\\\
    Avahi is a system which facilitates service discovery on a local network -- \\\
    this means that you can plug your laptop or computer into a network and \\\
    instantly be able to view other people who you can chat with, find printers \\\
    to print to or find files being shared. This kind of technology is already \\\
    found in MacOS X (branded 'Rendezvous', 'Bonjour' and sometimes 'ZeroConf') \\\
    and is very convenient.\\\
    \\\
    This package contains an Unicast DNS server from mDNS/DNS-SD configuration \\\
    daemon, which may be used to configure conventional DNS servers using mDNS \\\
    in a DHCP-like fashion. Especially useful on IPv6.
  URL:=http://www.avahi.org/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -DNDEBUG" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
		ac_cv_func_malloc_0_nonnull=yes \
		ac_cv_func_realloc_0_nonnull=yes \
		ac_cv_func_memcmp_working=yes \
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
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			--enable-shared \
			--enable-static \
			--disable-rpath \
			--with-gnu-ld \
			--disable-glib \
			--disable-qt3 \
			--disable-qt4 \
			--disable-gtk \
			--disable-dbus \
			--enable-expat \
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
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/avahi-daemon/install
	install -d -m0755 $(1)/etc/avahi
	install -m0644 ./files/avahi-daemon.conf $(1)/etc/avahi/
	install -d -m0755 $(1)/etc/avahi/services
	install -m0644 ./files/service-http $(1)/etc/avahi/services/http.service
	install -m0644 ./files/service-ssh $(1)/etc/avahi/services/ssh.service
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/avahi-daemon.init $(1)/etc/init.d/avahi-daemon
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/avahi-daemon $(1)/usr/sbin/
endef

define Package/avahi-dnsconfd/install
	install -d -m0755 $(1)/etc/avahi
	$(CP) $(PKG_INSTALL_DIR)/etc/avahi/avahi-dnsconfd.action $(1)/etc/avahi/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/avahi-dnsconfd $(1)/usr/sbin/
endef

define Package/libavahi/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libavahi-{common,core}.so.* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/avahi-{common,core} $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libavahi-{common,core}.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/avahi-core.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/avahi-core.pc
	$(SED) 's,-L$$$${libdir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/avahi-core.pc
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/avahi-{common,core} \
		$(STAGING_DIR)/usr/lib/libavahi-{common,core}.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/avahi-core.pc
endef

$(eval $(call BuildPackage,libavahi))
$(eval $(call BuildPackage,avahi-daemon))
$(eval $(call BuildPackage,avahi-dnsconfd))
