#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libnetfilter_queue
PKG_VERSION:=0.0.13

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.netfilter.org/pub/libnetfilter_queue/
PKG_MD5SUM:=660cbfd3dc8c10bf9b1803cd2b688256

include $(INCLUDE_DIR)/package.mk

define Package/libnetfilter-queue
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=@LINUX_2_6 +libnfnetlink
  TITLE:=libnetfilter_queue
  URL:=http://www1.cs.columbia.edu/~angelos/libnetfilter_queue.html
endef

define Package/libnetfilter-queue/description
	libnetfilter_queue is a userspace library providing an API to packets
	that have been queued by the kernel packet filter. It is is part of a system
	that deprecates the old ip_queue / libipq mechanism.
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-static \
	--enable-shared \
	LIBNFNETLINK_CFLAGS="-I$(STAGING_DIR)/usr/include" \
	LIBNFNETLINK_LIBS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib"

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)"


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef


define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/libnetfilter_queue
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/libnetfilter_queue/*.h \
		$(1)/usr/include/libnetfilter_queue/

	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/libnetfilter_queue*.{so.*,la} \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libnetfilter-queue/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/libnetfilter_queue*.{so.*,a} $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libnetfilter-queue))
