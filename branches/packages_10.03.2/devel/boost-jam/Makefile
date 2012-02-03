#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=boost-jam
PKG_VERSION:=3.1.17
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=@SF/boost
PKG_MD5SUM:=f4afd896788f2327fd35c128ddc6e340
PKG_HOST_ONLY:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/boost-jam
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=Boost JAM
  BUILDONLY:=1
  URL:=http://www.boost.org
endef

define Host/Compile
	# bjam does not provide a configure-script nor a Makefile
	( cd $(HOST_BUILD_DIR) ; ./build.sh gcc )
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/bin
	$(CP) $(HOST_BUILD_DIR)/bin.*/bjam $(STAGING_DIR_HOST)/bin/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,boost-jam))
