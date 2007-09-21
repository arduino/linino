include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=libXv
PKG_NAME:=libXv-X11R7.2
PKG_RELEASE:=1
PKG_VERSION:=1.0.3

_DEPEND:= +libXext-X11R7.2 +videoproto-X11R7.0

include ../common.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
