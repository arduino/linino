# $Id: Makefile 3843 2006-05-30 18:55:52Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=libpthread
PKG_VERSION:=0.9.8
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libpthread
SECTION:=libs
CATEGORY:=Libraries
TITLE:=A POSIX thread library
DESCRIPTION:=A POSIX thread library
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/libpthread/install
	install -m0755 -d $(1)/lib
	$(CP) $(STAGING_DIR)/lib/libpthread.so.* $(1)/lib/
	$(CP) $(STAGING_DIR)/lib/libpthread-*.so $(1)/lib/
endef

define Build/InstallDev
endef
	
define Build/UninstallDev
endef

$(eval $(call BuildPackage,libpthread))
