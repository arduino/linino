# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=wol
PKG_VERSION:=0.7.1
PKG_RELEASE:=1
PKG_MD5SUM:=c2fa9d7e771134ac8c89d56b8197d4ca

PKG_SOURCE_URL:=@SF/ahh
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/wol
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Wake On LAN client
  DESCRIPTION:=\
  	wol implements Wake On LAN functionality in a small program.\
	It wakes up hardware that is Magic Packet compliant.
  URL:=http://ahh.sourceforge.net/wol/
endef


define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -rf config.{cache,status} ; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		./configure \
		  ac_cv_func_malloc_0_nonnull=yes \
		  ac_cv_func_realloc_0_nonnull=yes \
		  ac_cv_func_mmap_fixed_mapped=yes \
		  jm_cv_func_working_malloc=yes \
		  ac_cv_func_alloca_works=yes \
		  --target=$(GNU_TARGET_NAME) \
		  --host=$(GNU_TARGET_NAME) \
		  --build=$(GNU_HOST_NAME) \
		  --program-prefix="" \
		  --program-suffix="" \
		  --prefix=/usr \
		  --exec-prefix=/usr \
		  --bindir=/usr/bin \
		  --datadir=/usr/share \
		  --includedir=/usr/include \
		  --infodir=/usr/share/info \
		  --libdir=/usr/lib \
		  --libexecdir=/usr/lib \
		  --localstatedir=/var \
		  --mandir=/usr/share/man \
		  --sbindir=/usr/sbin \
		  --sysconfdir=/etc \
		  $(DISABLE_NLS) \
		  $(DISABLE_LARGEFILE) \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC=$(TARGET_CC) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/wol/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/wol $(1)/usr/bin/
	$(RSTRIP) $(1)
endef

$(eval $(call BuildPackage,wol))
