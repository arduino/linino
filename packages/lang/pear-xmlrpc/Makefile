include $(TOPDIR)/rules.mk

PKG_NAME:=pear-xmlrpc
PKG_VERSION:=1.5.1
PKG_RELEASE:=1

PKG_SOURCE:=XML_RPC-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://download.pear.php.net/package
PKG_MD5SUM:=1b516162ad65971b5fd04a7c279627ec
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/XML_RPC-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/pear-xmlrpc
  DEPENDS:=+php5 +php-pear
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=pear-xmlrpc
  DESCRIPTION:=\
	PHP's PEAR XML_RPC Library
  URL:=http://pear.php.net
endef

define Build/Configure
endef

define Build/Compile
endef


define Package/pear-xmlrpc/install
	$(INSTALL_DIR) $(1)/usr/lib/php/XML
	$(CP) -a \
		$(PKG_BUILD_DIR)/Dump.php \
		$(PKG_BUILD_DIR)/RPC.php \
		$(PKG_BUILD_DIR)/Server.php \
		$(1)/usr/lib/php/XML
endef

$(eval $(call BuildPackage,pear-xmlrpc))
