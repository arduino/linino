include $(TOPDIR)/rules.mk

PKG_NAME:=@NAME@
PKG_RELEASE:=1
PKG_VERSION:=@VER@

_DEPEND:=@DEP@

include ../common.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
