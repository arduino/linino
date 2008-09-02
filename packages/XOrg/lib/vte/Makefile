include $(TOPDIR)/rules.mk

PKG_NAME:=vte
PKG_VERSION:=0.16.14
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/0.16
PKG_MD5SUM:=9df3e35b81b209952ac1cf7904f7b620
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include/ 

EXTRA_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
               -L$(STAGING_DIR)/usr/lib/libintl/lib \
               -L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/vte
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Virtual Terminal Widget
  URL:=http://developer.gnome.org/arch/gnome/widgets/vte.html
  DEPENDS:=+python +gtk2
endef

define Package/vte/description
VTE is a library (libvte) implementing a terminal emulator widget for GTK+,
and a minimal sample application (vte) using that.  Vte is mainly used in
gnome-terminal, but can also be used to embed a console/terminal in games,
editors, IDEs, etc.
endef

define Build/Configure
	$(call Build/Configure/Default,--without-xft2)
endef

define Build/Compile
	make -C $(PKG_BUILD_DIR)
	make -C $(PKG_BUILD_DIR)/ install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev 
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.{so*,la} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef

define Package/vte/install
	$(INSTALL_DIR) $(1)/usr/share/vte/termcap/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/vte/termcap/* $(1)/usr/share/vte/termcap/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.{so*,a} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/vte/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/vte/* $(1)/usr/lib/vte/
	$(INSTALL_DIR) $(1)/usr/lib/python2.5/site-packages/gtk-2.0/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages/gtk-2.0/*.{so*,a} \
		$(1)/usr/lib/python2.5/site-packages/gtk-2.0/
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef
	
$(eval $(call BuildPackage,vte))


