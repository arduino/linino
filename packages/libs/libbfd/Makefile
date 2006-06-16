# $Id: Makefile 3843 2006-05-30 18:55:52Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=binutils
PKG_VERSION:=2.16.1
PKG_RELEASE:=1
PKG_MD5SUM:=6a9d529efb285071dad10e1f3d2b2967

PKG_SOURCE_URL:=ftp://ftp.gnu.org/gnu/binutils
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(TOPDIR)/package/rules.mk
include $(TOPDIR)/package/kernel.mk

TARGETS:=$(GNU_TARGET_NAME)

define Package/libbfd
SECTION:=libs
CATEGORY:=Libraries
TITLE:=Universal BFD library from GNU binutils
DESCRIPTION:=Universal BFD library from GNU binutils
URL:=$(PKG_SOURCE_URL)
endef

define Build/Configure
$(call Build/Configure/Default,--enable-install-libbfd --enable-commonbfdlib --disable-nls --enable-targets=$(TARGETS),,bfd)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)/bfd \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/usr/* $(STAGING_DIR)/usr/
endef

define Build/UninstallDev
	rm -f \
		$(STAGING_DIR)/usr/include/bfd*.h \
		$(STAGING_DIR)/usr/lib/libbfd*
endef
	
$(eval $(call BuildPackage,libbfd))
