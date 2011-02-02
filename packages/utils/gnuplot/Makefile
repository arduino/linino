include $(TOPDIR)/rules.mk

PKG_NAME:=gnuplot
PKG_VERSION:=4.4.0
PKG_RELEASE:=2

PKG_INSTALL=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/gnuplot
PKG_MD5SUM:=e708665bd512153ad5c35252fe499059

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

CONFIGURE_VARS += \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/uClibc++" \
	CXXFLAGS="$$$$CXXFLAGS -fno-builtin -fno-rtti -nostdinc++" \
	LIBS="-nodefaultlibs -luClibc++ -lpthread -lgcc"

define Package/gnuplot
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses +uclibcxx +zlib +libpng +libfreetype +libgd $(INTL_DEPENDS) $(ICONV_DEPENDS)
  TITLE:=A portable command-line driven graphing utility
  URL:=http://sourceforge.net/projects/gnuplot/
endef

define Package/gnuplot/description
  Gnuplot  is a portable command-line driven graphing utility for linux, OS/2, 
  MS Windows, OSX, VMS, and many other platforms.
endef

CONFIGURE_ARGS += \
	--without-x \
	--disable-mouse \
	--without-tutorial \
	--without-row-help \
	--without-lisp-files

define Package/gnuplot/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/gnuplot $(1)/usr/bin/
endef

$(eval $(call BuildPackage,gnuplot))
