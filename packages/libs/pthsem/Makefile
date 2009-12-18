
include $(TOPDIR)/rules.mk

PKG_NAME:=pthsem
PKG_VERSION:=2.0.7
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.auto.tuwien.ac.at/~mkoegler/pth/
PKG_MD5SUM:=b277716ee1224ca9925176fa29e1f0c5
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/pthsem
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GNU pth extended with semaphore support
  URL:=http://www.auto.tuwien.ac.at/~mkoegler/index.php/pth
endef

define Package/pthsem/description
  GNU pth is a user mode multi threading library.
  pthsem is an extend version, with support for semaphores added. It can be installed parallel to a normal pth.
endef

MAKE_FLAGS += \
        OPTIM="$(TARGET_CFLAGS)" \
        CFLAGS="$(TARGET_CFLAGS)" \
        DESTDIR="$(PKG_INSTALL_DIR)" \
        all install

define Build/InstallDev
	$(INSTALL_DIR) $(2)/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/pthsem-config \
		$(2)/bin/
	$(SED) \
		's,^\(prefix\|exec_prefix\)=.*,\1=$(STAGING_DIR)/usr,g' \
		$(2)/bin/pthsem-config

	$(INSTALL_DIR) $(1)/usr/include
	$(CP)   $(PKG_INSTALL_DIR)/usr/include/*.h \
		$(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP)   $(PKG_INSTALL_DIR)/usr/lib/libpthsem.{a,la,so*} \
		$(1)/usr/lib/
endef

define Package/pthsem/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpthsem.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,pthsem))
