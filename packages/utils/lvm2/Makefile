#
# Copyright (C) 2009, 2010 Stefan Monnier
#
# This is free software, licensed under the GNU General Public License v3+.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=LVM2
PKG_VERSION:=2.02.60
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME).$(PKG_VERSION).tgz
PKG_SOURCE_URL:=ftp://sources.redhat.com/pub/lvm2/
PKG_MD5SUM:=33e0e0f4b4582d495ff619696c634b2a
# 2.02.43 = fc34655706a2aa116b92328b24fad619
# 2.02.44 = 4ed7b99903a6fc5165b7b0b8def42486
# 2.02.53 = f9ae3579bf15467b7f1d7aea8b9ed9b3
# 2.02.60 = 33e0e0f4b4582d495ff619696c634b2a

# OpenWRT normally expects the tarball to expand into
# $(PKG_NAME)-$(PKG_VERSION), and this magic incantation seems to make it
# understand that LVM2's tarball expands into $(PKG_NAME).$(PKG_VERSION).
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME).$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libdevmapper
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=disc
  DEPENDS:=+kmod-dm
  TITLE:=The Linux Kernel Device Mapper userspace library
  URL:=http://sourceware.org/dm/
endef

define Package/libdevmapper/description
  The Linux Kernel Device Mapper is the LVM (Linux Logical Volume Management)
  Team\'s implementation of a minimalistic kernel-space driver that handles
  volume management, while keeping knowledge of the underlying device layout
  in user-space.  This makes it useful for not only LVM, but EVMS, software
  raid, and other drivers that create "virtual" block devices.
  .
  This package contains the (user-space) shared library for accessing the
  device-mapper; it allows usage of the device-mapper through a clean,
  consistent interface (as opposed to through kernel ioctls).
endef

define Package/lvm2
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=disc
  TITLE:=The Linux Logical Volume Manager
  DEPENDS:=+libdevmapper +libreadline
  URL:=http://sourceware.org/lvm2/
endef

define Package/lvm2/description
  This is LVM2, the rewrite of The Linux Logical Volume Manager.  LVM
  supports enterprise level volume management of disk and disk subsystems
  by grouping arbitrary disks into volume groups. The total capacity of
  volume groups can be allocated to logical volumes, which are accessed as
  regular block devices.
endef

# I got problems building with readline, so I originally just disabled it.
# I've since added patch 100-readline-link which fixes the problem instead.
# CONFIGURE_ARGS += --disable-readline

# Apparently we have problems when "read"ing using O_DIRECT, maybe because
# of uClibc.  More specifically, with O_DIRECT lvm becomes erratic, showing
# non-deterministic behavior: `lvs', `pvs' and friends can return anything
# from empty lists, to completely correct result, as well as checksum errors,
# complaints about missing volume groups, ... each run of the command can
# return something different.  The "root" of the problem is (maybe among
# other places) in the "_io" function in dev-io.c, where calls to the "read"
# function often return garbage, although not always.  There's nothing
# obviously wrong with the dev-io.c code, so the bug may just as well be in
# uClibc or in the kernel (it appeared on the MIPS platform and could be
# related to cache coherency issues).
# Debian Lenny's lvm2 also disables O_DIRECT on "arm armeb hppa mips mipsel".
CONFIGURE_ARGS += --disable-o_direct

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/include/libdevmapper.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libdm/ioctl/libdevmapper.so $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_BUILD_DIR)/libdm/libdevmapper.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libdevmapper/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/libdm/libdevmapper.so.* $(1)/usr/lib/
endef

# This rule only installs the `lvm' executable.  Debian also installs
# a whole bunch of symlinks so that instead of `lvm <foo>' you can directly
# run `<foo>'.
define Package/lvm2/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tools/lvm $(1)/sbin/
	$(INSTALL_DIR) $(1)/etc/lvm
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/doc/example.conf $(1)/etc/lvm/lvm.conf
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/lvm2.init $(1)/etc/init.d/lvm2
endef

define Package/lvm2/conffiles
/etc/lvm/lvm.conf
endef

$(eval $(call BuildPackage,libdevmapper))
$(eval $(call BuildPackage,lvm2))
