# $Id$

include $(TOPDIR)/rules.mk
include ../../rules.mk

PKG_NAME := kmod-diag
PKG_RELEASE := 5
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/package/rules.mk

$(eval $(call PKG_template,KMOD_DIAG,$(PKG_NAME),$(LINUX_VERSION)-$(BOARD)-$(PKG_RELEASE),$(ARCH),kernel ($(LINUX_VERSION)-$(BOARD)-$(LINUX_RELEASE))))

$(PKG_BUILD_DIR)/.prepared:
	mkdir -p $(PKG_BUILD_DIR)
	cp -fpR ./src/* $(PKG_BUILD_DIR)/
	touch $@

$(PKG_BUILD_DIR)/.configured:
	touch $@

$(PKG_BUILD_DIR)/.built:
	$(MAKE) -C "$(KERNEL_DIR)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		ARCH="$(LINUX_KARCH)" \
		PATH="$(TARGET_PATH)" \
		SUBDIRS="$(PKG_BUILD_DIR)" \
		modules
	touch $@
	
$(IPKG_KMOD_DIAG):
	install -m0755 -d $(IDIR_KMOD_DIAG)/lib/modules/$(LINUX_VERSION)
	cp -fpR $(PKG_BUILD_DIR)/diag.o \
		$(IDIR_KMOD_DIAG)/lib/modules/$(LINUX_VERSION)
	$(IPKG_BUILD) $(IDIR_KMOD_DIAG) $(PACKAGE_DIR)

