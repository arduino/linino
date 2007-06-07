include $(TOPDIR)/rules.mk

PKG_NAME:=pear-db
PKG_VERSION:=1.7.11
PKG_RELEASE:=1

PKG_SOURCE:=DB-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://download.pear.php.net/package
PKG_MD5SUM:=a57302138757500706e075a4d3d87ef7
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/DB-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/pear-db
  DEPENDS:=+php5 +php-pear
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=pear-db
  DESCRIPTION:=\
  	pear-db
  URL:=http://pear.php.net
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/pear-db/install
	$(INSTALL_DIR) $(1)/usr/lib/php
	$(CP) -a $(PKG_BUILD_DIR)/DB.php $(PKG_BUILD_DIR)/DB \
		$(1)/usr/lib/php
endef

$(eval $(call BuildPackage,pear-db))
