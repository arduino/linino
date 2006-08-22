# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=openswan
PKG_VERSION:=2.4.6
PKG_RELEASE:=2
PKG_MD5SUM:=b34d71ca49dedad017879b0e912d40dd

PKG_SOURCE_URL:=http://www.openswan.org/download
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_CAT:=zcat

include $(TOPDIR)/package/rules.mk

ifeq ($(KERNEL_DIR),)
KERNEL_DIR:=$(LINUX_DIR)
endif

$(eval $(call PKG_template,KMOD_OPENSWAN,kmod-openswan,$(LINUX_VERSION)$(BOARD)+$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH),kernel ($(LINUX_VERSION)-$(BOARD)-$(KERNEL_RELEASE))))

FLAGS := $(TARGET_CFLAGS) -I$(PKG_BUILD_DIR)/linux/include -L$(STAGING_DIR)/usr/lib -I$(STAGING_DIR)/usr/include

$(PKG_BUILD_DIR)/.built:
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		KERNELSRC="$(KERNEL_DIR)" \
		ARCH="mips" \
		USERCOMPILE="$(FLAGS)" \
		AS="$(TARGET_CC) -c $(TARGET_CFLAGS)" \
		module

$(IPKG_KMOD_OPENSWAN):
	mkdir -p $(IDIR_KMOD_OPENSWAN)/lib/modules/$(LINUX_VERSION)
	cp $(PKG_BUILD_DIR)/modobj/ipsec.*o $(IDIR_KMOD_OPENSWAN)/lib/modules/$(LINUX_VERSION)/
	$(IPKG_BUILD) $(IDIR_KMOD_OPENSWAN) $(PACKAGE_DIR)
