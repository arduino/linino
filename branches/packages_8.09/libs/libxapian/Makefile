#
# Copyright (C) 2008-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id:

include $(TOPDIR)/rules.mk

PKG_NAME:=xapian-core
PKG_VERSION:=1.0.7
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://oligarchy.co.uk/xapian/$(PKG_VERSION)
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

EXTRA_LDFLAGS+= \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib \

define Package/libxapian
  SECTION:=lib
  CATEGORY:=Libraries
  TITLE:=xapian
  URL:=http://xapian.org
  DEPENDS:=+libstdcpp
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/share/aclocal
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/aclocal/* \
		$(1)/usr/share/aclocal

	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/xapian.h \
		$(1)/usr/include
	$(INSTALL_DIR) $(1)/usr/include/xapian
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/xapian/* \
		$(1)/usr/include/xapian

	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} \
		$(1)/usr/lib/
	$(INSTALL_DIR) $(2)/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/xapian-config \
		$(2)/bin
	$(SED) 's,prefix=",prefix="$(STAGING_DIR),g' $(2)/bin/xapian-config

	#FIXME: Libtool should handle this
	if [ -f $(TOOLCHAIN_DIR)/usr/lib/libstdc++.la ]; then \
	  $(SED) \
		"s,$(STAGING_DIR)/usr/lib/libstdc++,$(TOOLCHAIN_DIR)/usr/lib/libstdc++,g" \
		$(1)/usr/lib/libxapian.la ; \
	else \
	  $(SED) \
		"s,$(STAGING_DIR)/usr/lib/libstdc++,$(TOOLCHAIN_DIR)/lib/libstdc++,g" \
		$(1)/usr/lib/libxapian.la ; \
	fi
endef

define Package/libxapian/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin
endef

$(eval $(call BuildPackage,libxapian))
