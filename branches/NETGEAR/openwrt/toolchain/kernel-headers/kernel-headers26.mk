# linux kernel headers for toolchain

LINUX_HEADERS_VERSION=2.6.11.2
LINUX_KERNEL_MD5SUM:=2d21d8e7ff641da74272b114c786464e
LINUX_HEADERS_SITE=http://ep09.pld-linux.org/~mmazur/linux-libc-headers \
		   http://mirrors.angelinacounty.net/pub/lfs/lfs-packages/conglomeration/linux-libc-headers
LINUX_HEADERS_SOURCE=linux-libc-headers-$(LINUX_HEADERS_VERSION).tar.bz2
LINUX_HEADERS_CONFIG=./linux26.config
LINUX_HEADERS_ARCH:=$(shell echo $(ARCH) | sed -e 's/i[3-9]86/i386/' \
	-e 's/mipsel/mips/' \
	-e 's/powerpc/ppc/' \
	-e 's/sh[234]/sh/' \
	)

$(DL_DIR)/$(LINUX_HEADERS_SOURCE):
	-mkdir -p $(DL_DIR)
	$(SCRIPT_DIR)/download.pl $(DL_DIR) $(LINUX_HEADERS_SOURCE) $(LINUX_KERNEL_MD5SUM) $(LINUX_HEADERS_SITE)

$(LINUX_HEADERS_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
	mkdir -p $(TOOL_BUILD_DIR)
	bzcat $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
	ln -sf $(LINUX_HEADERS_DIR)-libc-headers-$(LINUX_HEADERS_VERSION) $(LINUX_HEADERS_DIR)
	touch $(LINUX_HEADERS_DIR)/.unpacked

$(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_DIR)/.unpacked
	ln -sf $(LINUX_HEADERS_DIR)-libc-headers-$(LINUX_HEADERS_VERSION)/include/asm-$(LINUX_HEADERS_ARCH) $(LINUX_HEADERS_DIR)/include/asm
	touch $(LINUX_HEADERS_DIR)/.configured

kernel-headers: $(LINUX_HEADERS_DIR)/.configured

kernel-headers-source: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)

kernel-headers-clean: clean
	rm -rf $(LINUX_HEADERS_DIR)

kernel-headers-toolclean:
	rm -rf $(LINUX_HEADERS_DIR)
