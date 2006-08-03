# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=knock
PKG_VERSION:=0.5
PKG_RELEASE:=1
PKG_MD5SUM:=ca09d61458974cff90a700aba6120891

PKG_SOURCE_URL:=http://www.zeroflux.org/knock/files/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/knock
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap
  TITLE:=A port-knocking client
  DESCRIPTION:=It listens to all traffic on an ethernet (or PPP) interface,\\\
looking for special "knock" sequences of port-hits. A client\\\
makes these port-hits by sending a TCP (or UDP) packet to a\\\
port on the server. This port need not be open -- since\\\
knockd listens at the link-layer level, it sees all traffic\\\
even if it's destined for a closed port. When the server\\\
detects a specific sequence of port-hits, it runs a command\\\
defined in its configuration file. This can be used to open\\\
up holes in a firewall for quick access.\\\
  URL:=http://www.zeroflux.org/cgi-bin/cvstrac/knock/wiki
endef

define Package/knockd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap
  TITLE:=A port-knocking server
  DESCRIPTION:=It listens to all traffic on an ethernet (or PPP) interface,\\\
looking for special "knock" sequences of port-hits. A client\\\
makes these port-hits by sending a TCP (or UDP) packet to a\\\
port on the server. This port need not be open -- since\\\
knockd listens at the link-layer level, it sees all traffic\\\
even if it's destined for a closed port. When the server\\\
detects a specific sequence of port-hits, it runs a command\\\
defined in its configuration file. This can be used to open\\\
up holes in a firewall for quick access.\\\
  URL:=http://www.zeroflux.org/cgi-bin/cvstrac/knock/wiki
endef

define Package/knockd/conffiles
/etc/knockd.conf
endef


define Build/Configure
        (cd $(PKG_BUILD_DIR); rm -rf config.cache; \
                $(TARGET_CONFIGURE_OPTS) \
                CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
                LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
                ac_cv_lib_pcap_pcap_open_live=yes \
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
                        --sysconfdir=/etc/kismet \
                        $(DISABLE_LARGEFILE) \
                        $(DISABLE_NLS) \
                        --enable-shared \
                        --disable-static \
                        --disable-rpath \
                        --with-gnu-ld \
        );
endef
	
define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CFLAGS="-I$(STAGING_DIR)/usr/include" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef
	
define Package/knock/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/knock $(1)/usr/bin/
endef

define Package/kockd/install
	install -d -m0755 $(1)/etc
	install -m0600 $(PKG_INSTALL_DIR)/etc/knockd.conf $(1)/etc/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/knockd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,knock))
$(eval $(call BuildPackage,knockd))
