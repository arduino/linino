include $(TOPDIR)/rules.mk

PKG_NAME:=pysqlite
PKG_VERSION:=2.3.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://initd.org/pub/software/pysqlite/releases/2.3/2.3.5/
PKG_MD5SUM:=b4a185e936848370fcc1a5b17755b641
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/pysqlite
 SECTION:=libs
 CATEGORY:=Libraries
 DEPENDS:=+libsqlite3 +python
 TITLE:=Pysqlite
 DESCRIPTION:=\
  pysqlite is a sqlite database adapter for the Python programming language.
 URL=http://www.initd.org/tracker/pysqlite/wiki/pysqlite
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install)
endef

define Package/pysqlite/install
	$(CP) -R $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,pysqlite))
