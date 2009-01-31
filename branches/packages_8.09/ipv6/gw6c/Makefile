# 
# Copyright (C) 2008 OpenWrt.org
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=gw6c
PKG_VERSION:=5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/gw6c
  SECTION:=ipv6
  CATEGORY:=IPv6
  DEPENDS:=+libpthread +ip +kmod-tun +kmod-ipv6 +uclibcxx +radvd
  TITLE:=IPv6 tunnel client software
  URL:=http://www.go6.net
endef

define Package/gw6c/description
  Client to configure an IPv6 tunnel to
  Hexago/freenet6/go6.net's migration broker.
endef

define Build/Prepare
	wget -t1 --timeout=20 -O $(DL_DIR)/$(PKG_NAME)-$(PKG_VERSION).tar.bz2 "http://www.go6.net/4105/file.asp?file_id=136"
	$(INSTALL_DIR) $(PKG_BUILD_DIR)
	bzcat $(DL_DIR)/$(PKG_NAME)-$(PKG_VERSION).tar.bz2 | $(TAR) -C $(PKG_BUILD_DIR) -xvf -
	$(CP) $(PKG_BUILD_DIR)/gw6c/src/gw6c-config/gw6cconfig/gw6c_c_wrapper.h $(PKG_BUILD_DIR)/gw6c/src/gw6c/include
endef

GW6C_OPTS:= \
	C_COMPILER="$(TARGET_CC) -c -DNO_STDLIBCXX" \
	COMPILER="$(TARGET_CROSS)g++ -c -DNO_STDLIBCXX" \
	CPP_FLAGS="$(TARGET_CFLAGS) -fno-builtin -nostdinc++ -I. -Wall -DNDEBUG -I$(STAGING_DIR)/usr/include/uClibc++ -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
	RANLIB="$(TARGET_CROSS)ranlib" \
	ARCHIVER="$(TARGET_CROSS)ar" \
	C_LINKER="$(TARGET_CC)" \
	LINKER="$(TARGET_CROSS)g++" \
	exportdir=$(PKG_BUILD_DIR)/gw6c/src/gw6c \
	export

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/gw6c/src/gw6c-config \
		$(GW6C_OPTS)
	$(MAKE) -C $(PKG_BUILD_DIR)/gw6c/src/gw6c-messaging \
		$(GW6C_OPTS)
	$(MAKE) -C $(PKG_BUILD_DIR)/gw6c/src/gw6c \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -fno-builtin -Wall -I$(PKG_BUILD_DIR)/gw6c/src/gw6c/include \
			-I$(PKG_BUILD_DIR)/gw6c/src/gw6c/platform/openwrt -I$(PKG_BUILD_DIR)/gw6c/src/gw6c" \
		LDFLAGS="-L$(PKG_BUILD_DIR)/gw6c/src/gw6c/gw6cconfig \
			-L$(PKG_BUILD_DIR)/gw6c/src/gw6c/gw6cmessaging \
			-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -nodefaultlibs -luClibc++ $(LIBGCC_S)" \
		target="openwrt" \
		installdir="$(PKG_INSTALL_DIR)"
endef

define Package/gw6c/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/gw6c/src/gw6c/bin/$(PKG_NAME) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/usr/share/gw6c/template
	$(CP) ./files/openwrt.sh $(1)/usr/share/gw6c/template
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/gw6c.init $(1)/etc/init.d/gw6c
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/gw6c.config $(1)/etc/config/gw6c
endef

$(eval $(call BuildPackage,gw6c))
