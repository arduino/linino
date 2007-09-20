include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=@BASE_NAME@
PKG_NAME:=@NAME@
PKG_RELEASE:=1
PKG_VERSION:=@VER@

_DEPEND:=@DEP@


include ../common.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
