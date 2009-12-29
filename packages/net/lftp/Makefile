#
# Copyright (C) 2008-2009 OpenWrt.org
#

# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lftp
PKG_VERSION:=4.0.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://lftp.cybermirror.org \
  http://lftp.cybermirror.org/old
PKG_MD5SUM:=5400cad5f91e131ac2ded7c24aea594c

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/lftp
  SUBMENU:=FTP
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libncurses +libopenssl +libreadline +uclibcxx +libexpat
  TITLE:=lftp
  URL:=http://lftp.yar.ru/
endef

define Package/lftp/description
  lftp is sophisticated file transfer program with command line interface. It
  supports FTP, HTTP, FISH, SFTP and FILE (local FS) protocols. GNU Readline
  library is used for input.
endef

# uses GNU configure

CONFIGURE_ARGS += \
	--without-libiconv-prefix \
	--without-libintl-prefix \
	--without-gnutls \
	--without-libresolv \
	--with-openssl="$(STAGING_DIR)/usr" \
	--disable-static

CONFIGURE_VARS += \
        CXXFLAGS="$$$$CXXFLAGS -fno-builtin -I$(STAGING_DIR)/usr/include/uClibc++ -nostdinc++" \
        CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/uClibc++" \
        LDFLAGS="$$$$LDFLAGS" \
        LIBS="-nodefaultlibs -lz -lutil -luClibc++ -lcurses -lgcc $(LIBGCC_S) -ldl" \

MAKE_VARS += \
	LD="\$$$$(CC)" \

define Package/lftp/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/lftp $(1)/usr/bin
endef

define Package/lftp/postinst
# check for real system
if [ -z "$${IPKG_INSTROOT}" ]; then
	if [ ! -e $${IPKG_INSTROOT}/usr/lib/libstdc\+\+.so.6 ]; then
		ln -s $${IPKG_INSTROOT}/usr/lib/libuClibc++.so.0 $${IPKG_INSTROOT}/usr/lib/libstdc\+\+.so.6
	fi
fi

endef

define Package/lftp/postrm
if [ -z "$${IPKG_INSTROOT}" ]; then
        if [ -L $${IPKG_INSTROOT}/usr/lib/libstdc\+\+.so.6 ]; then
		rm $${IPKG_INSTROOT}/usr/lib/libstdc\+\+.so.6
	fi
fi

endef

$(eval $(call BuildPackage,lftp))
