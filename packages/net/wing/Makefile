#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=wing

ifneq ($(CONFIG_WING_STABLE),)
	PKG_VERSION:=20100827
	PKG_RELEASE:=2
	PKG_REV:=6f238baa6c4f357f1fe0e55f1b71db7816747b33
else 
	PKG_VERSION:=$(shell date +%Y%m%d)
	PKG_RELEASE:=1
	PKG_REV:=HEAD
endif

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://github.com/create-net/click-wing.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=git

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/wing
	TITLE:=Wireless mesh networking toolkit
	SECTION:=net
	CATEGORY:=Network
	MAINTAINER:=Roberto Riggio (roberto.riggio@create-net.org)
	DEPENDS:=+kmod-tun
	URL:=http://www.wing-project.org/
endef

define Package/wing/Description 
	Wing is a wireless mesh routing software. The routing protocol
	is derived from Roofnet. It supports multiple radio interfaces and
	link quality routing using the ETX, ETT, and WCETT metrics.
endef 

define Package/wing/config
	source "$(SOURCE)/Config.in"
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		rm -rf config.{cache,status}; \
		 ./configure \
			--prefix=/usr \
			--enable-userlevel \
			--enable-wifi \
			--enable-wing \
			--disable-linuxmodule \
	);
	$(MAKE) -C $(PKG_BUILD_DIR) tools elementmap.xml
	(cd $(PKG_BUILD_DIR)/userlevel; \
		../tools/click-mkmindriver/click-mkmindriver -p $(PKG_NAME) -C .. \
		-f $(PKG_BUILD_DIR)/conf/wing/sample.click \
		-A --all -E Discard -E Print -E Null \
		-E InfiniteSource -E RatedSource -E EtherEncap -E UDPIPEncap \
		-E AthdescEncap -E AthdescDecap -E RadiotapDecap -E RadiotapEncap \
		-E ProbeTXRate -E MadwifiRate -E AutoRateFallback \
		-E RoundRobinSched -E DRRSched; \
	)
	(cd $(PKG_BUILD_DIR); \
		rm -rf config.{cache,status} ; \
		$(TARGET_CONFIGURE_OPTS) \
		CXXFLAGS="-static -O2 -MD" CFLAGS="-static -MD" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		./configure \
			--prefix=/usr \
			--target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--enable-tools=mixed \
			--enable-userlevel \
			--enable-wifi \
			--enable-wing \
			--disable-linuxmodule \
	);
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		MINDRIVER=$(PKG_NAME) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/wing/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/wing
	$(INSTALL_DIR) $(1)/usr/share/click
	$(CP) ./files/* $(1)/
	$(CP) $(PKG_BUILD_DIR)/conf/wing/click_config $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/conf/wing/write_handler $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/conf/wing/read_handler $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/$(PKG_NAME)click $(1)/usr/bin/click
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/click-align $(1)/usr/bin/click-align
	$(CP) $(PKG_BUILD_DIR)/conf/wing/*click $(1)/etc/wing/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/click/elementmap.xml $(1)/usr/share/click/elementmap.xml
endef

$(eval $(call BuildPackage,wing))

