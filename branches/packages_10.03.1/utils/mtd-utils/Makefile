# 
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mtd-utils
PKG_REV:=a2d010f8fca904fffa3c6e5a5d148cc96a37a08a
PKG_VERSION:=20090227
PKG_RELEASE:=1.1
PKG_INSTALL:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://git.infradead.org/mtd-utils.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

FILES:= \
	doc_loadbios \
	docfdisk \
	flash_erase \
	flash_eraseall \
	flash_info \
	flash_lock \
	flash_otp_dump \
	flash_otp_info \
	flash_unlock \
	flashcp \
	ftl_check \
	ftl_format \
	jffs2dump \
	mkfs.jffs2 \
	mtd_debug \
	nanddump \
	nandtest \
	nandwrite \
	nftl_format \
	nftldump \
	recv_image \
	rfddump \
	rfdformat \
	serve_image \
	sumtool

ifneq ($(CONFIG_LINUX_2_4),y)
FILES += \
	bin2nand \
	mkbootenv \
	mkfs.ubifs \
	mkpfi \
	nand2bin \
	pddcustomize \
	pfi2bin \
	pfiflash \
	ubiattach \
	ubicrc32 \
	ubicrc32.pl \
	ubidetach \
	ubiformat \
	ubigen \
	ubimirror \
	ubimkvol \
	ubinfo \
	ubinize \
	ubirename \
	ubirmvol \
	ubiupdatevol \
	unubi
endif

define PartGen
define Package/mtd-utils-$(subst _,-,$(1))
  TITLE:=MTD $(1)
  URL:=http://www.linux-mtd.infradead.org/
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=mtd-utils +zlib +liblzo +libuuid
endef
endef

define Package/mtd-utils
  TITLE:=Utilities for flash info/debug
  SECTION:=utils
  CATEGORY:=Utilities
  MENU:=1
endef

define Package/mtd-utils/description
  Utilities for manipulating memory technology devices.
endef

define Package/mtd-utils/install
	true
endef

$(foreach file,$(FILES),$(eval $(call PartGen,$(file))))

MAKE_FLAGS += \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	BUILDDIR="$(PKG_BUILD_DIR)" \
	LDLIBS+="$(LIBGCC_S)" \
	WITHOUT_XATTR=1

ifeq ($(CONFIG_LINUX_2_4),y)
MAKE_FLAGS += \
	SUBDIRS=""
endif

define PartInstall
define Package/mtd-utils-$(subst _,-,$(1))/install
	$(INSTALL_DIR) \
		$$(1)/usr/sbin

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/sbin/$(1) \
		$$(1)/usr/sbin/
endef
endef

$(foreach file,$(FILES),$(eval $(call PartInstall,$(file))))

$(eval $(call BuildPackage,mtd-utils))
$(foreach file,$(FILES),$(eval $(call BuildPackage,mtd-utils-$(subst _,-,$(file)))))
