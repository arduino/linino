include $(TOPDIR)/rules.mk

PKG_NAME:=libnfc
PKG_VERSION:=1.2.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://libnfc.googlecode.com/files/
PKG_MD5SUM:=90ce5d0445c6228f0e80ae3b62709f96

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/libnfc/Default
  TITLE:=Near Field Communication (NFC) library
  URL:=http://www.libnfc.org
endef

define Package/libnfc
  $(call Package/libnfc/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libpcsclite +libusb +pcscd +ccid
endef

define Package/libnfc/description
  libnfc is a free software library used to communicate with NFC 
  capable devices or tags. It support the four main NFC modulations:
  * ISO14443-A (NXP MIFARE),
  * ISO14443-B,
  * JIS X 6319-4 (Sony Felica) and
  * Jewel Topaz (Innovision Research & Development).
  Supported NFC hardware devices are theorically all readers based 
  on the NXP PN53x NFC Controller.
endef

define Package/nfc-tools
  $(call Package/libnfc/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libnfc
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libnfc $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnfc.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libnfc.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libnfc/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnfc.so.* $(1)/usr/lib/
endef

define Package/nfc-tools/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/nfc-anticol $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/nfc-list $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/nfc-mftool $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/nfc-relay $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/nfc-emulate $(1)/usr/bin/
endef

$(eval $(call BuildPackage,libnfc))
$(eval $(call BuildPackage,nfc-tools))
