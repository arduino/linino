#
# Makefile for openvpn-devel
#

include $(TOPDIR)/rules.mk

PKG_NAME:=openvpn-devel
PKG_VERSION:=201026
PKG_RELEASE:=1

PKG_SOURCE:=openvpn-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.secure-computing.net/pub/FreeBSD/ports/openvpn-devel/
PKG_MD5SUM:=b7a1836d033096c4d70f86581c2fc49d

PKG_INSTALL:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/openvpn-devel

include $(INCLUDE_DIR)/package.mk

define Package/openvpn-devel
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+kmod-tun +kmod-ipv6 +libopenssl +liblzo +ip
  TITLE:=Open source VPN solution using SSL (devel version)
  URL:=http://openvpn.net
  SUBMENU:=VPN
endef

define Package/openvpn-devel/conffiles
/etc/config/openvpn
endef

define Package/openvpn-devel/description
	 Open source VPN solution using SSL - DEVEL VERSION, Week $(PKG_VERSION)
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-pthread \
		--disable-debug \
		--disable-plugins \
		--enable-management \
		--disable-socks \
		--enable-password-save \
		--enable-iproute2 \
		--with-iproute-path=/usr/sbin/ip \
		,\
		ac_cv_func_epoll_create=no \
	)
endef

define Package/openvpn-devel/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/openvpn $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) files/openvpn.init $(1)/etc/init.d/openvpn
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) files/openvpn.config $(1)/etc/config/openvpn
	$(INSTALL_DIR) $(1)/etc/openvpn
endef

$(eval $(call BuildPackage,openvpn-devel))
