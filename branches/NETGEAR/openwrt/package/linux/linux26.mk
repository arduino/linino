#############################################################
# $Id$
#
# Linux kernel target for the OpenWRT project
#
# patches are sorted by numbers
# 000	patch between linux-2.4.xx and linux-mips-cvs
# 0xx	linksys patches
# 1xx	OpenWRT patches (diag,compressed,..)
# 2xx	fixes for wl driver integration
# 3xx	kernel feature patches (squashfs,jffs2 compression,..)
# 4xx	patches needed to integrate feature patches
#
#############################################################

LINUX_FORMAT=vmlinux
LINUX_KARCH:=$(shell echo $(ARCH) | sed -e 's/i[3-9]86/i386/' \
	-e 's/mipsel/mips/' \
	-e 's/powerpc/ppc/' \
	-e 's/sh[234]/sh/' \
	)

LINUX_SOURCE=linux-$(LINUX_VERSION).tar.bz2
LINUX_MD5SUM=f00fd1b5a80f52baf9d1d83acddfa325

LINUX_KCONFIG=./linux26.config
LINUX_PATCHES=./kernel-patches26
LINUX_KERNEL_SOURCE=./kernel-source
LINUX_BINLOC=vmlinux
# Used by pcmcia-cs and others
LINUX_SOURCE_DIR=$(LINUX_DIR)-$(LINUX_VERSION)

TARGET_MODULES_DIR=$(TARGET_DIR)/lib/modules/$(LINUX_VERSION)

$(DL_DIR)/$(LINUX_SOURCE):
	$(SCRIPT_DIR)/download.pl $(DL_DIR) $(LINUX_SOURCE) $(LINUX_MD5SUM) http://www.kernel.org/pub/linux/kernel/v2.6

$(LINUX_DIR)/.unpacked: $(DL_DIR)/$(LINUX_SOURCE)
	-mkdir -p $(BUILD_DIR)
	bzcat $(DL_DIR)/$(LINUX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	ln -sf $(LINUX_DIR)-$(LINUX_VERSION) $(LINUX_DIR)
	touch $(LINUX_DIR)/.unpacked

$(LINUX_DIR)/.patched: $(LINUX_DIR)/.unpacked
	$(PATCH) $(LINUX_DIR) $(LINUX_PATCHES)
	touch $(LINUX_DIR)/.patched

$(LINUX_DIR)/.configured: $(LINUX_DIR)/.patched
	-cp $(LINUX_KCONFIG) $(LINUX_DIR)/.config
#	$(SED) "s,^CROSS_COMPILE.*,CROSS_COMPILE=$(KERNEL_CROSS),g;" \
#	  $(LINUX_DIR)/Makefile  \
#	  $(LINUX_DIR)/arch/mips/Makefile
#	$(SED) "s,\-mcpu=,\-mtune=,g;" $(LINUX_DIR)/arch/mips/Makefile
	$(MAKE) -C $(LINUX_DIR) ARCH=$(LINUX_KARCH) oldconfig include/linux/version.h
	touch $(LINUX_DIR)/.configured

$(LINUX_DIR)/$(LINUX_BINLOC): $(LINUX_DIR)/.patched
	$(MAKE) -C $(LINUX_DIR) ARCH=$(LINUX_KARCH) PATH=$(TARGET_PATH) CFLAGS_KERNEL="-fno-delayed-branch " $(LINUX_FORMAT)

$(LINUX_KERNEL): $(LINUX_DIR)/$(LINUX_BINLOC)
	cp -fa $< $@ 
	touch -c $(LINUX_KERNEL)
	
$(LINUX_IMAGE): $(LINUX_KERNEL)
	cat $^ | gzip -9 -c > $@ || (rm -f $@ && false)

$(LINUX_DIR)/.modules_done: $(LINUX_KERNEL) $(LINUX_IMAGE)
	rm -rf $(BUILD_DIR)/modules
	$(MAKE) -C $(LINUX_DIR) ARCH=$(LINUX_KARCH) PATH=$(TARGET_PATH) CFLAGS_KERNEL="-fno-delayed-branch " modules
	$(MAKE) -C $(LINUX_DIR) DEPMOD=true INSTALL_MOD_PATH=$(BUILD_DIR)/modules modules_install
	touch $(LINUX_DIR)/.modules_done

$(STAGING_DIR)/include/linux/version.h: $(LINUX_DIR)/.configured
	mkdir -p $(STAGING_DIR)/include
	tar -ch -C $(LINUX_DIR)/include -f - linux | tar -xf - -C $(STAGING_DIR)/include/
	tar -ch -C $(LINUX_DIR)/include -f - asm | tar -xf - -C $(STAGING_DIR)/include/

$(TARGET_MODULES_DIR): 
	-mkdir -p $(TARGET_MODULES_DIR)

linux: $(LINUX_DIR)/.modules_done $(TARGET_MODULES_DIR)

linux-source: $(DL_DIR)/$(LINUX_SOURCE)

# This has been renamed so we do _NOT_ by default run this on 'make clean'
linuxclean: clean
	rm -f $(LINUX_KERNEL) $(LINUX_IMAGE)
	-$(MAKE) -C $(LINUX_DIR) clean

linux-dirclean:
	rm -f $(BUILD_DIR)/openwrt-kmodules.tar.bz2
	rm -rf $(LINUX_DIR)-$(LINUX_VERSION)
	rm -rf $(LINUX_DIR)
	rm -rf $(BUILD_DIR)/modules
	rm -rf $(BUILD_DIR)/wl
	rm -rf $(BUILD_DIR)/et

