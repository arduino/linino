include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=@BASE_NAME@
PKG_NAME:=@NAME@
PKG_RELEASE:=1
PKG_VERSION:=@VER@

_DEPEND:=@DEP@

include ../common.mk

ifeq ("$(PKG_NAME)","font-util-X11R7.1")
define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/ 
endef
endif

$(eval $(call BuildPackage,$(PKG_NAME)))
