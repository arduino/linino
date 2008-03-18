include $(TOPDIR)/rules.mk

PKG_NAME:=ndyndns
PKG_VERSION:=1.12
PKG_RELEASE:=1

PKG_SOURCE:=ndyndns-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ndyndns.googlecode.com/files
PKG_MD5SUM:=1ca356cf366cd617fe3fb5fad9eb961b

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

MAKE_FLAGS:=PLATFORM=linux

define Package/ndyndns
	SECTION:=net
	CATEGORY:=Network
	TITLE:=DynDNS.com update daemon
	URL:=http://ndyndns.googlecode.com/
	DEPENDS:=+libcurl +libopenssl
endef

define Package/ndyndns/description 
	The ndyndns daemon is an update client for DynDNS.com. It
	checks for an IP address change every two minutes, avoids
	unnecessary updates, reports errors, logs to syslog, and
	generally complies with everything required of a proper dyndns
	client.
endef

define Package/ndyndns/conffiles
/etc/ndyndns/ndyndns.conf.sample
/etc/default/ndyndns
endef

define Package/ndyndns/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ndyndns $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc/default
	$(INSTALL_BIN) files/$(PKG_NAME).default $(1)/etc/default/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc/$(PKG_NAME)
	$(INSTALL_CONF) files/$(PKG_NAME).conf.sample $(1)/etc/$(PKG_NAME)
endef

$(eval $(call BuildPackage,ndyndns))
