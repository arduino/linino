include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=encodings
PKG_NAME:=encodings-X11R7.2
PKG_RELEASE:=1
PKG_VERSION:=1.0.2

_DEPEND:=

include ../common.mk

ifeq ("$(PKG_NAME)","font-util-X11R7.1")
define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/ 
endef
endif

$(eval $(call BuildPackage,$(PKG_NAME)))
