# 
# Copyright (C) 2008 OpenWrt.org
#

# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=lftp
PKG_VERSION:=3.7.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://ftp.yars.free.net/pub/source/lftp/
PKG_MD5SUM:=7b1c58a6289448140b1cd328e1d51f94

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/lftp
  SUBMENU:=FTP
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libncurses +libopenssl +libreadline +uclibcxx
  TITLE:=lftp
  URL:=http://lftp.yar.ru/
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

define Build/Compile
        $(MAKE) -C $(PKG_BUILD_DIR) \
                LD="\$$$$(CC)" \
                all
endef

define Package/lftp/install 
	$(INSTALL_DIR) $(1)/usr/bin 
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/lftp $(1)/usr/bin 
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
