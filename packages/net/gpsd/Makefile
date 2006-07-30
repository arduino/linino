include $(TOPDIR)/rules.mk

PKG_NAME:=gpsd
PKG_VERSION:=2.30
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.berlios.de/gpsd/
PKG_MD5SUM:=dde177174878e8ae6db15f8010da46dd
PKG_CAT:=zcat

PKG_BUILDDEP=libpthread uclibcxx ncurses

include $(INCLUDE_DIR)/package.mk

define Package/gpsd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=gpsd
  DEPENDS:=+libpthread +uclibcxx +ncurses
  DESCRIPTION:=An interface daemon for GPS receivers
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); rm -rf config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CXXFLAGS="$(TARGET_CFLAGS) -fno-builtin -fno-rtti -nostdinc++"  \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-nodefaultlibs -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		LIBS="-luClibc++ -lc -lm -lnotimpl" \
		./configure \
		        --target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--program-prefix="" \
			--program-suffix="" \
			--prefix=/usr \
			--exec-prefix=/usr \
			--bindir=/usr/bin \
			--datadir=/usr/share \
			--includedir=/usr/include \
			--infodir=/usr/share/info \
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			--enable-shared \
			--enable-static \
			--with-gnu-ld \
			--without-x \
        );
endef

define Build/Compile
	$(CP) $(PKG_BUILD_DIR)/libtool $(PKG_BUILD_DIR)/libtool.orig
	sed 's/-lstdc++ //' $(PKG_BUILD_DIR)/libtool.orig > $(PKG_BUILD_DIR)/libtool
	$(MAKE) -C $(PKG_BUILD_DIR) \
		all
endef

define Package/gpsd/install
	install -d -m0755 $(1)/usr/lib
	install -m0755 $(PKG_BUILD_DIR)/.libs/libgps.so* $(1)/usr/lib/
	install -d -m0755 $(1)/usr/sbin/
	install -m0755 $(PKG_BUILD_DIR)/.libs/gpsd $(1)/usr/sbin/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_BUILD_DIR)/gps{,d}.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/libgpsmm.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/.libs/libgps.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf $(STAGING_DIR)/usr/include/gps{,d}.h \
		$(STAGING_DIR)/usr/include/libgpsmm.h \
		$(STAGING_DIR)/usr/lib/libgps.{a,so*} 
endef

$(eval $(call BuildPackage,gpsd))
