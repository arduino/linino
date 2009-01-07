#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=gsm
PKG_VERSION:=1.0.10
PKG_RELEASE:=3

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-1.0-pl10
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.cs.tu-berlin.de/pub/local/kbs/tubmik/gsm/
PKG_MD5SUM:=4b148480f82e96d274248e13880ec873

include $(INCLUDE_DIR)/package.mk

define Package/libgsm
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A GSM transcoding library
  URL:=ftp://ftp.cs.tu-berlin.de/pub/local/kbs/tubmik/gsm/
endef

define Package/libgsm/description
A GSM 06.10 full-rate speech transcoding implementation (library).
	An implementation of the European GSM 06.10 provisional standard 
	for full-rate speech transcoding, prI-ETS 300 036, which uses 
	RPE/LTP (residual pulse excitation/long term prediction) coding 
	at 13 kbit/s.
endef

define Package/gsm-utils
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libgsm
  TITLE:=GSM transcoding utilities
  URL:=ftp://ftp.cs.tu-berlin.de/pub/local/kbs/tubmik/gsm/
endef

define Package/gsm-utils/description
A GSM 06.10 full-rate speech transcoding implementation (utilities).
	An implementation of the European GSM 06.10 provisional standard 
	for full-rate speech transcoding, prI-ETS 300 036, which uses 
	RPE/LTP (residual pulse excitation/long term prediction) coding 
	at 13 kbit/s.
endef

define Build/Configure
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		LD="$(TARGET_CC)" \
		COPTS="$(TARGET_CFLAGS)" \
		INSTALL_ROOT="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libgsm/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgsm.so.* $(1)/usr/lib/
endef

define Package/gsm-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/toast $(1)/usr/bin/
	(cd $(1)/usr/bin; ln -sf toast untoast; ln -sf toast tcat)
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include/gsm
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gsm.h $(1)/usr/include/gsm/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgsm.{a,so*} $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libgsm))
$(eval $(call BuildPackage,gsm-utils))
