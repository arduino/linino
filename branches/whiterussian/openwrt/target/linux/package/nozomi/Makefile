# $Id$
include $(TOPDIR)/rules.mk
include ../../rules.mk

PKG_NAME := kmod-nozomi
PKG_VERSION := 060209
PKG_RELEASE := 1
PKG_MD5SUM:=90e4d8f389a18b5579f7234a23e32e99

PKG_SOURCE_URL := http://www.pharscape.org/3G/
PKG_SOURCE := nozomi_$(PKG_VERSION).tar.gz
PKG_CAT := zcat

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/package/rules.mk

$(eval $(call PKG_template,KMOD_NOZOMI,$(PKG_NAME),$(LINUX_VERSION)-$(BOARD)-$(PKG_RELEASE),$(ARCH),kernel ($(LINUX_VERSION)-$(BOARD)-$(LINUX_RELEASE))))

$(PKG_BUILD_DIR)/.prepared:
	rm -rf $(PKG_BUILD_DIR)
	mkdir -p $(PKG_BUILD_DIR)
	# the .tgz is different - no subdirectory, so do this manually
	zcat $(DL_DIR)/$(PKG_SOURCE) | tar -C $(PKG_BUILD_DIR) $(TAR_OPTIONS) -
	if [ -d ./patches ]; then $(PATCH) $(PKG_BUILD_DIR) ./patches ; fi
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
		EXTRA_CFLAGS="" \
		modules
	touch $@
	
$(IPKG_KMOD_NOZOMI):
	install -m0755 -d $(IDIR_KMOD_NOZOMI)/lib/modules/$(LINUX_VERSION)
	install -m0755 -d $(IDIR_KMOD_NOZOMI)/etc/modules.d
	install -m0755 -d $(IDIR_KMOD_NOZOMI)/etc/init.d
	install -m0755 $(PKG_BUILD_DIR)/S15nozomidev $(IDIR_KMOD_NOZOMI)/etc/init.d/S15nozomidev
	echo "pcmcia_core" > $(IDIR_KMOD_NOZOMI)/etc/modules.d/60-nozomi
	echo "yenta_socket" >> $(IDIR_KMOD_NOZOMI)/etc/modules.d/60-nozomi
	echo "ds" >> $(IDIR_KMOD_NOZOMI)/etc/modules.d/60-nozomi
	echo "noz" >> $(IDIR_KMOD_NOZOMI)/etc/modules.d/60-nozomi
	cp -fpR $(PKG_BUILD_DIR)/noz.o \
		$(IDIR_KMOD_NOZOMI)/lib/modules/$(LINUX_VERSION)
	$(IPKG_BUILD) $(IDIR_KMOD_NOZOMI) $(PACKAGE_DIR)
