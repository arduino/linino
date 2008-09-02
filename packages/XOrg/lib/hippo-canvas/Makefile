include $(TOPDIR)/rules.mk

PKG_NAME:=hippo-canvas
PKG_VERSION:=0.3.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_VERSION)/0.3/
PKG_MD5SUM:=9a0f64eb0258a3e8ba710eff9798a7d0
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include/

define Package/hippo-canvas
  SECTION:=xorg-libs
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=Hippo Canvas
  URL:=http://developer.mugshot.org/wiki/Hippo_Canvas
  DEPENDS:=+librsvg +python +gtk2 +cairo +libcroco +pango
endef

define Package/hippo-canvas/description
The Hippo Canvas is a Cairo/GObject/GTK+ based canvas, written in C with
support for flexible layout, CSS styling, and initial work on animations.
endef

define Build/Configure
	$(call Build/Configure/Default, --enable-python)
endef

define Build/Compile
	make -C $(PKG_BUILD_DIR)
	make -C $(PKG_BUILD_DIR)/ install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.{so*,a} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/python2.5/site-packages/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages/*.{so*,a,la} $(1)/usr/lib/python2.5/site-packages/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig/
	$(INSTALL_DIR) $(1)/usr/include/hippo-canvas-1/hippo/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/include/hippo-canvas-1/hippo/* $(1)/usr/include/hippo-canvas-1/hippo/
endef

define Package/hippo-canvas/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.{so*,a} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/python2.5/site-packages/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages/*.{so*,a} $(1)/usr/lib/python2.5/site-packages/
endef

$(eval $(call BuildPackage,hippo-canvas))

