# $Id: Makefile 1146 2005-06-05 13:32:28Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=stunnel
PKG_VERSION:=4.16
PKG_RELEASE:=1
PKG_MD5SUM:=8ea5cae3eeaacc0271b766506b4b9d4a
PKG_SOURCE_URL:=http://www.stunnel.org/download/stunnel/src/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/stunnel
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +libwrap
  TITLE:=SSL TCP Wrapper
  DESCRIPTION:=\
	 Open source SSL TCP Wrapper
  URL:=http://stunnel.org
endef


define Build/Configure
	$(call Build/Configure/Default, \
		--with-random=/dev/urandom \
		--with-threads=fork \
		--with-ssl=$(STAGING_DIR)/usr \
	)
endef

define Build/Compile	
	mkdir -p $(PKG_INSTALL_DIR)/etc/stunnel
	echo '#dummy' > $(PKG_INSTALL_DIR)/etc/stunnel/stunnel.pem
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/stunnel/install	
	$(INSTALL_DIR) $(1)/usr/sbin $(1)/usr/lib $(1)/usr/stunnel
	$(INSTALL_DIR) $(1)/etc/stunnel $(1)/etc/init.d
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/stunnel $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libstunnel.so $(1)/usr/sbin/
	$(CP) ./files/stunnel.conf $(1)/etc/stunnel/stunnel.conf
	$(CP) ./files/stunnel.init $(1)/etc/init.d/S90stunnel
endef

$(eval $(call BuildPackage,stunnel))
