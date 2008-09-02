include $(TOPDIR)/rules.mk

PKG_NAME:=librsvg
PKG_VERSION:=2.22.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/2.22
PKG_MD5SUM:=aae602677ce201b1a0ed6a0c18c207f2
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

EXTRA_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
               -L$(STAGING_DIR)/usr/lib/libintl/lib/ \
               -L$(STAGING_DIR)/usr/lib/libiconv/lib/
	
define Package/librsvg
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=SVG rendering library
  URL:=http://librsvg.sourceforge.net/
  DEPENDS:=+cairo +libxml2 +glib2 +libcroco
endef

define Package/librsvg/description
librsvg is a high performance SVG rendering library associated with the Gnome Project.
endef

define Build/Configure
  $(call Build/Configure/Default,--disable-mozilla-plugin --with-croco)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR=$(PKG_INSTALL_DIR) \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig/
	$(INSTALL_DIR) $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
endef

define Package/librsvg/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.{so*,a} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/gtk-2.0/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/gtk-2.0/* $(1)/usr/lib/gtk-2.0/
endef
	
$(eval $(call BuildPackage,librsvg))


