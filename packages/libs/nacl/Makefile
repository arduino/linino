include $(TOPDIR)/rules.mk

PKG_NAME:=nacl
PKG_VERSION:=20100830
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://hyperelliptic.org/nacl
PKG_MD5SUM:=3f3cfd76d223068856fd987e3e6732a5

include $(INCLUDE_DIR)/package.mk

define Package/nacl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=NaCl Networking and Cryptography library
  URL:=http://nacl.cace-project.eu/
endef

define Build/Compile
	cp do-openwrt $(PKG_BUILD_DIR)
	( \
		cd $(PKG_BUILD_DIR); \
		chmod +x do-openwrt; \
			CC="$(TARGET_CC)" \
			CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS)" \
			AR="$(TARGET_CROSS)ar" \
			RANLIB="$(TARGET_CROSS)ranlib" \
			./do-openwrt \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/nacl
	$(CP) $(PKG_BUILD_DIR)/build/include/*.h $(1)/usr/include/nacl/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/build/lib/libnacl.a $(1)/usr/lib/
endef

$(eval $(call BuildPackage,nacl))
