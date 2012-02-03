include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=et131x
ifdef CONFIG_LINUX_2_6_25
  PKG_VERSION:=1.2.3-3
  PKG_RELEASE:=1

  PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
  PKG_SOURCE_URL:=@SF/et131x
  PKG_MD5SUM:=9496422c7d218f27bae1be42a04d122e
endif

include $(INCLUDE_DIR)/package.mk

ifdef CONFIG_LINUX_2_6_25
  MODULE:=$(PKG_BUILD_DIR)/et131x.$(LINUX_KMOD_SUFFIX)
  KMOD_BUILD_DIR=$(PKG_BUILD_DIR)
else
  MODULE:=$(LINUX_DIR)/drivers/staging/et131x/et131x.$(LINUX_KMOD_SUFFIX)
  KMOD_BUILD_DIR=$(LINUX_DIR)/drivers/staging/et131x
endif

define KernelPackage/et131x
  SUBMENU:=Network Devices
  TITLE:=Agere ET131x Gigabit Ethernet driver
  URL:=http://sourceforge.net/projects/et131x
  FILES:=$(MODULE)
  KCONFIG:= \
  	CONFIG_ET131X=m \
	CONFIG_ET131X_DEBUG=n
  DEPENDS:=@!LINUX_2_4 @PCI_SUPPORT
  AUTOLOAD:=$(call AutoLoad,70,et131x)
endef

define KernelPackage/et131x/description
  This package contains the et131x kernel module.
endef

ifndef CONFIG_LINUX_2_6_25
  define Build/Prepare
    # nothing to do
  endef
  define Build/Configure
    # nothing to do
  endef
endif

define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		SUBDIRS="$(KMOD_BUILD_DIR)" \
		CONFIG_ET131X=m
endef

$(eval $(call KernelPackage,et131x))

