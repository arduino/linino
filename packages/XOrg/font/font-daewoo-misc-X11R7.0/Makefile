include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=font
PKG_NAME:=font-daewoo-misc-X11R7.0
PKG_RELEASE:=1
PKG_VERSION:=1.0.0

_DEPEND:=

include ../common.mk

ifeq ("$(PKG_NAME)","font-util-X11R7.1")
define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/ 
endef
endif

$(eval $(call BuildPackage,$(PKG_NAME)))
