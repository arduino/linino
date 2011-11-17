include $(TOPDIR)/rules.mk

PKG_NAME:=gconf2
PKG_VERSION:=2.24.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/GConf-$(PKG_VERSION)
PKG_SOURCE:=GConf-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/GConf/2.24
PKG_MD5SUM:=4971d96f5ba94fe4a69396267bd5afe8

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

PKG_BUILD_DEPENDS:=orbit2/host intltool/host

PKG_INSTALL=1

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/libgconf2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GConf2 library
  URL:=http://www.gnome.org/projects/gconf/
  DEPENDS:=+orbit2 +glib2 +dbus +libdbus-glib +libxml2
endef

define Package/libgconf2/description
GConf is a configuration database system for storing application preferences.
endef

define Package/gconf2
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=GConf2 command line utils
  URL:=http://www.gnome.org/projects/gconf/
  DEPENDS:=+libgconf2
endef

define Package/gconf2/description
GConf is a configuration database system for storing application preferences.
endef

define Build/Configure
	$(call Build/Configure/Default, \
	    --disable-gtk \
	)
	find $(PKG_BUILD_DIR) -name Makefile -exec sed -i 's,ORBIT_IDL.*orbit-idl-2,ORBIT_IDL = $(STAGING_DIR_HOST)/bin/orbit-idl-2,g' {} \; # tell gconf2 to use the host-built idl-compiler
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{include/gconf/2/gconf,lib/pkgconfig,share/aclocal}

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/gconf/2/gconf/* \
		$(1)/usr/include/gconf/2/gconf/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgconf-2.{so*,la,a} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/aclocal/* \
		$(1)/usr/share/aclocal/
endef

define Package/libgconf2/install
	$(INSTALL_DIR) $(1)/etc/gconf
	$(CP) \
		$(PKG_INSTALL_DIR)/etc/gconf/* \
		$(1)/etc/gconf/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgconf-2.so* \
		$(1)/usr/lib/

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/gconfd-2 \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/GConf/2
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/GConf/2/libgconfbackend-xml.so \
		$(1)/usr/lib/GConf/2/

	$(INSTALL_DIR) $(1)/usr/share/dbus-1/services
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/dbus-1/services/* \
		$(1)/usr/share/dbus-1/services/
endef

define Package/gconf2/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,libgconf2))
$(eval $(call BuildPackage,gconf2))
