#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=click
PKG_VERSION:=cvs.2006.03.02
PKG_RELEASE:=1
PKG_MD5SUM:=7aed4ba94926010d76febb797b288e98

ROOFNET_VERSION:=0.0.1

PKG_SOURCE_URL:=http://pdos.csail.mit.edu/~jbicket/click_snapshots/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/click
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=@BROKEN
  MENU:=1
  TITLE:=The Click Modular Router
  URL:=http://www.read.cs.ucla.edu/click/
endef

define Package/click/description
The Click Modular Router
endef

define Package/roofnet
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=@BROKEN click
  TITLE:=roofnet mesh networking scripts
  URL:=http://pdos.csail.mit.edu/roofnet/
endef

define Package/roofnet/description
roofnet mesh networking scripts
endef

BUILDOPTS = \
		BUILD_CXX="g++ -I $(PKG_BUILD_DIR)/include-host" \
		BUILD_DL_LIBS="-ldl"

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		rm -rf config.{cache,status} ; \
		CONFIG_SITE= \
		./configure; \
		rm -rf include-host; \
		$(CP) include include-host; \
		rm -rf config.{cache,status} ; \
		$(TARGET_CONFIGURE_OPTS) \
		CXXFLAGS="-static -Os -MD" \
		CFLAGS="-static -MD" \
		CPPFLAGS="$(TARGET_CPPFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		$(BUILDOPTS) \
		./configure \
		  --prefix=/usr \
		  --target=$(GNU_TARGET_NAME) \
		  --host=$(GNU_TARGET_NAME) \
		  --build=$(GNU_HOST_NAME) \
		  --enable-wifi \
		  --disable-linuxmodule \
		  --enable-tools=mixed \
	   	  --disable-dynamic-linking \
	)
endef


define Build/Compile
	$(CONF_OPTS) \
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(BUILDOPTS) \
		tools elementmap.xml
	(cd $(PKG_BUILD_DIR)/userlevel; \
		../tools/click-mkmindriver/click-mkmindriver -p roofnet -C .. \
			-f $(PKG_BUILD_DIR)/conf/wifi/sample.click \
			-A --all -E IPNameInfo -E FromHost -E ToHost -E Discard; \
		$(MAKE) -f Makefile.roofnet; \
	)
endef

define Package/click/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/userlevel/roofnetclick $(1)/usr/bin/click 
	$(CP) $(PKG_BUILD_DIR)/tools/click-align/click-align $(1)/usr/bin/click-align
endef

define Package/roofnet/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/conf/wifi/gen_config_roofnet.sh $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/conf/wifi/srcr.click $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/conf/wifi/read_handler $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/conf/wifi/write_handler $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/roofnet.init $(1)/etc/init.d/roofnet
endef

$(eval $(call BuildPackage,click))
$(eval $(call BuildPackage,roofnet))
