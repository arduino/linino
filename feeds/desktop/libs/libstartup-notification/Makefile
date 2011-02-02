include $(TOPDIR)/rules.mk

PKG_NAME:=startup-notification
PKG_VERSION:=0.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/0.9
PKG_MD5SUM:=624b42f1fac5a12c543a079e2cd3b366
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

EXTRA_CFLAGS+=-I$(ICONV_PREFIX)/include \
			  -I$(INTL_PREFIX)/include

EXTRA_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
			   -L$(ICONV_PREFIX)/lib/ \
			   -L$(INTL_PREFIX)/lib/

define Package/libstartup-notification
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=libstartup-notification
  URL:=http://freedesktop.org/wiki/Software/startup-notification
  DEPENDS:=+libX11 +libSM +libICE +libXt
endef

define Build/Configure
	$(call Build/Configure/Default, \
		, \
		lf_cv_sane_realloc=no \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib/pkgconfig,include/startup-notification-1.0/libsn}

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libstartup-notification-1.{so*,la,a} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/startup-notification-1.0/libsn/*.h \
		$(1)/usr/include/startup-notification-1.0/libsn/
endef

define Package/libstartup-notification/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libstartup-notification-1.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libstartup-notification))
