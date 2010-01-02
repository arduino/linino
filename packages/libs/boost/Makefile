# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# Dude, this "boost" is really one of the most crude stuff I ported yet.

include $(TOPDIR)/rules.mk

PKG_NAME:=boost
PKG_VERSION:=1_38_0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/boost \

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)_$(PKG_VERSION)

PKG_BUILD_DEPENDS:=boost-jam/host

include $(INCLUDE_DIR)/package.mk

define Package/boost
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Boost provides free peer-reviewed portable C++ source libraries
  URL:=http://www.boost.org/
endef

define Build/Configure
endef

# bjam does not support anything like DESTDIR
CONFIGURE_PREFIX:=$(PKG_INSTALL_DIR)

LIBRARIES:= \
	serialization

define Build/Compile
	( cd $(PKG_BUILD_DIR) ; \
		echo "using gcc : : $(GNU_TARGET_NAME)-gcc : <cflags>$(CFLAGS) <cxxflags>$(CXXFLAGS) <linkflags>$(LDFLAGS) ;" > tools/build/v2/site-config.jam ; \
		bjam \
			'-sBUILD=release <optimization>space <inlining>on <debug-symbols>off' \
			--toolset=gcc --build-type=minimal --layout=system \
			$(foreach c, $(LIBRARIES), \
				--with-$(c) \
			) \
			$(CONFIGURE_ARGS) \
			install \
	)
endef

define Package/boost/description
    Boost provides free peer-reviewed portable C++ source libraries
endef

define Build/InstallDev
    $(INSTALL_DIR) $(1)/usr/include/boost $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/include/boost/* $(1)/usr/include/boost/ # copies _all_ header files - independent of <--with-library>-argument above
	$(CP) $(PKG_INSTALL_DIR)/lib/*.a $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/lib/*.so* $(1)/usr/lib/
endef

define Package/boost/install
    $(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/lib/*.so* $(1)/usr/lib/
endef

# TODO: Split libboost into several smaller packages

#define Package/boost-serialization/install
#    $(INSTALL_DIR) $(1)/usr/lib
#	$(CP) $(PKG_INSTALL_DIR)/lib/*serialization*.so* $(1)/usr/lib/
#endef

$(eval $(call BuildPackage,boost))
