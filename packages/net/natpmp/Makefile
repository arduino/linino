include $(TOPDIR)/rules.mk

PKG_NAME:=natpmp
PKG_VERSION:=0.2.1
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://download.savannah.nongnu.org/releases/natpmp/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=b0b1fea34ecd2c99f75c01a6728c9a7b

PKG_CAT:=zcat
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/natpmp
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+ip
  TITLE:=A daemon implementing NAT-PMP
  URL:=http://savannah.nongnu.org/projects/natpmp
endef

define Package/natpmp/description
  stunnel replacement based on xyssl
endef

define Build/Configure
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CC="$(TARGET_CC)" \
		LD="$(TARGET_CC)" \
		CCFLAGS="$(strip $(TARGET_CFLAGS))" \
		CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
		prefix="$(PKG_INSTALL_DIR)/usr"
	mkdir -p $(PKG_INSTALL_DIR)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/natpmp $(PKG_INSTALL_DIR)/usr/sbin
endef

define Package/natpmp/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/natpmp $(1)/usr/sbin
	$(RSTRIP) $(1)/usr/sbin/natpmp

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/natpmp.config $(1)/etc/config/natpmp
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/natpmp.init $(1)/etc/init.d/natpmp
endef

$(eval $(call BuildPackage,natpmp))
