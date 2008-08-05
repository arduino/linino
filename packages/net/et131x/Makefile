include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=et131x
PKG_VERSION:=1.2.3-3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/et131x
PKG_MD5SUM:=9496422c7d218f27bae1be42a04d122e

include $(INCLUDE_DIR)/package.mk

define KernelPackage/et131x
  SUBMENU:=Network Devices
  TITLE:=Agere ET131x Gigabit Ethernet driver
  URL:=http://sourceforge.net/projects/et131x
  FILES:=$(PKG_BUILD_DIR)/et131x.$(LINUX_KMOD_SUFFIX)
  DEPENDS:=@LINUX_2_6 @PCI_SUPPORT
  AUTOLOAD:=$(call AutoLoad,70,et131x)
endef

define KernelPackage/et131x/description
  This package contains the et131x kernel module.
endef

define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		SUBDIRS="$(PKG_BUILD_DIR)" \
		$(PKG_EXTRA_KCONFIG) \
		EXTRA_CFLAGS="$(PKG_EXTRA_CFLAGS)"
endef

$(eval $(call KernelPackage,et131x))

