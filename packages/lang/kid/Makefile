include $(TOPDIR)/rules.mk

PKG_NAME:=kid
PKG_VERSION:=0.9.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.kid-templating.org/dist/0.9.6/dist
PKG_MD5SUM:=31e7156698a6f214b4067afb9e13728f
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/kid
 SECTION:=lang
 CATEGORY:=Languages
 TITLE:=Kid
 DEPENDS:=+python
 DESCRIPTION:=\
  Kid is a simple template language for XML based vocabularies written in Python.
 URL=http://www.kid-templating.org/
endef

define Build/Compile
	cd $(PKG_BUILD_DIR); \
	CFLAGS='-I$(STAGING_DIR)/usr/include' \
	LDFLAGS='$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib' \
	$(STAGING_DIR)/usr/bin/hostpython ./setup.py install \
	--prefix=$(PKG_INSTALL_DIR)/usr
endef

define Package/kid/install
	$(CP) -R $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,kid))
