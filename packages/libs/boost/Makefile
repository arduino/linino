#
# Copyright (C) 2009-2010 OpenWrt.org
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
PKG_SOURCE_URL:=@SF/boost
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)_$(PKG_VERSION)
PKG_MD5SUM:=a4fc691c4e7c49b3b9b54a667d8f5529

PKG_BUILD_DEPENDS:=boost-jam/host

include $(INCLUDE_DIR)/package.mk

define Package/boost
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Boost provides free peer-reviewed portable C++ source libraries
  URL:=http://www.boost.org/
endef

define Package/boost-serialization
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Boost-serialization library
  DEPENDS:=+boost
endef

define Package/boost-regex
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Boost-regex library
  DEPENDS:=+boost
endef

define Build/Configure
endef

# bjam does not support anything like DESTDIR
CONFIGURE_PREFIX:=$(PKG_INSTALL_DIR)

define Build/Compile
	( cd $(PKG_BUILD_DIR) ; \
		echo "using gcc : : $(GNU_TARGET_NAME)-gcc : <cflags>$(CFLAGS) <cxxflags>$(CXXFLAGS) <linkflags>$(LDFLAGS) ;" > tools/build/v2/site-config.jam ; \
		bjam \
			'-sBUILD=release <optimization>space <inlining>on <debug-symbols>off' \
			--toolset=gcc --build-type=minimal --layout=system \
			$(patsubst %,--with-regex,$(filter y m,$(CONFIG_PACKAGE_boost-regex))) \
			$(patsubst %,--with-serialization,$(filter y m,$(CONFIG_PACKAGE_boost-serialization))) \
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

$(eval $(call BuildPackage,boost-serialization))
$(eval $(call BuildPackage,boost-regex))
$(eval $(call BuildPackage,boost))
