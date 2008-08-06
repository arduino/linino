#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=clearsilver
PKG_VERSION:=0.10.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.clearsilver.net/downloads/
PKG_MD5SUM:=b8c0c7fbe0ef5e06e0c935f134304d44

include $(INCLUDE_DIR)/package.mk

define Package/clearsilver
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libneon +zlib
  TITLE:=ClearSilver template system
	URL:=http://www.clearsilver.net/
endef

define Package/clearsilver/description
Clearsilver is a fast, powerful, and language-neutral HTML template system. In both static content sites and dynamic HTML applications, it provides a separation between presentation code and application logic which makes working with your project easier.
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
  --disable-wdb \
  --disable-apache \
  --disable-python \
  --disable-perl \
  --disable-ruby \
  --disable-java \
  --disable-csharp \
  --prefix=/usr

MAKE_FLAGS += \
	$(TARGET_CONFIGURE_OPTS) \
	AR="$(AR) cr" \
	LD="$(TARGET_CROSS)ld -o" \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	all install

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/ClearSilver
	$(INSTALL_DIR) $(1)/usr/include/ClearSilver/cs
	$(INSTALL_DIR) $(1)/usr/include/ClearSilver/cgi
	$(INSTALL_DIR) $(1)/usr/include/ClearSilver/util

	$(CP) $(PKG_BUILD_DIR)/ClearSilver.h $(1)/usr/include/ClearSilver/
	$(CP) $(PKG_BUILD_DIR)/cs_config.h $(1)/usr/include/ClearSilver/

	$(CP) $(PKG_BUILD_DIR)/cs/cs.h $(1)/usr/include/ClearSilver/cs/

	$(CP) $(PKG_BUILD_DIR)/cgi/cgi.h $(1)/usr/include/ClearSilver/cgi/
	$(CP) $(PKG_BUILD_DIR)/cgi/cgiwrap.h $(1)/usr/include/ClearSilver/cgi/
	$(CP) $(PKG_BUILD_DIR)/cgi/date.h $(1)/usr/include/ClearSilver/cgi/
	$(CP) $(PKG_BUILD_DIR)/cgi/html.h $(1)/usr/include/ClearSilver/cgi/

	$(CP) $(PKG_BUILD_DIR)/util/neo_err.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/neo_files.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/neo_misc.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/neo_rand.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/ulist.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/neo_hdf.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/neo_str.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/neo_date.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/wildmat.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/neo_hash.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/ulocks.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/rcfs.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/skiplist.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/dict.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/filter.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/neo_net.h $(1)/usr/include/ClearSilver/util/
	$(CP) $(PKG_BUILD_DIR)/util/neo_server.h $(1)/usr/include/ClearSilver/util/

	$(INSTALL_DIR) $(1)/usr/lib

	$(CP) $(PKG_BUILD_DIR)/libs/libneo_cs.a $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/libs/libneo_cgi.a $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/libs/libneo_utl.a $(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/bin

	$(CP) $(PKG_BUILD_DIR)/cs/cs $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/cs/cstest $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/cgi/cs_static.cgi $(1)/usr/bin/
endef

define Package/clearsilver/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libs/libneo_cs.a $(1)/usr/lib/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libs/libneo_cgi.a $(1)/usr/lib/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libs/libneo_utl.a $(1)/usr/lib/
	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cs/cs $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cs/cstest $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cgi/cs_static.cgi $(1)/usr/bin/
endef

$(eval $(call BuildPackage,clearsilver))
