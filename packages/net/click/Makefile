# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=click
PKG_VERSION:=cvs.2006.03.02
PKG_RELEASE:=1
PKG_MD5SUM:=7aed4ba94926010d76febb797b288e98

ROOFNET_VERSION:=0.0.1

PKG_SOURCE_URL:=http://pdos.csail.mit.edu/~jbicket/click_snapshots/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/click
  SECTION:=net
  CATEGORY:=Network
  MENU:=1
  TITLE:=The Click Modular Router
  DESCRIPTION:=The Click Modular Router
  URL:=http://pdos.csail.mit.edu/click/
endef

define Package/roofnet
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=click
  TITLE:=roofnet mesh networking scripts
  DESCRIPTION:=roofnet mesh networking scripts
  URL:=http://pdos.csail.mit.edu/roofnet/
endef

CONF_OPTS= \
		ac_cv_int64_t=no \
		ac_cv_sizeof_off_t=4

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		$(CONF_OPTS) \
		./configure; \
		cp include/click/config.h include/click/config-host.h; \
		rm -rf config.{cache,status} ; \
		$(TARGET_CONFIGURE_OPTS) \
		CXXFLAGS="-static -O2 -MD" \
		CFLAGS="-static -MD" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
		$(CONF_OPTS) \
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
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(CONF_OPTS) \
	$(MAKE) -C $(PKG_BUILD_DIR) \
		BUILD_CXX="g++ -include $(PKG_BUILD_DIR)/include/click/config-host.h" \
		tools elementmap.xml
	(cd $(PKG_BUILD_DIR)/userlevel; \
		../tools/click-mkmindriver/click-mkmindriver -p roofnet -C .. \
			-f $(PKG_BUILD_DIR)/conf/wifi/sample.click \
			-A --all -E IPNameInfo -E FromHost -E ToHost -E Discard; \
		$(MAKE) -f Makefile.roofnet; \
	)
endef

define Package/click/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/userlevel/roofnetclick $(1)/usr/bin/click 
	$(CP) $(PKG_BUILD_DIR)/tools/click-align/click-align $(1)/usr/bin/click-align
endef

define Package/roofnet/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/conf/wifi/gen_config_roofnet.sh $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/conf/wifi/srcr.click $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/conf/wifi/read_handler $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/conf/wifi/write_handler $(1)/usr/bin
	mkdir -p $(1)/etc/init.d
	install -m 755 ./files/S50roofnet $(1)/etc/init.d/
endef

$(eval $(call BuildPackage,click))
$(eval $(call BuildPackage,roofnet))
