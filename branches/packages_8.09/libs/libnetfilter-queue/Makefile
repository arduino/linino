#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=libnetfilter_queue
PKG_VERSION:=0.0.16

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.netfilter.org/pub/libnetfilter_queue/
PKG_MD5SUM:=b36664e6cd39edbfe46b416a86118add

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/libnetfilter-queue
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=@LINUX_2_6 +libnfnetlink +kmod-nfnetlink-queue
  TITLE:=API to packets queued by the kernel packet filter
  URL:=http://www.netfilter.org/projects/libnetfilter_queue/
endef

define Package/libnetfilter-queue/description
 libnetfilter_queue is a userspace library providing an API to packets
 that have been queued by the kernel packet filter.
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-static \
	--enable-shared \

CONFIGURE_VARS += \
	LIBNFNETLINK_CFLAGS="-I$(STAGING_DIR)/usr/include" \
	LIBNFNETLINK_LIBS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib"

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) all
	$(call libtool_fixup_libdir)
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef


define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/libnetfilter_queue
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/libnetfilter_queue/*.h \
		$(1)/usr/include/libnetfilter_queue/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libnetfilter_queue*.{so*,a,la} \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libnetfilter_queue.pc \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libnetfilter-queue/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnetfilter_queue*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libnetfilter-queue))
