# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ncurses
PKG_VERSION:=5.2
PKG_RELEASE:=8

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/ncurses
PKG_MD5SUM:=464d6a49010cf2a6eb9ce59a264d4d47
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libncurses
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Terminal handling library
  DESCRIPTION:=Terminal handling library
  URL:=http://www.gnu.org/software/ncurses/
endef

define Build/Configure
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		./configure \
			--target=$(GNU_HOST_NAME) \
			--host=$(GNU_HOST_NAME) \
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
			$(DISABLE_NLS) \
			$(DISABLE_LARGEFILE) \
			--enable-echo \
			--enable-const \
			--enable-overwrite \
			--disable-rpath \
			--without-ada \
			--without-cxx \
			--without-cxx-binding \
			--without-debug \
			--without-profile \
			--with-progs \
			--with-normal \
			--without-shared \
			--with-terminfo-dirs=/usr/share/terminfo \
			--with-default-terminfo-dir=/usr/share/terminfo \
	);
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		libs install.progs
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		ac_cv_linux_vers="2" \
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
			$(DISABLE_NLS) \
			$(DISABLE_LARGEFILE) \
			--enable-echo \
			--enable-const \
			--enable-overwrite \
			--disable-rpath \
			--without-ada \
			--without-cxx \
			--without-cxx-binding \
			--without-debug \
			--without-profile \
			--without-progs \
			--with-normal \
			--with-shared \
			--with-terminfo-dirs=/usr/share/terminfo \
			--with-default-terminfo-dir=/usr/share/terminfo \
	);
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		BUILD_CC="$(TARGET_CC)" \
		HOSTCC="$(HOSTCC)" \
		HOSTCCFLAGS="" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		libs install.libs install.data
endef

define Package/libncurses/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{ncurses,panel,menu}*.so.* $(1)/usr/lib/
	install -d -m0755 $(1)/usr/share/terminfo
	for file in a/ansi d/dumb l/linux r/rxvt s/screen v/vt100 v/vt102 x/xterm x/xterm-color; do \
		install -d -m0755 $(1)/usr/share/terminfo/`dirname $$$$file`; \
		$(CP) $(PKG_INSTALL_DIR)/usr/share/terminfo/$$$$file \
			$(1)/usr/share/terminfo/$$$$file; \
	done
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/curses.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/ncurses.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/menu.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/panel.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/term{,cap}.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/unctrl.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcurses.so $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{ncurses,panel,menu}.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/curses.h \
		$(STAGING_DIR)/usr/include/ncurses.h \
		$(STAGING_DIR)/usr/include/menu.h \
		$(STAGING_DIR)/usr/include/panel.h \
		$(STAGING_DIR)/usr/include/term{,cap}.h \
		$(STAGING_DIR)/usr/include/unctrl.h \
		$(STAGING_DIR)/usr/lib/libcurses.so \
		$(STAGING_DIR)/usr/lib/lib{ncurses,panel,menu}.{a,so*}
endef

$(eval $(call BuildPackage,libncurses))
