include $(TOPDIR)/rules.mk

PKG_NAME:=gamin
PKG_VERSION:=0.1.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/0.1
PKG_MD5SUM:=2e2d9ea71f34e0aa22a700ddbff05385
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

EXTRA_CFLAGS+=-I$(ICONV_PREFIX)/include \
			  -I$(INTL_PREFIX)/include

EXTRA_LDFLAGS+=-L$(ICONV_PREFIX)/lib/ \
			   -L$(INTL_PREFIX)/lib/
#               -Wl,-rpath-link=$(STAGING_DIR)/usr/lib \


define Package/libgamin
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libgamin
  URL:=http://www.gnome.org/~veillard/gamin/
  DEPENDS:=+glib2
endef

define Package/gamin-server
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=gamin-server
  URL:=http://www.gnome.org/~veillard/gamin/
  DEPENDS:=+glib2 +libgamin
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--libexecdir=/usr/lib/gamin \
		--disable-debug \
		--enable-server \
		--without-python \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib/pkgconfig,include/}

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,la,a} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/*.h \
		$(1)/usr/include/
endef

define Package/libgamin/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
endef

define Package/gamin-server/install
	$(INSTALL_DIR) $(1)/usr/lib/gamin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/gamin/gam_server \
		$(1)/usr/lib/gamin/
endef

$(eval $(call BuildPackage,libgamin))
$(eval $(call BuildPackage,gamin-server))
