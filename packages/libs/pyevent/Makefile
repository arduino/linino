include $(TOPDIR)/rules.mk

PKG_NAME:=pyevent
PKG_VERSION:=0.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pyevent.googlecode.com/files/
PKG_MD5SUM:=584912c92d08bf005283fb29a47a6e4d
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/pyevent
 SECTION:=libs
 CATEGORY:=Libraries
 DEPENDS:=+libevent +python
 TITLE:=Pyevent
 MAINTAINER:=jjones@pavlovmedia.com
 DESCRIPTION:=\
    Python extension module for libevent
 URL=http://code.google.com/p/pyevent/
endef

define Build/Compile
	cd $(PKG_BUILD_DIR); \
	LIBEVENT_HOME='$(STAGING_DIR)/usr/lib' \
	CFLAGS='-I$(STAGING_DIR)/usr/include' \
	LDFLAGS='$(TARGET_LDFLAGS)' \
	$(STAGING_DIR)/usr/bin/hostpython ./setup.py install \
	--prefix=$(PKG_INSTALL_DIR)/usr
endef

define Package/pyevent/install
	$(CP) -R $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,pyevent))
