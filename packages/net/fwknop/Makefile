include $(TOPDIR)/rules.mk

PKG_NAME:=fwknopd
PKG_VERSION:=2.0.0rc2
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/fwknop-$(PKG_VERSION)
PKG_SOURCE:=fwknop-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.cipherdyne.org/fwknop/download
PKG_MD5SUM:=c78252216fa9627cacf61b453da915a8
PKG_CAT:=zcat
include $(INCLUDE_DIR)/package.mk

define Package/fwknopd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Firewall Knock Operator Daemon
  URL:=http://http://www.cipherdyne.org/fwknop/
  MAINTAINER:=Jonathan Bennett <jbscience87@gmail.com>
  DEPENDS:=+libpcap +libgdbm +iptables
endef

define Package/fwknopd/description
  Firewall Knock Operator Daemon
  Fwknop implements an authorization scheme known as Single Packet
  Authorization (SPA) for Linux systems running iptables.  This
  mechanism requires only a single encrypted and non-replayed
  packet to communicate various pieces of information including
  desired access through an iptables policy. The main application
  of this program is to use iptables in a default-drop stance to
  protect services such as SSH with an additional layer
  of security in order to make the exploitation of vulnerabilities
  (both 0-day and unpatched code) much more difficult.
endef

define Package/conffiles
/etc/fwknop/fwknopd.conf
/etc/fwknop/access.conf
endef

CONFIGURE_ARGS += \
	--disable-client \
	--without-gpgme \
	--with-iptables=/usr/sbin/iptables

define Package/fwknopd/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/extras/fwknop.init.openwrt \
		$(1)/etc/init.d/fwknopd
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/server/.libs/fwknopd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/lib/.libs/libfko.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/etc/fwknop
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/server/fwknopd.conf $(1)/etc/fwknop/
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/server/access.conf $(1)/etc/fwknop/

endef

$(eval $(call BuildPackage,fwknopd))
